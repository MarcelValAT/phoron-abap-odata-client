CLASS zcl_attachment_v2_client DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  " Spezialisierter Client für API_CV_ATTACHMENT_SRV (Communication Scenario: SAP_COM_0002)
  " Konfiguration: ZCL_ODATA_API_CONFIG=>ATTACHMENT_SRV
  "
  " Zwei-Schritt-Workflow für FI-Beleg-Anhänge (BKPF):
  "
  "   SCHRITT 1: Anhang-Metadaten abrufen
  "     DATA lo TYPE REF TO zcl_attachment_v2_client.
  "     lo = NEW #( is_config = zcl_odata_api_config=>attachment_srv ).
  "     DATA(lt_attm) = lo->get_fi_doc_attachments(
  "       iv_bukrs = '3910'
  "       iv_belnr = '0000123456'
  "       iv_gjahr = '2024' ).
  "
  "   SCHRITT 2: Binären Inhalt herunterladen (PDF etc.)
  "     DATA(lv_pdf) = lo->download_attachment( lt_attm[ 1 ] ).
  "
  "   Danach: lv_pdf als Email-Anhang verwenden (xstring)

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        is_config TYPE zif_odata_v2_client=>ty_config
      RAISING
        zcx_odata_v2_error.

    " Schritt 1: Alle Anhänge zu einem FI-Beleg (BKPF) abfragen
    " Ruft FunctionImport GetAllOriginals mit BusinessObjectTypeName='BKPF'
    "
    " iv_bukrs: Buchungskreis (4-stellig, z.B. '3910')
    " iv_belnr: Belegnummer (10-stellig intern mit führenden Nullen, z.B. '0000123456')
    " iv_gjahr: Geschäftsjahr (4-stellig, z.B. '2024')
    "
    " → LinkedSAPObjectKey wird intern aufgebaut: Bukrs(4) + Belnr(10) + Gjahr(4) = 18 Zeichen
    METHODS get_fi_doc_attachments
      IMPORTING
        iv_bukrs         TYPE string
        iv_belnr         TYPE string
        iv_gjahr         TYPE string
      RETURNING
        VALUE(rt_result) TYPE zcl_scm_odata_crud_attm=>tyt_attachment_content
      RAISING
        zcx_odata_v2_error.

    " Schritt 2: Binären Inhalt eines Anhangs herunterladen
    " is_attachment: Eintrag aus get_fi_doc_attachments Ergebnis
    " → Gibt xstring zurück (PDF-Bytes, kann direkt als Email-Anhang genutzt werden)
    METHODS download_attachment
      IMPORTING
        is_attachment     TYPE zcl_scm_odata_crud_attm=>tys_attachment_content
      RETURNING
        VALUE(rv_content) TYPE xstring
      RAISING
        zcx_odata_v2_error.

    " Hilfsmethode: LinkedSAPObjectKey für BKPF aufbauen
    " Format: Bukrs(4) + Belnr(10 mit führenden Nullen) + Gjahr(4) = 18 Zeichen
    " Beispiel: '3910' + '0000123456' + '2024' = '391000001234562024'
    CLASS-METHODS build_bkpf_key
      IMPORTING
        iv_bukrs      TYPE string
        iv_belnr      TYPE string
        iv_gjahr      TYPE string
      RETURNING
        VALUE(rv_key) TYPE string.

  PRIVATE SECTION.
    DATA mo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy.
    DATA ms_config       TYPE zif_odata_v2_client=>ty_config.

    " Baut den OData-Pfad für AttachmentContentSet/$value aus den Key-Feldern
    CLASS-METHODS build_content_value_path
      IMPORTING
        is_attachment    TYPE zcl_scm_odata_crud_attm=>tys_attachment_content
      RETURNING
        VALUE(rv_path)   TYPE string.

ENDCLASS.


