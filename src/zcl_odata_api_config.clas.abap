CLASS zcl_odata_api_config DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE.

  PUBLIC SECTION.
    " Konfiguration für YY1_DUNNINGENTRY API (AR-Automation-Projekt)
    " System: my405410.s4hana.cloud.sap
    " Client: ZCL_ODATA_V2_CLIENT (Standard HTTP CRUD)
    CONSTANTS:
      BEGIN OF dunning_entry,
        comm_scenario  TYPE string VALUE 'ZDUNNING_OUTBOUND',
        service_id     TYPE string VALUE 'ZOBS_DUNNING_API_REST',
        proxy_model_id TYPE string VALUE 'ZSCM_DUNNINGENTRY',
        entity_set     TYPE string VALUE 'YY_1_DUNNING_ENTRY_EXT',
        comm_system_id TYPE string VALUE 'DUNNING_ENTRY_SYS',
        proxy_version  TYPE string VALUE '0001',
      END OF dunning_entry.

    " SAP Workforce Timesheet API (API_MANAGE_WORKFORCE_TIMESHEET, SAP_COM_0027)
    " System: my405410.s4hana.cloud.sap | Scenario: ZCS_ODATA_CRUD_OB
    " Client: ZCL_ODATA_V2_POST_CLIENT (POST-only)
    " time_sheet_operation = 'C' (Create) / 'U' (Update) / 'D' (Delete) im Payload setzen
    CONSTANTS:
      BEGIN OF timesheet_entry,
        comm_scenario  TYPE string VALUE 'ZCS_ODATA_CRUD_OB',
        service_id     TYPE string VALUE 'ZOBS_ODATA_CRUD_REST',
        proxy_model_id TYPE string VALUE 'ZSCM_ODATA_CRUD_TS',
        entity_set     TYPE string VALUE 'TIME_SHEET_ENTRY_COLLECTIO',
        comm_system_id TYPE string VALUE 'ZMV_API_INTF_TEST_SYS',
        proxy_version  TYPE string VALUE '0001',
      END OF timesheet_entry.

    " SAP Attachment Service (API_CV_ATTACHMENT_SRV, SAP_COM_0002)
    " System: my405410.s4hana.cloud.sap | Scenario: ZCS_ODATA_CRUD_OB (shared)
    " Client: ZCL_ATTACHMENT_V2_CLIENT (spezialisiert — FunctionImport + Binary Stream)
    " SCM: ZCL_SCM_ODATA_CRUD_ATTM | Outbound Service: ZOBS_ODATA_CRUD_ATTM_REST
    " entity_set = ATTACHMENT_HARMONIZED_OPER (interner SCM-Name für AttachmentHarmonizedOperationSet)
    CONSTANTS:
      BEGIN OF attachment_srv,
        comm_scenario  TYPE string VALUE 'ZCS_ODATA_CRUD_OB',
        service_id     TYPE string VALUE 'ZOBS_ODATA_CRUD_ATTM_REST',
        proxy_model_id TYPE string VALUE 'ZCL_SCM_ODATA_CRUD_ATTM',
        entity_set     TYPE string VALUE 'ATTACHMENT_HARMONIZED_OPER',
        comm_system_id TYPE string VALUE 'ZMV_API_INTF_TEST_SYS',
        proxy_version  TYPE string VALUE '0001',
      END OF attachment_srv.

    " Neue API hier als weiteren CONSTANTS-Block ergänzen — Vorlage:
    " CONSTANTS:
    "   BEGIN OF <api_name>,
    "     comm_scenario  TYPE string VALUE '<scenario>',
    "     service_id     TYPE string VALUE '<outbound_service>',
    "     proxy_model_id TYPE string VALUE '<scm_proxy_class>',
    "     entity_set     TYPE string VALUE '<entity_set_intern_name>',
    "     comm_system_id TYPE string VALUE '<comm_system_id>',
    "     proxy_version  TYPE string VALUE '0001',
    "   END OF <api_name>.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_odata_api_config IMPLEMENTATION.
ENDCLASS.
