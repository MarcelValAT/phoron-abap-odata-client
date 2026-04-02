CLASS zcl_odata_client_factory DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE.

  " Multiton-Factory für ZIF_ODATA_V2_CLIENT Instanzen.
  " Gleiche Konfiguration = gleiche Instanz (kein doppelter Verbindungsaufbau).
  "
  " Verwendung:
  "   DATA(lo_client) = zcl_odata_client_factory=>get_client(
  "     is_config    = zcl_odata_api_config=>dunning_entry
  "     iv_post_only = abap_false ).
  "
  "   lo_client->read_list( ... ).
  "   lo_client->create_entity( ... ).

  PUBLIC SECTION.
    " Gibt eine gecachte Client-Instanz zurück (oder erstellt eine neue).
    " is_config:    Konfiguration aus ZCL_ODATA_API_CONFIG
    " iv_post_only: abap_true  → ZCL_ODATA_V2_POST_CLIENT (z.B. Timesheet API)
    "               abap_false → ZCL_ODATA_V2_CLIENT (Standard HTTP CRUD)
    CLASS-METHODS get_client
      IMPORTING
        is_config    TYPE zif_odata_v2_client=>ty_config
        iv_post_only TYPE abap_bool DEFAULT abap_false
      RETURNING
        VALUE(ro_client) TYPE REF TO zif_odata_v2_client
      RAISING
        zcx_odata_v2_error.

  PRIVATE SECTION.
    TYPES:
      BEGIN OF ty_cache_entry,
        cache_key TYPE string,
        client    TYPE REF TO zif_odata_v2_client,
      END OF ty_cache_entry.

    " Klassen-Level Cache: comm_scenario#entity_set#post_flag → Client-Instanz
    CLASS-DATA gt_cache TYPE HASHED TABLE OF ty_cache_entry
                         WITH UNIQUE KEY cache_key.

ENDCLASS.


CLASS zcl_odata_client_factory IMPLEMENTATION.

  METHOD get_client.
    " Cache-Schlüssel: Kombination aus Scenario, Entity Set und Client-Typ
    DATA(lv_key) = |{ is_config-comm_scenario }#{ is_config-entity_set }#{ iv_post_only }|.

    " Gecachte Instanz suchen
    READ TABLE gt_cache INTO DATA(ls_entry) WITH TABLE KEY cache_key = lv_key.
    IF sy-subrc = 0 AND ls_entry-client IS BOUND.
      ro_client = ls_entry-client.
      RETURN.
    ENDIF.

    " Neue Instanz erstellen
    IF iv_post_only = abap_true.
      ro_client = NEW zcl_odata_v2_post_client( is_config ).
    ELSE.
      ro_client = NEW zcl_odata_v2_client( is_config ).
    ENDIF.

    " In Cache eintragen
    INSERT VALUE #( cache_key = lv_key client = ro_client ) INTO TABLE gt_cache.
  ENDMETHOD.

ENDCLASS.