CLASS zcl_attachment_v2_client IMPLEMENTATION.

  METHOD constructor.
    ms_config = is_config.

    TRY.
        DATA lo_dest TYPE REF TO if_http_destination.

        IF is_config-comm_system_id IS INITIAL.
          lo_dest = cl_http_destination_provider=>create_by_comm_arrangement(
            comm_scenario = CONV #( is_config-comm_scenario )
            service_id    = CONV #( is_config-service_id ) ).
        ELSE.
          lo_dest = cl_http_destination_provider=>create_by_comm_arrangement(
            comm_scenario  = CONV #( is_config-comm_scenario )
            comm_system_id = CONV #( is_config-comm_system_id )
            service_id     = CONV #( is_config-service_id ) ).
        ENDIF.

        DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_dest ).

        mo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
            is_proxy_model_key       = VALUE #(
              repository_id       = 'DEFAULT'
              proxy_model_id      = is_config-proxy_model_id
              proxy_model_version = COND #( WHEN is_config-proxy_version IS INITIAL
                                            THEN '0001'
                                            ELSE is_config-proxy_version ) )
            io_http_client           = lo_http_client
            iv_relative_service_root = '' ).

      CATCH cx_http_dest_provider_error
            cx_web_http_client_error
            /IWBEP/CX_GATEWAY INTO DATA(lx).
        RAISE EXCEPTION TYPE zcx_odata_v2_error
          EXPORTING
            iv_operation  = 'INIT'
            iv_entity_set = 'ATTACHMENT_CONTENT_SET'
            previous      = lx.
    ENDTRY.
  ENDMETHOD.


  METHOD get_fi_doc_attachments.
    " LinkedSAPObjectKey aus Buchungskreis + Belegnummer + Geschäftsjahr aufbauen
    DATA(lv_key) = build_bkpf_key(
      iv_bukrs = iv_bukrs
      iv_belnr = iv_belnr
      iv_gjahr = iv_gjahr ).

    TRY.
        " FunctionImport GetAllOriginals aufrufen
        " Interne Name: GET_ALL_ORIGINALS (aus ZCL_SCM_ODATA_CRUD_ATTM=>GCS_FUNCTION_IMPORT)
        DATA(lo_request) = mo_client_proxy
          ->create_resource_for_function_import( zcl_scm_odata_crud_attm=>gcs_function_import-get_all_originals )
          ->create_request( ).

        " Parameter setzen: BusinessObjectTypeName='BKPF', LinkedSAPObjectKey=18-stelliger Key
        lo_request->set_parameter( VALUE zcl_scm_odata_crud_attm=>tys_parameters_3(
          business_object_type_name = 'BKPF'
          linked_sapobject_key      = lv_key ) ).

        " Ausführen und Ergebnis holen
        DATA(lo_response) = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = rt_result ).

      CATCH /iwbep/cx_cp_remote
            /iwbep/cx_gateway
            cx_web_http_client_error INTO DATA(lx).
        RAISE EXCEPTION TYPE zcx_odata_v2_error
          EXPORTING
            iv_operation  = 'GET_ALL_ORIGINALS'
            iv_entity_set = 'ATTACHMENT_CONTENT_SET'
            previous      = lx.
    ENDTRY.
  ENDMETHOD.


  METHOD download_attachment.
    " Pfad für binären Inhalt aufbauen: .../AttachmentContentSet(key_fields)/$value
    DATA(lv_path) = build_content_value_path( is_attachment ).

    TRY.
        " Frische HTTP-Verbindung für binären Download (separate von Proxy-Verbindung)
        DATA lo_dest TYPE REF TO if_http_destination.

        IF ms_config-comm_system_id IS INITIAL.
          lo_dest = cl_http_destination_provider=>create_by_comm_arrangement(
            comm_scenario = CONV #( ms_config-comm_scenario )
            service_id    = CONV #( ms_config-service_id ) ).
        ELSE.
          lo_dest = cl_http_destination_provider=>create_by_comm_arrangement(
            comm_scenario  = CONV #( ms_config-comm_scenario )
            comm_system_id = CONV #( ms_config-comm_system_id )
            service_id     = CONV #( ms_config-service_id ) ).
        ENDIF.

        DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_dest ).

        " Pfad setzen und GET ausführen
        lo_http_client->get_http_request( )->set_uri_path( iv_uri_path = lv_path ).
        DATA(lo_response) = lo_http_client->execute( if_web_http_client=>get ).

        " HTTP-Statuscode prüfen
        DATA(lv_status) = lo_response->get_status( )-code.
        IF lv_status <> 200.
          RAISE EXCEPTION TYPE zcx_odata_v2_error
            EXPORTING
              iv_operation   = 'DOWNLOAD'
              iv_entity_set  = 'ATTACHMENT_CONTENT_SET'
              iv_http_status = lv_status.
        ENDIF.

        " Binären Inhalt lesen
        rv_content = lo_response->get_binary_data( ).

      CATCH cx_http_dest_provider_error
            cx_web_http_client_error INTO DATA(lx).
        RAISE EXCEPTION TYPE zcx_odata_v2_error
          EXPORTING
            iv_operation  = 'DOWNLOAD'
            iv_entity_set = 'ATTACHMENT_CONTENT_SET'
            previous      = lx.
    ENDTRY.
  ENDMETHOD.


  METHOD build_bkpf_key.
    " LinkedSAPObjectKey-Format für BKPF:
    "   Buchungskreis (4 Zeichen) + Belegnummer (10 Zeichen, führende Nullen) + Geschäftsjahr (4 Zeichen)
    "   Beispiel: '3910' + '0000123456' + '2024' = '391000001234562024' (18 Zeichen)
    DATA(lv_bukrs) = |{ iv_bukrs ALIGN = RIGHT WIDTH = 4  PAD = ' ' }|.
    DATA(lv_belnr) = |{ iv_belnr ALIGN = RIGHT WIDTH = 10 PAD = '0' }|.
    DATA(lv_gjahr) = |{ iv_gjahr ALIGN = RIGHT WIDTH = 4  PAD = ' ' }|.
    rv_key = |{ lv_bukrs }{ lv_belnr }{ lv_gjahr }|.
  ENDMETHOD.


  METHOD build_content_value_path.
    " OData V2 Key-URL für AttachmentContentSet/$value aufbauen
    " Alle 8 Key-Felder müssen angegeben werden (single-quoted in OData V2 URL)
    rv_path = |/sap/opu/odata/sap/API_CV_ATTACHMENT_SRV/AttachmentContentSet| &&
              |(DocumentInfoRecordDocType='{ is_attachment-document_info_record_doc_t }',| &&
              |DocumentInfoRecordDocNumber='{ is_attachment-document_info_record_doc_n }',| &&
              |DocumentInfoRecordDocVersion='{ is_attachment-document_info_record_doc_v }',| &&
              |DocumentInfoRecordDocPart='{ is_attachment-document_info_record_doc_p }',| &&
              |LogicalDocument='{ is_attachment-logical_document }',| &&
              |ArchiveDocumentID='{ is_attachment-archive_document_id }',| &&
              |LinkedSAPObjectKey='{ is_attachment-linked_sapobject_key }',| &&
              |BusinessObjectTypeName='{ is_attachment-business_object_type_name }')/$value|.
  ENDMETHOD.

ENDCLASS.
