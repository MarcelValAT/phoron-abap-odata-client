# Handoff: phoron-abap-odata-client

## Was wurde gebaut

Generischer OData V2 CRUD-Client für SAP ABAP Cloud (S/4HANA Public Cloud).
Ziel: Beliebige OData APIs über Communication Arrangements ansprechen ohne Boilerplate.
Adapter Pattern: ZIF_ODATA_V2_READ + ZIF_ODATA_V2_WRITE als separate Interfaces, zwei Implementierungen (Standard HTTP + POST-only).

---

## Repos & Pfade

| | Pfad |
|---|---|
| **GitHub** | https://github.com/MarcelValAT/phoron-abap-odata-client |
| **Lokal (Docs)** | `C:\Users\valdeigm\OneDrive - Phoron Group GmbH\Projekte\Git\AI@Phoron\claude-code-cowork-clon\projects\PHORON\odata-client\` |
| **Basis-Projekt (Muster)** | `...\projects\PHORON\ar-automation\` |
| **Basis-Repo (GitHub)** | https://github.com/MarcelValAT/phoron-ar-automation |
| **SAP-System** | `my405410.s4hana.cloud.sap` |

---

## Gelieferte Dateien (`src/`)

| Datei | Typ | Beschreibung |
|---|---|---|
| `zcx_odata_v2_error.clas.abap` + `.xml` | Exception | HTTP-Status + Operation + Root-Cause-Chaining |
| `zif_odata_v2_read.intf.abap` + `.xml` | Interface | Read-Kontrakt: `read_list`, `read_entity`, `ty_filter`/`tt_filter` |
| `zif_odata_v2_write.intf.abap` + `.xml` | Interface | Write-Kontrakt: `create_entity`, `update_entity`, `delete_entity` |
| `zif_odata_v2_client.intf.abap` + `.xml` | Interface | Thin Combiner: erbt beide Interfaces, Aliases für direkten Aufruf |
| `zcl_odata_v2_client.clas.abap` + `.xml` | Implementierung | Standard HTTP-Verben (GET/PUT/PATCH/DELETE), `build_filter_node` |
| `zcl_odata_v2_post_client.clas.abap` + `.xml` | Implementierung | POST-only (alle Writes via POST + Operation-Feld im Payload) |
| `zcl_odata_api_config.clas.abap` + `.xml` | Config | CONSTANTS-Klasse: `dunning_entry` + `timesheet_entry` Blöcke |
| `zcl_odata_v2_clnt_demo.clas.abap` + `.xml` | Demo | Timesheet (POST-only READ LIST) + YY1_DUNNINGENTRY (Standard-CRUD) |
| `zscm_odata_crud_ts.clas.abap` + `.xml` | SCM-Klasse | Generiertes Service Consumption Model für Timesheet API |
| `zcs_odata_crud_ob.sco1.xml` | Comm. Scenario | Custom Outbound Communication Scenario `ZCS_ODATA_CRUD_OB` |
| `zobs_odata_crud_rest.sco3.xml` | Outbound Service | Outbound Service `ZOBS_ODATA_CRUD_REST` |
| `src/package.devc.xml` | abapGit | Package-Beschreibung |
| `.abapgit.xml` | abapGit | STARTING_FOLDER=/src/, MASTER_LANGUAGE=D |

---

## Architektur-Übersicht

```
ZIF_ODATA_V2_READ (Interface)
  ├── ty_filter / tt_filter  — generischer Filter (property_path UPPERCASE, sign/option/low/high)
  ├── read_list(it_filter, iv_top, iv_skip, CHANGING ct_data ANY TABLE)
  └── read_entity(is_key ANY, CHANGING cs_data ANY)

ZIF_ODATA_V2_WRITE (Interface)
  ├── create_entity(is_data ANY)
  ├── update_entity(is_key ANY, is_data ANY, iv_use_put)
  └── delete_entity(is_key ANY)

ZIF_ODATA_V2_CLIENT (Thin Combiner — erbt beide)
  → Aliases: read_list, read_entity, create_entity, update_entity, delete_entity
  → Aliases: ty_filter, tt_filter

