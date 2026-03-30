CLASS zcl_odata_api_config DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE.

  PUBLIC SECTION.
    " Konfiguration für YY1_DUNNINGENTRY API (AR-Automation-Projekt)
    " System: my405410.s4hana.cloud.sap
    CONSTANTS:
      BEGIN OF dunning_entry,
        comm_scenario  TYPE string VALUE 'ZDUNNING_OUTBOUND',
        service_id     TYPE string VALUE 'ZOBS_DUNNING_API_REST',
        proxy_model_id TYPE string VALUE 'ZSCM_DUNNINGENTRY',
        entity_set     TYPE string VALUE 'YY_1_DUNNING_ENTRY_EXT',
        comm_system_id TYPE string VALUE 'DUNNING_ENTRY_SYS',
        proxy_version  TYPE string VALUE '0001',
      END OF dunning_entry.

    " Neue API hier als weiteren CONSTANTS-Block ergänzen:
    " CONSTANTS:
    "   BEGIN OF <api_name>,
    "     comm_scenario  TYPE string VALUE '<scenario>',
    "     service_id     TYPE string VALUE '<service_id>',
    "     proxy_model_id TYPE string VALUE '<scm_proxy_id>',
    "     entity_set     TYPE string VALUE '<entity_set_name>',
    "     comm_system_id TYPE string VALUE '<comm_system_id>',
    "     proxy_version  TYPE string VALUE '0001',
    "   END OF <api_name>.

    " SAP Workforce Timesheet API (API_MANAGE_WORKFORCE_TIMESHEET, SAP_COM_0027)
    " System: my405410.s4hana.cloud.sap | Outbound Scenario: ZCS_ODATA_CRUD_OB
    " POST-only für Writes — ZCL_ODATA_V2_POST_CLIENT verwenden!
    " time_sheet_operation = 'C' (Create) / 'U' (Update) / 'D' (Delete) im Payload setzen
    CONSTANTS:
      BEGIN OF timesheet_entry,
        comm_scenario  TYPE string VALUE 'ZCS_ODATA_CRUD_OB',
        service_id     TYPE string VALUE 'ZOBS_ODATA_CRUD_REST',
        proxy_model_id TYPE string VALUE 'ZSCM_ODATA_CRUD_TS',
        entity_set     TYPE string VALUE 'TimeSheetEntryCollection',
        comm_system_id TYPE string VALUE 'ZMV_API_INTF_TEST_SYS',
        proxy_version  TYPE string VALUE '0001',
      END OF timesheet_entry.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_odata_api_config IMPLEMENTATION.
ENDCLASS.
