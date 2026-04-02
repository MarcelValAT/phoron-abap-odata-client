CLASS zcl_odata_v2_post_client DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  " POST-only OData V2 Client — für APIs die alle Writes via POST abwickeln
  " Beispiel: SAP Timesheet API (API_MANAGE_WORKFORCE_TIMESHEET, SAP_COM_0027)
  "   sap:updatable='false' sap:deletable='false' — kein PUT/PATCH/DELETE möglich
  "
  " Consumer-Konvention:
  "   create_entity: Operation-Feld im is_data Payload auf 'C' setzen
  "   update_entity: is_data muss Key-Felder + Operation 'U' enthalten (is_key wird ignoriert)
  "   delete_entity: is_key muss Operation-Feld auf 'D' gesetzt haben

  PUBLIC SECTION.
    INTERFACES zif_odata_v2_read.
    INTERFACES zif_odata_v2_write.

    " Konfiguriert den Client per Communication Arrangement
    METHODS constructor
      IMPORTING
        iv_comm_scenario   TYPE string
        iv_service_id      TYPE string
        iv_proxy_model_id  TYPE string
        iv_entity_set      TYPE string
        iv_comm_system_id  TYPE string OPTIONAL
        iv_proxy_version   TYPE string DEFAULT '0001'
      RAISING
        zcx_odata_v2_error.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy.
    DATA mv_entity_set   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name.

    METHODS build_filter_node
      IMPORTING
        io_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory
        it_filter           TYPE zif_odata_v2_read=>tt_filter
      RETURNING
        VALUE(ro_node)      TYPE REF TO /iwbep/if_cp_filter_node
      RAISING
        zcx_odata_v2_error
        /iwbep/cx_gateway.

ENDCLASS.



