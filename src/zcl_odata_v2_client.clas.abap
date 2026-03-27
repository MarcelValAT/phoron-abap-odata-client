CLASS zcl_odata_v2_client DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_odata_v2_client.

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
    " Kompatibler Range-Typ für OData Filter-Factory create_by_range()
    TYPES:
      BEGIN OF ty_range_entry,
        sign   TYPE c LENGTH 1,
        option TYPE c LENGTH 2,
        low    TYPE string,
        high   TYPE string,
      END OF ty_range_entry.
    TYPES tt_range_entries TYPE STANDARD TABLE OF ty_range_entry WITH EMPTY KEY.

    DATA mo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy.
    DATA mv_entity_set   TYPE string.

    " Baut den OData Filter-Baum aus der generischen Filter-Tabelle
    METHODS build_filter_node
      IMPORTING
        io_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory
        it_filter           TYPE zif_odata_v2_client=>tt_filter
      RETURNING
        VALUE(ro_node)      TYPE REF TO /iwbep/if_cp_filter_node
      RAISING
        zcx_odata_v2_error.

ENDCLASS.


CLASS zcl_odata_v2_client IMPLEMENTATION.

  METHOD constructor.
    mv_entity_set = iv_entity_set.

    TRY.
        " HTTP-Destination aus Communication Arrangement auflösen
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

        " HTTP Client erstellen
        DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_dest ).

        " OData V2 Remote Proxy initialisieren
        mo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
            is_proxy_model_key       = VALUE #(
              repository_id       = 'DEFAULT'
              proxy_model_id      = iv_proxy_model_id
              proxy_model_version = iv_proxy_version )
            io_http_client           = lo_http_client
            iv_relative_service_root = '' ).

      CATCH cx_http_dest_provider_error
            cx_web_http_client_error INTO DATA(lx).
        RAISE EXCEPTION TYPE zcx_odata_v2_error
          EXPORTING
            iv_operation  = 'INIT'
            iv_entity_set = iv_entity_set
            previous      = lx.
    ENDTRY.
  ENDMETHOD.


  METHOD zif_odata_v2_client~read_list.
    TRY.
        " Request für Read List vorbereiten
        DATA(lo_request) = mo_client_proxy->create_resource_for_entity_set( mv_entity_set )
                                          ->create_request_for_read( ).

        " Optionalen Filter setzen
        IF it_filter IS NOT INITIAL.
          DATA(lo_ff) = lo_request->create_filter_factory( ).
          DATA(lo_filter_node) = build_filter_node(
            io_filter_factory = lo_ff
            it_filter         = it_filter ).
          IF lo_filter_node IS BOUND.
            lo_request->set_filter( lo_filter_node ).
          ENDIF.
        ENDIF.

        " Pagination setzen
        IF iv_top IS SUPPLIED AND iv_top > 0.
          lo_request->set_top( iv_top ).
        ENDIF.
        IF iv_skip IS SUPPLIED AND iv_skip > 0.
          lo_request->set_skip( iv_skip ).
        ENDIF.

        " Request ausführen und Ergebnis holen
        DATA(lo_response) = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = ct_data ).

      CATCH /iwbep/cx_cp_remote
            /iwbep/cx_gateway
            /iwbep/cx_cp_configuration
            cx_web_http_client_error INTO DATA(lx).
        RAISE EXCEPTION TYPE zcx_odata_v2_error
          EXPORTING
            iv_operation  = 'READ_LIST'
            iv_entity_set = mv_entity_set
            previous      = lx.
    ENDTRY.
  ENDMETHOD.


  METHOD zif_odata_v2_client~read_entity.
    TRY.
        " Einzelne Entität per Key navigieren und lesen
        DATA(lo_response) = mo_client_proxy
          ->create_resource_for_entity_set( mv_entity_set )
          ->navigate_with_key( it_key )
          ->create_request_for_read( )
          ->execute( ).

        lo_response->get_business_data( IMPORTING es_business_data = cs_data ).

      CATCH /iwbep/cx_cp_remote
            /iwbep/cx_gateway
            /iwbep/cx_cp_configuration
            cx_web_http_client_error INTO DATA(lx).
        RAISE EXCEPTION TYPE zcx_odata_v2_error
          EXPORTING
            iv_operation  = 'READ_ENTITY'
            iv_entity_set = mv_entity_set
            previous      = lx.
    ENDTRY.
  ENDMETHOD.


  METHOD zif_odata_v2_client~create_entity.
    TRY.
        " Neue Entität erstellen
        DATA(lo_request) = mo_client_proxy
          ->create_resource_for_entity_set( mv_entity_set )
          ->create_request_for_create( ).

        lo_request->set_business_data( is_data ).
        lo_request->execute( ).

      CATCH /iwbep/cx_cp_remote
            /iwbep/cx_gateway
            /iwbep/cx_cp_configuration
            cx_web_http_client_error INTO DATA(lx).
        RAISE EXCEPTION TYPE zcx_odata_v2_error
          EXPORTING
            iv_operation  = 'CREATE'
            iv_entity_set = mv_entity_set
            previous      = lx.
    ENDTRY.
  ENDMETHOD.


  METHOD zif_odata_v2_client~update_entity.
    TRY.
        " Update-Semantik wählen: PUT oder PATCH
        DATA(lv_semantic) = COND #(
          WHEN iv_use_put = abap_true
          THEN /iwbep/if_cp_request_update=>gcs_update_semantic-put
          ELSE /iwbep/if_cp_request_update=>gcs_update_semantic-patch ).

        " Entität per Key navigieren und updaten
        DATA(lo_request) = mo_client_proxy
          ->create_resource_for_entity_set( mv_entity_set )
          ->navigate_with_key( it_key )
          ->create_request_for_update( lv_semantic ).

        lo_request->set_business_data( is_data ).
        lo_request->execute( ).

      CATCH /iwbep/cx_cp_remote
            /iwbep/cx_gateway
            /iwbep/cx_cp_configuration
            cx_web_http_client_error INTO DATA(lx).
        RAISE EXCEPTION TYPE zcx_odata_v2_error
          EXPORTING
            iv_operation  = 'UPDATE'
            iv_entity_set = mv_entity_set
            previous      = lx.
    ENDTRY.
  ENDMETHOD.


  METHOD zif_odata_v2_client~delete_entity.
    TRY.
        " Entität per Key navigieren und löschen
        mo_client_proxy
          ->create_resource_for_entity_set( mv_entity_set )
          ->navigate_with_key( it_key )
          ->create_request_for_delete( )
          ->execute( ).

      CATCH /iwbep/cx_cp_remote
            /iwbep/cx_gateway
            /iwbep/cx_cp_configuration
            cx_web_http_client_error INTO DATA(lx).
        RAISE EXCEPTION TYPE zcx_odata_v2_error
          EXPORTING
            iv_operation  = 'DELETE'
            iv_entity_set = mv_entity_set
            previous      = lx.
    ENDTRY.
  ENDMETHOD.


  METHOD build_filter_node.
    " Sortiere Filter nach property_path für Gruppierung (mehrere Werte pro Property möglich)
    DATA lt_filter LIKE it_filter.
    lt_filter = it_filter.
    SORT lt_filter BY property_path.

    DATA lv_prev_path     TYPE string.
    DATA lt_range         TYPE tt_range_entries.
    DATA lo_current_node  TYPE REF TO /iwbep/if_cp_filter_node.

    LOOP AT lt_filter INTO DATA(ls_filter).

      " Neues Property → vorherigen Range-Block als Filter-Node abschließen
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

      " Aktuellen Eintrag zum Range-Block hinzufügen
      APPEND VALUE #(
        sign   = ls_filter-sign
        option = ls_filter-option
        low    = ls_filter-low
        high   = ls_filter-high ) TO lt_range.

      lv_prev_path = ls_filter-property_path.
    ENDLOOP.

    " Letzten Range-Block abschließen
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

ENDCLASS.
