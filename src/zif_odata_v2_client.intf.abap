INTERFACE zif_odata_v2_client
  PUBLIC.

  " Konfigurations-Struct für Client-Erstellung
  " Übergabe via zcl_odata_client_factory=>get_client( is_config = zcl_odata_api_config=>dunning_entry )
  TYPES:
    BEGIN OF ty_config,
      comm_scenario  TYPE string,
      service_id     TYPE string,
      proxy_model_id TYPE string,
      entity_set     TYPE string,
      comm_system_id TYPE string,
      proxy_version  TYPE string,
    END OF ty_config.

  " Filter-Typ für read_list (OData $filter)
  " property_path: ABAP-Feldname GROSSBUCHSTABEN mit Underscores — z.B. 'DUNNING_RUN_DATE'
  " ACHTUNG: NICHT CamelCase! 'DunningRunDate' → Laufzeitfehler 'Eigenschaft nicht gefunden'
  " sign/option/low/high: wie ABAP RANGE-Tabelle (I/E, EQ/NE/LT/LE/GT/GE/BT/CP)
  TYPES:
    BEGIN OF ty_filter,
      property_path TYPE string,
      sign          TYPE c LENGTH 1,
      option        TYPE c LENGTH 2,
      low           TYPE string,
      high          TYPE string,
    END OF ty_filter.
  TYPES tt_filter TYPE STANDARD TABLE OF ty_filter WITH EMPTY KEY.

  " Liest eine Liste von Entitäten mit optionalem Filter, $top und $skip
  " ct_data: typisierte Tabelle des Entity-Typs (z.B. TABLE OF tys_...)
  METHODS read_list
    IMPORTING
      it_filter TYPE tt_filter OPTIONAL
      iv_top    TYPE i         OPTIONAL
      iv_skip   TYPE i         OPTIONAL
    CHANGING
      ct_data   TYPE ANY TABLE
    RAISING
      zcx_odata_v2_error.

  " Liest eine einzelne Entität per Key (navigate_with_key)
  " is_key: typisierter Entity-Struct mit gesetzten Key-Feldern
  METHODS read_entity
    IMPORTING
      is_key  TYPE ANY
    CHANGING
      cs_data TYPE ANY
    RAISING
      zcx_odata_v2_error.

  " Erstellt eine neue Entität (HTTP POST)
  " is_data: typisierter Entity-Struct mit gesetzten Feldern
  METHODS create_entity
    IMPORTING
      is_data TYPE ANY
    RAISING
      zcx_odata_v2_error.

  " Aktualisiert eine Entität (HTTP PUT oder PATCH)
  " is_key: Key-Struct (alle Key-Felder gesetzt)
  " is_data: Daten-Struct (zu ändernde Felder gesetzt)
  " iv_use_put: abap_true = PUT (Vollersatz), abap_false = PATCH (Teilupdate)
  METHODS update_entity
    IMPORTING
      is_key     TYPE ANY
      is_data    TYPE ANY
      iv_use_put TYPE abap_bool DEFAULT abap_true
    RAISING
      zcx_odata_v2_error.

  " Löscht eine Entität per Key (HTTP DELETE)
  " is_key: typisierter Entity-Struct mit gesetzten Key-Feldern
  METHODS delete_entity
    IMPORTING
      is_key TYPE ANY
    RAISING
      zcx_odata_v2_error.

ENDINTERFACE.
