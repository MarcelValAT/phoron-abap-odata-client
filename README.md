# phoron-abap-odata-client

Generischer OData V2 CRUD-Client für SAP ABAP Cloud (S/4HANA Public Cloud). Ermöglicht den Zugriff auf beliebige OData V2 Services über Communication Arrangements — ohne wiederkehrenden Boilerplate-Code.

## Architektur (Adapter Pattern)

```
ZIF_ODATA_V2_READ          — Read-Interface (read_list, read_entity)
ZIF_ODATA_V2_WRITE         — Write-Interface (create_entity, update_entity, delete_entity)
ZIF_ODATA_V2_CLIENT        — Thin Combiner (erbt beide, Aliases für ergonomischen Aufruf)

ZCL_ODATA_V2_CLIENT        — Standard-Implementierung (GET/PUT/PATCH/DELETE via HTTP-Verben)
ZCL_ODATA_V2_POST_CLIENT   — POST-only-Implementierung (alle Writes via POST + operation-Feld)
```

**Wann welche Implementierung?**

| Szenario | Klasse | Interface |
|---|---|---|
| Normale CRUD-API | `ZCL_ODATA_V2_CLIENT` | `zif_odata_v2_client` oder `zif_odata_v2_read` |
| Read-only API | `ZCL_ODATA_V2_CLIENT` | `zif_odata_v2_read` |
| POST-only API (z.B. Timesheet) | `ZCL_ODATA_V2_POST_CLIENT` | `zif_odata_v2_read` oder `zif_odata_v2_write` |

POST-only APIs erkennt man an `sap:updatable="false" sap:deletable="false"` im EDMX. Writes laufen über POST + Operation-Feld im Payload (`time_sheet_operation = 'C'/'U'/'D'`).

## ABAP-Objekte

| Objekt | Typ | Zweck |
|---|---|---|
| `ZIF_ODATA_V2_READ` | Interface | Read-Kontrakt: `read_list`, `read_entity`, `ty_filter`/`tt_filter` |
| `ZIF_ODATA_V2_WRITE` | Interface | Write-Kontrakt: `create_entity`, `update_entity`, `delete_entity` |
| `ZIF_ODATA_V2_CLIENT` | Interface | Thin Combiner — erbt beide, Aliases für direkten Aufruf |
| `ZCL_ODATA_V2_CLIENT` | Klasse | Standard HTTP-Verben (GET/PUT/PATCH/DELETE) |
| `ZCL_ODATA_V2_POST_CLIENT` | Klasse | POST-only für APIs ohne PUT/DELETE (z.B. Timesheet) |
| `ZCX_ODATA_V2_ERROR` | Exception | Strukturierte Fehlermeldung: Operation + Entity Set + HTTP-Status + Root Cause |
| `ZCL_ODATA_API_CONFIG` | Klasse | Zentrale Konfiguration aller API-Parameter (keine hardcoded Strings) |
| `ZCL_ODATA_V2_CLNT_DEMO` | Klasse | Demo: Timesheet (POST-only) + YY1_DUNNINGENTRY (Standard-CRUD) |
| `ZSCM_ODATA_CRUD_TS` | SCM-Klasse | Generiertes Service Consumption Model für Timesheet API |
| `ZCS_ODATA_CRUD_OB` | Comm. Scenario | Custom Outbound Communication Scenario |
| `ZOBS_ODATA_CRUD_REST` | Outbound Service | Outbound Service für REST/OData |

## Verwendung

### Standard-CRUD API