ZCL_ODATA_V2_CLIENT (implementiert ZIF_ODATA_V2_CLIENT)
  → Standard HTTP-Verben: GET (read), POST (create), PUT/PATCH (update), DELETE (delete)
  constructor(iv_comm_scenario, iv_service_id, iv_proxy_model_id,
              iv_entity_set, [iv_comm_system_id], [iv_proxy_version='0001'])
  → cl_http_destination_provider=>create_by_comm_arrangement()
  → cl_web_http_client_manager=>create_by_http_destination()
  → /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy()

ZCL_ODATA_V2_POST_CLIENT (implementiert ZIF_ODATA_V2_READ + ZIF_ODATA_V2_WRITE)
  → Gleicher Constructor wie ZCL_ODATA_V2_CLIENT
  → read_list / read_entity: identisch (GET)
  → create_entity: POST mit Operation 'C' im Payload
  → update_entity: POST mit Operation 'U' im Payload (is_key ignoriert)
  → delete_entity: POST mit Operation 'D' im Payload
  → Verwendung: APIs mit sap:updatable="false" sap:deletable="false"

ZCL_ODATA_API_CONFIG (CONSTANTS-Klasse)
  dunning_entry:
    comm_scenario  = 'ZDUNNING_OUTBOUND'
    service_id     = 'ZOBS_DUNNING_API_REST'
    proxy_model_id = 'ZSCM_DUNNINGENTRY'
    entity_set     = 'YY_1_DUNNING_ENTRY_EXT'
    comm_system_id = 'DUNNING_ENTRY_SYS'
  timesheet_entry:
    comm_scenario  = 'ZCS_ODATA_CRUD_OB'
    service_id     = 'ZOBS_ODATA_CRUD_REST'
    proxy_model_id = 'ZSCM_ODATA_CRUD_TS'
    entity_set     = 'TIME_SHEET_ENTRY_COLLECTIO'   ← interner SCM-Name, nicht OData-Name!
    comm_system_id = 'ZMV_API_INTF_TEST_SYS'

ZCX_ODATA_V2_ERROR (cx_static_check)
  get_text() → "[OPERATION] [ENTITY_SET] HTTP [STATUS]: [root cause]"
  Felder: mv_operation, mv_entity_set, mv_http_status, previous (Root-Cause-Chain)
```

---

## Konfigurationswerte (SAP-System my405410)

### YY1_DUNNINGENTRY (AR Automation — Standard CRUD)

```
Comm Scenario:  ZDUNNING_OUTBOUND
Service ID:     ZOBS_DUNNING_API_REST
Proxy Model ID: ZSCM_DUNNINGENTRY
Entity Set:     YY_1_DUNNING_ENTRY_EXT
Comm System ID: DUNNING_ENTRY_SYS
Client-Klasse:  ZCL_ODATA_V2_CLIENT

Testdaten:
  DunningRunDate = 20240310
  DunningRun     = HEHO
  Customer       = 0001000010
  CompanyCode    = 3910
```

### Timesheet (API_MANAGE_WORKFORCE_TIMESHEET — POST-only)

```
Comm Scenario:  ZCS_ODATA_CRUD_OB
Service ID:     ZOBS_ODATA_CRUD_REST
Proxy Model ID: ZSCM_ODATA_CRUD_TS
Entity Set:     TIME_SHEET_ENTRY_COLLECTIO   ← gcs_entity_set Konstante aus SCM
Comm System ID: ZMV_API_INTF_TEST_SYS
Client-Klasse:  ZCL_ODATA_V2_POST_CLIENT

SAP Standard Scenario: SAP_COM_0027 (INBOUND only — nicht direkt verwendbar!)
Arrangement: ZMV_API_INTF_TEST_COM_0027_CA  (Inbound-Arrangement für SAP_COM_0027)
Operation-Feld: time_sheet_operation = 'C' / 'U' / 'D'
SCM-Typen:
  Tabellen-Typ:  zscm_odata_crud_ts=>tyt_time_sheet_entry
  Struktur-Typ:  zscm_odata_crud_ts=>tys_time_sheet_entry
