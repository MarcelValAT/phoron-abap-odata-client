INTERFACE zif_odata_v2_client
  PUBLIC.

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

  TYPES:
    BEGIN OF ty_key_pair,
      name  TYPE string,
      value TYPE string,
    END OF ty_key_pair.
    TYPES tt_key_pairs TYPE STANDARD TABLE OF ty_key_pair WITH EMPTY KEY.

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
  " it_key: Key-Felder als Name-Value-Paare — name = GROSSBUCHSTABEN mit Underscores
  " Beispiel: VALUE #( ( name = 'BUSINESS_PARTNER' value = '0001' ) )
  METHODS read_entity
    IMPORTING
      it_key  TYPE tt_key_pairs
    CHANGING
      cs_data TYPE ANY
    RAISING
      zcx_odata_v2_error.

  " Erstellt eine neue Entität
  " is_data: vollständige Entity-Struktur mit allen Pflichtfeldern
  METHODS create_entity
    IMPORTING
      is_data TYPE ANY
    RAISING
      zcx_odata_v2_error.

  " Aktualisiert eine Entität per Key + neue Daten
  " it_key: Key-Felder als Name-Value-Paare — name = GROSSBUCHSTABEN mit Underscores
  " iv_use_put: ABAP_TRUE = PUT (Standard), ABAP_FALSE = PATCH
  METHODS update_entity
    IMPORTING
      it_key     TYPE tt_key_pairs
      is_data    TYPE ANY
      iv_use_put TYPE abap_bool DEFAULT abap_true
    RAISING
      zcx_odata_v2_error.

  " Löscht eine Entität per Key
  " it_key: Key-Felder als Name-Value-Paare — name = GROSSBUCHSTABEN mit Underscores
  METHODS delete_entity
    IMPORTING
      it_key TYPE tt_key_pairs
    RAISING
      zcx_odata_v2_error.

ENDINTERFACE.
