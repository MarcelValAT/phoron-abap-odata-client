# phoron-abap-odata-client

Generisches OData V2 CRUD-Client-Interface für SAP ABAP Cloud (S/4HANA Public Cloud). Ermöglicht den Zugriff auf beliebige OData V2 Services über Communication Arrangements — ohne wiederkehrenden Boilerplate-Code.

## ABAP-Objekte

| Objekt | Typ | Zweck |
|---|---|---|
| `ZIF_ODATA_V2_CLIENT` | Interface | CRUD-Methodenkontrakt (read_list, read_entity, create, update, delete) |
| `ZCL_ODATA_V2_CLIENT` | Klasse | Implementierung, konfigurierbar per Constructor |
| `ZCX_ODATA_V2_ERROR` | Exception | Strukturierte Fehlermeldung mit HTTP-Status + Operation + Root Cause |
| `ZCL_ODATA_API_CONFIG` | Klasse | Zentrale Konfiguration aller API-Parameter (keine hardcoded Strings) |
| `ZCL_ODATA_V2_CLNT_DEMO` | Klasse | Demo gegen YY1_DUNNINGENTRY API |

## Verwendung

```abap
" Client für eine beliebige OData API konfigurieren
DATA(lo_client) = NEW zcl_odata_v2_client(
  iv_comm_scenario  = zcl_odata_api_config=>dunning_entry-comm_scenario
  iv_service_id     = zcl_odata_api_config=>dunning_entry-service_id
  iv_proxy_model_id = zcl_odata_api_config=>dunning_entry-proxy_model_id
  iv_entity_set     = zcl_odata_api_config=>dunning_entry-entity_set
  iv_comm_system_id = zcl_odata_api_config=>dunning_entry-comm_system_id ).

" Liste lesen mit Filter
DATA lt_entries TYPE TABLE OF zcl_dunningentry_scm=>tys_yy_1_dunning_entry_ext_typ.
lo_client->read_list(
  it_filter = VALUE #( ( property_path = 'DunningRun' sign = 'I' option = 'EQ' low = 'HEHO' ) )
  iv_top    = 10
  CHANGING ct_data = lt_entries ).

" Einzeleintrag lesen
DATA ls_key   TYPE zcl_dunningentry_scm=>tys_yy_1_dunning_entry_ext_typ.
DATA ls_entry TYPE zcl_dunningentry_scm=>tys_yy_1_dunning_entry_ext_typ.
ls_key-dunning_run = 'HEHO'.
ls_key-customer    = '0001000010'.
lo_client->read_entity( EXPORTING is_key = ls_key CHANGING cs_data = ls_entry ).
```

## Voraussetzungen

1. Communication Arrangement für die Ziel-API einrichten (siehe `doc/COMM_ARRANGEMENT_SETUP.md`)
2. SCM Proxy für den OData Service generieren (ADT → Service Consumption Model)
3. Neuen API-Eintrag in `ZCL_ODATA_API_CONFIG` ergänzen
