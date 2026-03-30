INTERFACE zif_odata_v2_write
  PUBLIC.

  " Erstellt eine neue Entität (HTTP POST)
  " is_data: vollständige Entity-Struktur mit allen Pflichtfeldern
  " HINWEIS für POST-only APIs (z.B. Timesheet):
  "   Operation-Feld im Payload VOR dem Aufruf setzen — z.B. ls_data-time_sheet_operation = 'C'
  METHODS create_entity
    IMPORTING
      is_data TYPE ANY
    RAISING
      zcx_odata_v2_error.

  " Aktualisiert eine Entität per Key + neue Daten (HTTP PUT/PATCH)
  " is_key: typisierter Entity-Struct mit gesetzten Key-Feldern
  " iv_use_put: ABAP_TRUE = PUT (Standard), ABAP_FALSE = PATCH
  " HINWEIS für POST-only APIs: is_data muss Key-Felder + Operation-Feld enthalten
  "   is_key wird in POST-only Implementierungen ignoriert
  METHODS update_entity
    IMPORTING
      is_key     TYPE ANY
      is_data    TYPE ANY
      iv_use_put TYPE abap_bool DEFAULT abap_true
    RAISING
      zcx_odata_v2_error.

  " Löscht eine Entität per Key (HTTP DELETE)
  " is_key: typisierter Entity-Struct mit gesetzten Key-Feldern
  " HINWEIS für POST-only APIs: is_key muss Operation-Feld auf 'D' gesetzt haben
  "   Implementierung sendet is_key als POST-Payload
  METHODS delete_entity
    IMPORTING
      is_key TYPE ANY
    RAISING
      zcx_odata_v2_error.

ENDINTERFACE.