```abap
" Client für Standard-API (HTTP GET/PUT/DELETE)
DATA lo_client TYPE REF TO zif_odata_v2_client.
lo_client = NEW zcl_odata_v2_client(
  iv_comm_scenario  = zcl_odata_api_config=>dunning_entry-comm_scenario
  iv_service_id     = zcl_odata_api_config=>dunning_entry-service_id
  iv_proxy_model_id = zcl_odata_api_config=>dunning_entry-proxy_model_id
  iv_entity_set     = zcl_odata_api_config=>dunning_entry-entity_set
  iv_comm_system_id = zcl_odata_api_config=>dunning_entry-comm_system_id ).

" Liste lesen mit Filter
" WICHTIG: property_path IMMER UPPERCASE mit Underscores — kein CamelCase!
DATA lt_entries TYPE zcl_dunningentry_scm=>tyt_yy_1_dunning_entry_ext_typ.
DATA lt_filter  TYPE zif_odata_v2_read=>tt_filter.
lt_filter = VALUE #( ( property_path = 'DUNNING_RUN'  sign = 'I' option = 'EQ' low = 'HEHO' )
                     ( property_path = 'COMPANY_CODE' sign = 'I' option = 'EQ' low = '3910' ) ).
lo_client->read_list( EXPORTING it_filter = lt_filter iv_top = 10 CHANGING ct_data = lt_entries ).

" Einzeleintrag lesen (Key aus read_list verwenden!)
DATA(ls_key) = lt_entries[ 1 ].
DATA ls_result TYPE zcl_dunningentry_scm=>tys_yy_1_dunning_entry_ext_typ.
lo_client->read_entity( EXPORTING is_key = ls_key CHANGING cs_data = ls_result ).
```

### POST-only API (z.B. Timesheet)

```abap
" Client für POST-only API — ZCL_ODATA_V2_POST_CLIENT
DATA lo_ts TYPE REF TO zif_odata_v2_read.
lo_ts = NEW zcl_odata_v2_post_client(
  iv_comm_scenario  = zcl_odata_api_config=>timesheet_entry-comm_scenario
  iv_service_id     = zcl_odata_api_config=>timesheet_entry-service_id
  iv_proxy_model_id = zcl_odata_api_config=>timesheet_entry-proxy_model_id
  iv_entity_set     = zcl_odata_api_config=>timesheet_entry-entity_set
  iv_comm_system_id = zcl_odata_api_config=>timesheet_entry-comm_system_id ).

" READ LIST (funktioniert normal via GET)
DATA lt_ts TYPE zscm_odata_crud_ts=>tyt_time_sheet_entry.
lo_ts->read_list( EXPORTING iv_top = 5 CHANGING ct_data = lt_ts ).

" CREATE via POST — Operation-Feld im Payload setzen
DATA(lo_ts_write) = CAST zif_odata_v2_write( lo_ts ).
DATA ls_new TYPE zscm_odata_crud_ts=>tys_time_sheet_entry.
ls_new-time_sheet_operation = 'C'.  " C=Create, U=Update, D=Delete
ls_new-person_work_agreement_exte = '12345678'.
" ... weitere Felder setzen
lo_ts_write->create_entity( ls_new ).
```

## Neue API einbinden

Schritt-für-Schritt-Anleitung: [ODATA_SETUP_GUIDE.md](ODATA_SETUP_GUIDE.md)

Kurzform:
1. Communication System anlegen/nutzen (Phase 2)
2. Custom Outbound Scenario + Outbound Service anlegen (Phase 3, immer nötig)
3. Communication Arrangement anlegen (Phase 4)
4. SCM generieren aus EDMX (Phase 5)
5. `ZCL_ODATA_API_CONFIG` erweitern (Phase 6)
6. Consumer-Klasse schreiben (Phase 7)

> **Achtung:** `SAP_COM_XXXX` Scenarios sind INBOUND only. Für eigenen ABAP-Code immer
> ein eigenes Z-Outbound Scenario + ZOBS Service anlegen.

## Voraussetzungen

1. Communication Arrangement für die Ziel-API einrichten (siehe [ODATA_SETUP_GUIDE.md](ODATA_SETUP_GUIDE.md))
2. SCM Proxy für den OData Service generieren (ADT → Service Consumption Model)
3. Neuen API-Eintrag in `ZCL_ODATA_API_CONFIG` ergänzen
