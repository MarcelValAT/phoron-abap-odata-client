INTERFACE zif_odata_v2_client
  PUBLIC.

  " Kombiniert Read- und Write-Fähigkeiten — Backwards-Compatible Combiner
  " Für reine Lesezugriffe: TYPE REF TO zif_odata_v2_read verwenden
  " Für Standard-CRUD (HTTP Verben): ZCL_ODATA_V2_CLIENT instanziieren
  " Für POST-only APIs (z.B. Timesheet): ZCL_ODATA_V2_POST_CLIENT instanziieren
  INTERFACES zif_odata_v2_read.
  INTERFACES zif_odata_v2_write.

  " Aliases für ergonomischen Aufruf ohne Interface-Prefix
  " Erlaubt: lo_client->read_list(...)  statt  lo_client->zif_odata_v2_read~read_list(...)
  ALIASES ty_filter      FOR zif_odata_v2_read~ty_filter.
  ALIASES tt_filter      FOR zif_odata_v2_read~tt_filter.
  ALIASES read_list      FOR zif_odata_v2_read~read_list.
  ALIASES read_entity    FOR zif_odata_v2_read~read_entity.
  ALIASES create_entity  FOR zif_odata_v2_write~create_entity.
  ALIASES update_entity  FOR zif_odata_v2_write~update_entity.
  ALIASES delete_entity  FOR zif_odata_v2_write~delete_entity.

ENDINTERFACE.