```

---

## Bekannte offene Punkte

### 1. [KRITISCH] `TYPE ANY` / `TYPE ANY TABLE` im Interface — ABAP Cloud ATC-Risiko

**Dateien:** `zif_odata_v2_read.intf.abap`, `zif_odata_v2_write.intf.abap`
**Problem:** Generische Typen (`TYPE ANY TABLE`, `TYPE ANY`) in PUBLIC Interface-Methoden.
**Risiko:** ABAP Cloud ATC-Check kann diese Signatur ablehnen (je nach Release-Stand).
**Status:** Im System my405410 getestet — falls Aktivierung funktioniert, kein Fix nötig.
**Möglicher Fix:** Interface-Methoden auf `TYPE REF TO data` umstellen + ASSIGN FIELD-SYMBOL in Implementierung.

### 2. [KRITISCH] `navigate_with_key` — Signatur im Zielsystem prüfen

**Datei:** `zcl_odata_v2_client.clas.abap`, Methoden `read_entity`, `update_entity`, `delete_entity`
**Problem:** `is_key TYPE ANY` direkt an `navigate_with_key()` übergeben.
**Prüfung:** In ADT `/iwbep/if_cp_resource_entity_set` → `navigate_with_key` → Parameter-Typ ansehen.

### 3. [IMPORTANT] Demo-Klasse hat externe Abhängigkeit (Dunning)

**Datei:** `zcl_odata_v2_clnt_demo.clas.abap`
**Problem:** Referenziert `zcl_dunningentry_scm` aus `phoron-ar-automation`. Nur aktivierbar wenn beide Pakete deployed sind.
**Timesheet-Teil ist standalone** — der Dunning-Teil benötigt das ar-automation Paket.

### 4. [NICE-TO-HAVE] `create_by_range` Range-Typ Kompatibilität

**Datei:** `zcl_odata_v2_client.clas.abap`, Methode `build_filter_node`
**Problem:** Lokaler Range-Typ vs. `/iwbep/t_cp_range_primitive`.
**Prüfung:** Beim ersten `read_list` mit Filter prüfen ob Laufzeitfehler auftritt.

---

## Wichtige Referenz-Dateien

Für Weiterentwicklung / Bugfixing:

1. **Alle ABAP-Quelldateien** in `phoron-abap-odata-client/src/*.abap`
2. **EDMX Timesheet API**: `doc/API_MANAGE_WORKFORCE_TIMESHEET.edmx`
3. **SAP CRUD Sample Codes** (zeigen wie navigate_with_key verwendet wird):
   `ar-automation/doc/CRUD_Sample_codes.md`
4. **Bestehende Implementierung** (Muster für Proxy-Setup + Filter):
   `ar-automation/src/src/zcl_dunning_entry_reader.clas.abap`
5. **Setup-Anleitung**: `ODATA_SETUP_GUIDE.md`
6. **Bekannte Fehler**: `skills/abapgit-doctor/ERRORS.md`

---

## Import in S/4HANA (abapGit)

1. ADT → abapGit Repositories → Add Online → `https://github.com/MarcelValAT/phoron-abap-odata-client`
2. Branch: `main`, Starting Folder: `/src/`
3. Paket zuweisen (Z-Paket anlegen oder bestehendes nutzen)
4. Pull → Aktivieren
5. `ZCL_ODATA_V2_CLNT_DEMO` als Console App ausführen (F9 in ADT)

**Hinweis bei abapGit-Fehler "Senden des Dynpros SAPLSETX 0100":**
→ Bestehende Objekte in ADT löschen → Re-Pull (Public Cloud hat kein SAP GUI)

---

## Erweiterung — neue API hinzufügen

Kurzform: [ODATA_SETUP_GUIDE.md](../ODATA_SETUP_GUIDE.md)

1. Communication System anlegen (oder bestehendes nutzen)
2. Outbound Scenario + Outbound Service in ADT anlegen (`ZCS_..._OB` + `ZOBS_..._REST`)
3. Communication Arrangement anlegen (Outbound)
4. EDMX herunterladen → SCM generieren
5. Neuen Block in `ZCL_ODATA_API_CONFIG` ergänzen
6. Consumer-Klasse schreiben
7. POST-only? → `ZCL_ODATA_V2_POST_CLIENT` verwenden statt `ZCL_ODATA_V2_CLIENT`
