CLASS zcl_odata_v2_clnt_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    " Demo-Methode für FI-Beleg-Anhänge (API_CV_ATTACHMENT_SRV)
    " Voraussetzung: Beleg in 'Journalbelege verwalten' öffnen → Reiter 'Anhänge' → PDF hochladen
    METHODS demo_fi_attachment
      IMPORTING out TYPE REF TO if_oo_adt_classrun_out.

ENDCLASS.


CLASS zcl_odata_v2_clnt_demo IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " -----------------------------------------------------------------------
    " Timesheet Client konfigurieren — alle Parameter aus ZCL_ODATA_API_CONFIG
    " → zif_odata_v2_client verwenden (nicht zif_odata_v2_read) damit Read+Write erreichbar
    " -----------------------------------------------------------------------
    TRY.
        DATA lo_client_timesheet TYPE REF TO zif_odata_v2_client.

        lo_client_timesheet = zcl_odata_client_factory=>get_client(
          is_config    = zcl_odata_api_config=>timesheet_entry
          iv_post_only = abap_true ).

        out->write( 'Timesheet Client initialisiert.' ).

      CATCH zcx_odata_v2_error INTO DATA(lx_init_timesheet).
        out->write( |Fehler bei Client-Init: { lx_init_timesheet->get_text( ) }| ).
        RETURN.
    ENDTRY.


    " -----------------------------------------------------------------------
    " 1) READ LIST — erste 5 Timesheet-Einträge lesen
    " -----------------------------------------------------------------------
    TRY.
        DATA lt_entries_timesheet TYPE zscm_odata_crud_ts=>tyt_time_sheet_entry.

        lo_client_timesheet->read_list(
          EXPORTING
              iv_top = 5
          CHANGING
              ct_data = lt_entries_timesheet
        ).

        out->write( |READ LIST (Timesheet): { lines( lt_entries_timesheet ) } Einträge geladen.| ).

        LOOP AT lt_entries_timesheet INTO DATA(ls_entry_timesheet).

          out->write( |PersonWorkAgreementExternalID: { ls_entry_timesheet-person_work_agreement_exte } | &
                      |CompanyCode: {                   ls_entry_timesheet-company_code } | &
                      |TimeSheetRecord: {               ls_entry_timesheet-time_sheet_record } | &
                      |PersonWorkAgreement: {           ls_entry_timesheet-person_work_agreement } | &
                      |TimeSheetDate: {                 ls_entry_timesheet-time_sheet_date } | &
                      |TimeSheetIsReleasedOnSave: {     ls_entry_timesheet-time_sheet_is_released_on } | &
                      |TimeSheetPredecessorRecord: {    ls_entry_timesheet-time_sheet_predecessor_rec } | &
                      |TimeSheetStatus: {               ls_entry_timesheet-time_sheet_status } | &
                      |TimeSheetIsExecutedInTestRun: {  ls_entry_timesheet-time_sheet_is_executed_in } | &
                      |TimeSheetOperation: {            ls_entry_timesheet-time_sheet_operation } | &
                      |odata.etag: {                    ls_entry_timesheet-etag }| ).
        ENDLOOP.

      CATCH zcx_odata_v2_error INTO DATA(lx_timesheet_read_list).
        out->write( |Fehler: { lx_timesheet_read_list->get_text( ) }| ).
        IF lx_timesheet_read_list->previous IS BOUND.
          out->write( |Ursache: { lx_timesheet_read_list->previous->get_text( ) }| ).
        ENDIF.
    ENDTRY.



    " -----------------------------------------------------------------------
    " Dunning Client via Factory — alle Parameter aus ZCL_ODATA_API_CONFIG
    " -----------------------------------------------------------------------
    DATA lo_client TYPE REF TO zif_odata_v2_client.
    " Für Read-only APIs:   DATA lo_client TYPE REF TO zif_odata_v2_client.
    " Für POST-only APIs:   iv_post_only = abap_true

    TRY.
        lo_client = zcl_odata_client_factory=>get_client(
          is_config    = zcl_odata_api_config=>dunning_entry
          iv_post_only = abap_false ).

        out->write( 'Dunning Client initialisiert.' ).

      CATCH zcx_odata_v2_error INTO DATA(lx_init).
        out->write( |Fehler bei Client-Init: { lx_init->get_text( ) }| ).
        RETURN.
    ENDTRY.

    " -----------------------------------------------------------------------
    " 1) READ LIST — erste 5 Mahnung-Einträge lesen
    " -----------------------------------------------------------------------
    out->write( '=== READ LIST ===' ).
    TRY.
        DATA:
          lt_entries TYPE zcl_dunningentry_scm=>tyt_yy_1_dunning_entry_ext_typ,
          lt_filter  TYPE zif_odata_v2_client=>tt_filter.

        " WICHTIG: property_path IMMER GROSSBUCHSTABEN mit Unterstrichen (ABAP-Feldname-Konvention)
        " z.B. 'DUNNING_RUN' und NICHT 'DunningRun' — sonst: Eigenschaft nicht gefunden!
        lt_filter = VALUE #( ( property_path = 'DUNNING_RUN'  sign = 'I' option = 'EQ' low = 'HEHO' )
                             ( property_path = 'COMPANY_CODE' sign = 'I' option = 'EQ' low = '3910' ) ).

        lo_client->read_list(
            EXPORTING
                it_filter = lt_filter
                iv_top    = 5
                iv_skip   = 0
            CHANGING
                ct_data = lt_entries ).

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
        " Key direkt aus READ LIST Ergebnis nehmen — garantiert korrekte Werte für alle 11 Key-Felder.
        " ACHTUNG: Keinen Key manuell hartcodieren! OData braucht alle Key-Felder exakt wie in der DB.
        " Falsche Werte (z.B. '0001000010' statt '1000010') oder ein falsches leeres Feld → HTTP 404.
        IF lt_entries IS INITIAL.
          out->write( 'READ ENTITY: keine Einträge aus READ LIST — übersprungen.' ).
          RETURN.
        ENDIF.

        DATA(ls_key) = lt_entries[ 1 ].  " ersten Eintrag aus READ_LIST als Key verwenden

        DATA ls_result TYPE zcl_dunningentry_scm=>tys_yy_1_dunning_entry_ext_typ.

        lo_client->read_entity(
          EXPORTING is_key  = ls_key
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
        " Key aus READ LIST Ergebnis — alle 11 Felder korrekt
        DATA(ls_upd_key) = lt_entries[ 1 ].

        DATA ls_upd_data TYPE zcl_dunningentry_scm=>tys_yy_1_dunning_entry_ext_typ.
        ls_upd_data-dunning_run_date       = '20240310'.
        ls_upd_data-dunning_run            = 'HEHO'.
        ls_upd_data-financial_account_type = 'D'.
        ls_upd_data-company_code           = '3910'.
        ls_upd_data-customer               = '0001000010'.
        ls_upd_data-dunning_level          = '2'.

        lo_client->update_entity(
          is_key     = ls_upd_key
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
        " Key aus READ LIST Ergebnis — alle 11 Felder korrekt
        DATA(ls_del_key) = lt_entries[ 1 ].

        lo_client->delete_entity( ls_del_key ).
        out->write( 'DELETE ENTITY: Eintrag gelöscht.' ).

      CATCH zcx_odata_v2_error INTO DATA(lx5).
        out->write( |DELETE ENTITY Fehler (erwartet bei read-only): { lx5->get_text( ) }| ).
        IF lx5->previous IS BOUND.
          out->write( |  Ursache: { lx5->previous->get_text( ) }| ).
        ENDIF.
    ENDTRY.

    " -----------------------------------------------------------------------
    " 6) FI-Beleg-Anhänge (API_CV_ATTACHMENT_SRV)
    " -----------------------------------------------------------------------
    out->write( '=== FI ATTACHMENT DEMO ===' ).
    demo_fi_attachment( out ).

    out->write( '=== Demo abgeschlossen ===' ).

  ENDMETHOD.


  METHOD demo_fi_attachment.
    " -----------------------------------------------------------------------
    " Demo: FI-Beleg-Anhänge abrufen und binären Inhalt herunterladen
    "
    " VORAUSSETZUNG (einmalig in SAP):
    "   1. App 'Journalbelege verwalten' öffnen
    "   2. Beleg mit Buchungskreis 3910 suchen
    "   3. Reiter 'Anhänge' → PDF hochladen
    "   4. Belegnummer (10-stellig intern) und Geschäftsjahr notieren
    "
    " TESTDATEN — anpassen:
    DATA(lv_bukrs) = '3910'.
    DATA(lv_belnr) = '0000000000'.   " ← echte Belegnummer eintragen (10-stellig, führende Nullen)
    DATA(lv_gjahr) = '2024'.
    " -----------------------------------------------------------------------

    " LinkedSAPObjectKey prüfen
    DATA(lv_key) = zcl_attachment_v2_client=>build_bkpf_key(
      iv_bukrs = lv_bukrs
      iv_belnr = lv_belnr
      iv_gjahr = lv_gjahr ).
    out->write( |LinkedSAPObjectKey: '{ lv_key }' ({ strlen( lv_key ) } Zeichen)| ).

    TRY.
        " Schritt 1: Client erstellen
        DATA(lo_attm) = NEW zcl_attachment_v2_client(
          is_config = zcl_odata_api_config=>attachment_srv ).

        out->write( 'Attachment Client initialisiert.' ).

        " Schritt 2: Anhang-Metadaten abrufen (GetAllOriginals)
        DATA(lt_attachments) = lo_attm->get_fi_doc_attachments(
          iv_bukrs = lv_bukrs
          iv_belnr = lv_belnr
          iv_gjahr = lv_gjahr ).

        out->write( |Anhänge gefunden: { lines( lt_attachments ) }| ).

        LOOP AT lt_attachments INTO DATA(ls_attm).
          out->write( |  Datei: { ls_attm-file_name } | &
                      |Typ: { ls_attm-mime_type } | &
                      |Größe: { ls_attm-file_size } Byte| ).
        ENDLOOP.

        " Schritt 3: Ersten Anhang herunterladen
        IF lt_attachments IS INITIAL.
          out->write( 'Keine Anhänge gefunden — Beleg in "Journalbelege verwalten" prüfen.' ).
          RETURN.
        ENDIF.

        out->write( 'Lade ersten Anhang herunter...' ).
        DATA(lv_content) = lo_attm->download_attachment( lt_attachments[ 1 ] ).

        out->write( |Anhang heruntergeladen: { xstrlen( lv_content ) } Bytes.| ).
        out->write( |Dateiname: { lt_attachments[ 1 ]-file_name }| ).
        out->write( 'Inhalt kann als xstring direkt als Email-Anhang genutzt werden.' ).

      CATCH zcx_odata_v2_error INTO DATA(lx).
        out->write( |FI Attachment Fehler: { lx->get_text( ) }| ).
        IF lx->previous IS BOUND.
          out->write( |Ursache: { lx->previous->get_text( ) }| ).
        ENDIF.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
