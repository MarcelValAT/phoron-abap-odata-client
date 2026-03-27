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

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_odata_api_config IMPLEMENTATION.
ENDCLASS.