CLASS ZCL_ODATA_V2_POST_CLIENT IMPLEMENTATION.


  METHOD constructor.
    mv_entity_set = iv_entity_set.

    TRY.
        DATA lo_dest TYPE REF TO if_http_destination.

        IF iv_comm_system_id IS INITIAL.
          lo_dest = cl_http_destination_provider=>create_by_comm_arrangement(
            comm_scenario = CONV #( iv_comm_scenario )
            service_id    = CONV #( iv_service_id ) ).
        ELSE.
          lo_dest = cl_http_destination_provider=>create_by_comm_arrangement(
            comm_scenario  = CONV #( iv_comm_scenario )
            comm_system_id = CONV #( iv_comm_system_id )
            service_id     = CONV #( iv_service_id ) ).
        ENDIF.

        DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_dest ).

        mo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
            is_proxy_model_key       = VALUE #(
              repository_id       = 'DEFAULT'
              proxy_model_id      = iv_proxy_model_id
              proxy_model_version = iv_proxy_version )
            io_http_client           = lo_http_client
            iv_relative_service_root = '' ).

      CATCH cx_http_dest_provider_error
            cx_web_http_client_error
            /IWBEP/CX_GATEWAY INTO DATA(lx).
        RAISE EXCEPTION TYPE zcx_odata_v2_error
          EXPORTING
            iv_operation  = 'INIT'
            iv_entity_set = iv_entity_set
            previous      = lx.
    ENDTRY.
  ENDMETHOD.


  METHOD build_filter_node.
    DATA lt_filter LIKE it_filter.
    lt_filter = it_filter.
    SORT lt_filter BY property_path.

    DATA lv_prev_path     TYPE string.
    DATA lt_range         TYPE RANGE OF string.
    DATA lo_current_node  TYPE REF TO /iwbep/if_cp_filter_node.

    LOOP AT lt_filter INTO DATA(ls_filter).

      IF ls_filter-property_path <> lv_prev_path AND lv_prev_path IS NOT INITIAL.
        DATA(lo_new_node) = io_filter_factory->create_by_range(
          iv_property_path = lv_prev_path
          it_range         = lt_range ).

        IF lo_current_node IS INITIAL.
          lo_current_node = lo_new_node.
        ELSE.
          lo_current_node = lo_current_node->and( lo_new_node ).
        ENDIF.

        CLEAR lt_range.
      ENDIF.

      APPEND VALUE #(
        sign   = ls_filter-sign
        option = ls_filter-option
        low    = ls_filter-low
        high   = ls_filter-high ) TO lt_range.

      lv_prev_path = ls_filter-property_path.
    ENDLOOP.

    IF lt_range IS NOT INITIAL AND lv_prev_path IS NOT INITIAL.
      DATA(lo_last_node) = io_filter_factory->create_by_range(
        iv_property_path = lv_prev_path
        it_range         = lt_range ).

      IF lo_current_node IS INITIAL.
        ro_node = lo_last_node.
      ELSE.
        ro_node = lo_current_node->and( lo_last_node ).
      ENDIF.
    ELSE.
      ro_node = lo_current_node.
    ENDIF.
  ENDMETHOD.


  METHOD zif_odata_v2_read~read_entity.
    TRY.
        DATA(lo_response) = mo_client_proxy->create_resource_for_entity_set( mv_entity_set )->navigate_with_key( is_key )->create_request_for_read( )->execute( ).

        lo_response->get_business_data( IMPORTING es_business_data = cs_data ).

      CATCH /iwbep/cx_cp_remote
            /iwbep/cx_gateway
            cx_web_http_client_error INTO DATA(lx).
        RAISE EXCEPTION TYPE zcx_odata_v2_error
          EXPORTING
            iv_operation  = 'READ_ENTITY'
            iv_entity_set = CONV #( mv_entity_set )
            previous      = lx.
    ENDTRY.
  ENDMETHOD.


  METHOD zif_odata_v2_read~read_list.
    TRY.
        DATA(lo_request) = mo_client_proxy->create_resource_for_entity_set( mv_entity_set )->create_request_for_read( ).

        IF it_filter IS NOT INITIAL.
          DATA(lo_ff) = lo_request->create_filter_factory( ).
          DATA(lo_filter_node) = build_filter_node(
            io_filter_factory = lo_ff
            it_filter         = it_filter ).
          IF lo_filter_node IS BOUND.
            lo_request->set_filter( lo_filter_node ).
          ENDIF.
        ENDIF.

        IF iv_top IS SUPPLIED AND iv_top > 0.
          lo_request->set_top( iv_top ).
        ENDIF.
        IF iv_skip IS SUPPLIED AND iv_skip > 0.
          lo_request->set_skip( iv_skip ).
        ENDIF.

        DATA(lo_response) = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = ct_data ).

      CATCH /iwbep/cx_cp_remote
            /iwbep/cx_gateway
            cx_web_http_client_error INTO DATA(lx).
        RAISE EXCEPTION TYPE zcx_odata_v2_error
          EXPORTING
            iv_operation  = 'READ_LIST'
            iv_entity_set = CONV #( mv_entity_set )
            previous      = lx.
    ENDTRY.
  ENDMETHOD.


  METHOD zif_odata_v2_write~create_entity.
    " POST mit Operation 'C' — Consumer muss Operation-Feld in is_data gesetzt haben
    TRY.
        DATA(lo_request) = mo_client_proxy->create_resource_for_entity_set( mv_entity_set )->create_request_for_create( ).
        lo_request->set_business_data( is_data ).
        lo_request->execute( ).

      CATCH /iwbep/cx_cp_remote
            /iwbep/cx_gateway
            cx_web_http_client_error INTO DATA(lx).
        RAISE EXCEPTION TYPE zcx_odata_v2_error
          EXPORTING
            iv_operation  = 'CREATE_POST'
            iv_entity_set = CONV #( mv_entity_set )
            previous      = lx.
    ENDTRY.
  ENDMETHOD.


  METHOD zif_odata_v2_write~delete_entity.
    " POST mit Operation 'D' — Consumer muss Operation-Feld in is_key auf 'D' gesetzt haben
    TRY.
        DATA(lo_request) = mo_client_proxy->create_resource_for_entity_set( mv_entity_set )->create_request_for_create( ).
        lo_request->set_business_data( is_key ).
        lo_request->execute( ).

      CATCH /iwbep/cx_cp_remote
            /iwbep/cx_gateway
            cx_web_http_client_error INTO DATA(lx).
        RAISE EXCEPTION TYPE zcx_odata_v2_error
          EXPORTING
            iv_operation  = 'DELETE_POST'
            iv_entity_set = CONV #( mv_entity_set )
            previous      = lx.
    ENDTRY.
  ENDMETHOD.


  METHOD zif_odata_v2_write~update_entity.
    " POST mit Operation 'U' — is_key wird ignoriert
    " Consumer muss Key-Felder + Operation 'U' in is_data gesetzt haben
    TRY.
        DATA(lo_request) = mo_client_proxy->create_resource_for_entity_set( mv_entity_set )->create_request_for_create( ).
        lo_request->set_business_data( is_data ).
        lo_request->execute( ).

      CATCH /iwbep/cx_cp_remote
            /iwbep/cx_gateway
            cx_web_http_client_error INTO DATA(lx).
        RAISE EXCEPTION TYPE zcx_odata_v2_error
          EXPORTING
            iv_operation  = 'UPDATE_POST'
            iv_entity_set = CONV #( mv_entity_set )
            previous      = lx.
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
