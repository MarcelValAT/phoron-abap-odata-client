CLASS zcl_odata_v2_clnt_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_odata_v2_clnt_demo IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " -----------------------------------------------------------------------
    " Client konfigurieren — alle Parameter aus ZCL_ODATA_API_CONFIG
    " -----------------------------------------------------------------------
    DATA lo_client TYPE REF TO zif_odata_v2_client.

    TRY.
        lo_client = NEW zcl_odata_v2_client(
          iv_comm_scenario  = zcl_odata_api_config=>dunning_entry-comm_scenario
          iv_service_id     = zcl_odata_api_config=>dunning_entry-service_id
          iv_proxy_model_id = zcl_odata_api_config=>dunning_entry-proxy_model_id
          iv_entity_set     = zcl_odata_api_config=>dunning_entry-entity_set
          iv_comm_system_id = zcl_odata_api_config=>dunning_entry-comm_system_id ).

        out->write( 'Client initialisiert.' ).

      CATCH zcx_odata_v2_error INTO DATA(lx_init).
        out->write( |Fehler bei Client-Init: { lx_init->get_text( ) }| ).
        RETURN.
    ENDTRY.

    " -----------------------------------------------------------------------
    " 1) READ LIST — erste 5 Mahnung-Einträge lesen
    " -----------------------------------------------------------------------
    out->write( '=== READ LIST ===' ).
    TRY.
        DATA lt_entries TYPE TABLE OF zcl_dunningentry_scm=>tys_yy_1_dunning_entry_ext_typ.

        lo_client->read_list(
          it_filter = VALUE #(
            ( property_path = 'DunningRun'  sign = 'I' option = 'EQ' low = 'HEHO' )
            ( property_path = 'CompanyCode' sign = 'I' option = 'EQ' low = '3910' ) )
          iv_top    = 5
          iv_skip   = 0
          CHANGING ct_data = lt_entries ).

        out->write( |READ LIST: { lines( lt_entries ) } Einträge geladen.| ).

        LOOP AT lt_entries INTO DATA(ls_entry).
          out->write( |  Kunde: { ls_entry-customer } | &
                      |Mahnstufe: { ls_entry-dunning_level } | &
                      |Datum: { ls_entry-dunning_run_date }| ).
        ENDLOOP.

      CATCH zcx_odata_v2_error INTO DATA(lx).
        out->write( |READ LIST Fehler: { lx->get_text( ) }| ).
        IF lx->previous IS BOUND.
          out->write( |  Ursache: { lx->previous->get_text( ) }| ).
        ENDIF.
    ENDTRY.

    " -----------------------------------------------------------------------
    " 2) READ ENTITY — einzelnen Eintrag per Key lesen
    " -----------------------------------------------------------------------
    out->write( '=== READ ENTITY ===' ).
    TRY.
        " Key als OData Name-Value-Paare (CamelCase Property-Namen aus OData Metadata)
        DATA lt_key TYPE /iwbep/t_mgw_tech_pairs.
        lt_key = VALUE #(
          ( name = 'DunningRunDate'           value = '20240310' )
          ( name = 'DunningRun'               value = 'HEHO' )
          ( name = 'FinancialAccountType'     value = 'D' )
          ( name = 'CompanyCode'              value = '3910' )
          ( name = 'Customer'                 value = '0001000010' )
          ( name = 'Supplier'                 value = '' )
          ( name = 'OneTimeAcctBankAccount'   value = '' )
          ( name = 'CustomerHeadOffice'       value = '' )
          ( name = 'GroupingDunningArea'      value = '' )
          ( name = 'GroupingDunningLevel'     value = '' )
          ( name = 'DunningClerk'             value = '' ) ).

        DATA ls_result TYPE zcl_dunningentry_scm=>tys_yy_1_dunning_entry_ext_typ.

        lo_client->read_entity(
          EXPORTING it_key  = lt_key
          CHANGING  cs_data = ls_result ).

        out->write( |READ ENTITY: Kunde { ls_result-customer } | &
                    |Level { ls_result-dunning_level } | &
                    |Betrag { ls_result-dun_area_acct_balance_dun }| ).

      CATCH zcx_odata_v2_error INTO DATA(lx2).
        out->write( |READ ENTITY Fehler: { lx2->get_text( ) }| ).
        IF lx2->previous IS BOUND.
          out->write( |  Ursache: { lx2->previous->get_text( ) }| ).
        ENDIF.
    ENDTRY.

    " -----------------------------------------------------------------------
    " 3) CREATE ENTITY — neuen Eintrag anlegen
    " TODO: YY1_DUNNINGENTRY ist eine CDS View — Create evtl. nicht unterstützt.
    "       Bei HTTP 405 (Method Not Allowed) ist die API read-only.
    " -----------------------------------------------------------------------
    out->write( '=== CREATE ENTITY (ggf. read-only) ===' ).
    TRY.
        DATA ls_new TYPE zcl_dunningentry_scm=>tys_yy_1_dunning_entry_ext_typ.
        ls_new-dunning_run_date           = '20240310'.
        ls_new-dunning_run                = 'HEHO'.
        ls_new-financial_account_type     = 'D'.
        ls_new-company_code               = '3910'.
        ls_new-customer                   = '0001000010'.
        ls_new-dunning_level              = '1'.

        lo_client->create_entity( ls_new ).
        out->write( 'CREATE ENTITY: Eintrag angelegt.' ).

      CATCH zcx_odata_v2_error INTO DATA(lx3).
        out->write( |CREATE ENTITY Fehler (erwartet bei read-only): { lx3->get_text( ) }| ).
        IF lx3->previous IS BOUND.
          out->write( |  Ursache: { lx3->previous->get_text( ) }| ).
        ENDIF.
    ENDTRY.

    " -----------------------------------------------------------------------
    " 4) UPDATE ENTITY — Eintrag aktualisieren
    " TODO: CDS View-basierte APIs unterstützen Update evtl. nicht (HTTP 405).
    " -----------------------------------------------------------------------
    out->write( '=== UPDATE ENTITY (ggf. read-only) ===' ).
    TRY.
        DATA lt_upd_key TYPE /iwbep/t_mgw_tech_pairs.
        lt_upd_key = VALUE #(
          ( name = 'DunningRunDate'       value = '20240310' )
          ( name = 'DunningRun'           value = 'HEHO' )
          ( name = 'FinancialAccountType' value = 'D' )
          ( name = 'CompanyCode'          value = '3910' )
          ( name = 'Customer'             value = '0001000010' )
          ( name = 'Supplier'             value = '' )
          ( name = 'OneTimeAcctBankAccount' value = '' )
          ( name = 'CustomerHeadOffice'   value = '' )
          ( name = 'GroupingDunningArea'  value = '' )
          ( name = 'GroupingDunningLevel' value = '' )
          ( name = 'DunningClerk'         value = '' ) ).

        DATA ls_upd_data TYPE zcl_dunningentry_scm=>tys_yy_1_dunning_entry_ext_typ.
        ls_upd_data-dunning_run_date       = '20240310'.
        ls_upd_data-dunning_run            = 'HEHO'.
        ls_upd_data-financial_account_type = 'D'.
        ls_upd_data-company_code           = '3910'.
        ls_upd_data-customer               = '0001000010'.
        ls_upd_data-dunning_level          = '2'.

        lo_client->update_entity(
          it_key     = lt_upd_key
          is_data    = ls_upd_data
          iv_use_put = abap_true ).

        out->write( 'UPDATE ENTITY: Eintrag aktualisiert.' ).

      CATCH zcx_odata_v2_error INTO DATA(lx4).
        out->write( |UPDATE ENTITY Fehler (erwartet bei read-only): { lx4->get_text( ) }| ).
        IF lx4->previous IS BOUND.
          out->write( |  Ursache: { lx4->previous->get_text( ) }| ).
        ENDIF.
    ENDTRY.

    " -----------------------------------------------------------------------
    " 5) DELETE ENTITY — Eintrag löschen
    " TODO: CDS View-basierte APIs unterstützen Delete evtl. nicht (HTTP 405).
    " -----------------------------------------------------------------------
    out->write( '=== DELETE ENTITY (ggf. read-only) ===' ).
    TRY.
        DATA lt_del_key TYPE /iwbep/t_mgw_tech_pairs.
        lt_del_key = VALUE #(
          ( name = 'DunningRunDate'       value = '20240310' )
          ( name = 'DunningRun'           value = 'HEHO' )
          ( name = 'FinancialAccountType' value = 'D' )
          ( name = 'CompanyCode'          value = '3910' )
          ( name = 'Customer'             value = '0001000010' )
          ( name = 'Supplier'             value = '' )
          ( name = 'OneTimeAcctBankAccount' value = '' )
          ( name = 'CustomerHeadOffice'   value = '' )
          ( name = 'GroupingDunningArea'  value = '' )
          ( name = 'GroupingDunningLevel' value = '' )
          ( name = 'DunningClerk'         value = '' ) ).

        lo_client->delete_entity( lt_del_key ).
        out->write( 'DELETE ENTITY: Eintrag gelöscht.' ).

      CATCH zcx_odata_v2_error INTO DATA(lx5).
        out->write( |DELETE ENTITY Fehler (erwartet bei read-only): { lx5->get_text( ) }| ).
        IF lx5->previous IS BOUND.
          out->write( |  Ursache: { lx5->previous->get_text( ) }| ).
        ENDIF.
    ENDTRY.

    out->write( '=== Demo abgeschlossen ===' ).

  ENDMETHOD.

ENDCLASS.
