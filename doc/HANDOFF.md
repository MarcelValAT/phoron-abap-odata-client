# Handoff: phoron-abap-odata-client

## Was wurde gebaut

Generischer OData V2 CRUD-Client für SAP ABAP Cloud (S/4HANA Public Cloud).
Ziel: Beliebige OData APIs über Communication Arrangements ansprechen ohne Boilerplate.

**Aktueller Stand (April 2025):** Flaches Interface-Design, Config-Struct, Factory mit Multiton-Cache, spezialisierter Attachment-Client.

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
| `zif_odata_v2_read.intf.abap` + `.xml` | Interface (legacy) | Read-Kontrakt — nicht mehr aktiv genutzt |
| `zif_odata_v2_write.intf.abap` + `.xml` | Interface (legacy) | Write-Kontrakt — nicht mehr aktiv genutzt |
| `zif_odata_v2_client.intf.abap` + `.xml` | **Haupt-Interface** | Alle 5 Methoden + `ty_config`/`tt_filter` direkt |
| `zcl_odata_v2_client.clas.abap` + `.xml` | Implementierung | Standard HTTP-Verben (GET/PUT/PATCH/DELETE) |
| `zcl_odata_v2_post_client.clas.abap` + `.xml` | Implementierung | POST-only (alle Writes via POST + Operation-Feld) |
| `zcl_odata_client_factory.clas.abap` + `.xml` | **Factory** | Multiton-Cache: gleiche Config = gleiche Instanz |
| `zcl_odata_api_config.clas.abap` + `.xml` | Config | CONSTANTS-Klasse: `dunning_entry`, `timesheet_entry`, `attachment_srv` |
| `zcl_odata_v2_clnt_demo.clas.abap` + `.xml` | Demo | Timesheet, Dunning CRUD, FI Attachment Demo |
| `zcl_attachment_v2_client.clas.abap` + `.xml` | **Attachment-Client** | Spezialisiert: `GetAllOriginals` + Binary Download |
| `zscm_odata_crud_ts.clas.abap` + `.xml` | SCM | Generiertes Service Consumption Model: Timesheet |
| `zcl_scm_odata_crud_attm.clas.abap` + `.xml` | SCM | Generiertes Service Consumption Model: Attachment |
| `zcs_odata_crud_ob.sco1.xml` | Comm. Scenario | `ZCS_ODATA_CRUD_OB` (Timesheet + Attachment, shared) |
| `zobs_odata_crud_rest.sco3.xml` | Outbound Service | `ZOBS_ODATA_CRUD_REST` (Timesheet) |
| `zobs_odata_crud_attm_rest.sco3.xml` | Outbound Service | `ZOBS_ODATA_CRUD_ATTM_REST` (Attachment) |

---

## Architektur-Übersicht

```
ZIF_ODATA_V2_CLIENT (Haupt-Interface — einziger öffentlicher Typ)
  ├── ty_config   — Konfigurations-Struct
  ├── tt_filter   — Filter-Tabellen-Typ
  ├── read_list(it_filter, iv_top, iv_skip, CHANGING ct_data ANY TABLE)
  ├── read_entity(is_key ANY, CHANGING cs_data ANY)
  ├── create_entity(is_data ANY)
  ├── update_entity(is_key ANY, is_data ANY, iv_use_put)
  └── delete_entity(is_key ANY)

ZCL_ODATA_V2_CLIENT (implementiert ZIF_ODATA_V2_CLIENT)
  → Standard HTTP-Verben: GET (read), POST (create), PUT/PATCH (update), DELETE (delete)
  constructor(is_config TYPE zif_odata_v2_client=>ty_config)
  → cl_http_destination_provider=>create_by_comm_arrangement()
  → /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy()

ZCL_ODATA_V2_POST_CLIENT (implementiert ZIF_ODATA_V2_CLIENT)
  → Gleicher Constructor
  → read_list / read_entity: identisch (GET)
  → create/update/delete: alle via POST + Operation-Feld im Payload

ZCL_ODATA_CLIENT_FACTORY (Multiton)
  CLASS-METHODS get_client(is_config, iv_post_only)
  → Cache-Schlüssel: comm_scenario#entity_set#post_only
  → Erstellt zcl_odata_v2_client ODER zcl_odata_v2_post_client

ZCL_ATTACHMENT_V2_CLIENT (spezialisiert, kein Interface)
  constructor(is_config TYPE zif_odata_v2_client=>ty_config)
  get_fi_doc_attachments(iv_bukrs, iv_belnr, iv_gjahr) → tyt_attachment_content
  download_attachment(is_attachment) → xstring
  CLASS-METHODS build_bkpf_key(iv_bukrs, iv_belnr, iv_gjahr) → string

ZCL_ODATA_API_CONFIG (CONSTANTS-Klasse)
  dunning_entry / timesheet_entry / attachment_srv
  → alle Felder gleich: comm_scenario, service_id, proxy_model_id, entity_set, comm_system_id, proxy_version
```

### Verwendungsmuster

```abap
" Standard — 1 Zeile statt 5:
DATA(lo_client) = zcl_odata_client_factory=>get_client(
  is_config = zcl_odata_api_config=>dunning_entry ).

lo_client->read_list( EXPORTING it_filter = lt_filter CHANGING ct_data = lt_entries ).
lo_client->read_entity( EXPORTING is_key = lt_entries[ 1 ] CHANGING cs_data = ls_result ).
lo_client->create_entity( ls_new ).
lo_client->update_entity( is_key = ls_key is_data = ls_upd ).
lo_client->delete_entity( ls_del_key ).

" POST-only (Timesheet):
DATA(lo_ts) = zcl_odata_client_factory=>get_client(
  is_config    = zcl_odata_api_config=>timesheet_entry
  iv_post_only = abap_true ).

" Attachment (FI-Beleg):
DATA(lo_attm) = NEW zcl_attachment_v2_client( zcl_odata_api_config=>attachment_srv ).
DATA(lt_attm) = lo_attm->get_fi_doc_attachments( iv_bukrs='3910' iv_belnr='0000123456' iv_gjahr='2024' ).
DATA(lv_pdf)  = lo_attm->download_attachment( lt_attm[ 1 ] ).
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
Operation-Feld: time_sheet_operation = 'C' / 'U' / 'D'
```

### Attachment Service (API_CV_ATTACHMENT_SRV — FI-Beleg-Anhänge)

```
Comm Scenario:  ZCS_ODATA_CRUD_OB   ← gleiche wie Timesheet (shared!)
Service ID:     ZOBS_ODATA_CRUD_ATTM_REST
Proxy Model ID: ZCL_SCM_ODATA_CRUD_ATTM
Entity Set:     ATTACHMENT_HARMONIZED_OPER   ← interner SCM-Name
Comm System ID: ZMV_API_INTF_TEST_SYS
SAP Scenario:   SAP_COM_0002 (Finance – Posting Integration)
Client-Klasse:  ZCL_ATTACHMENT_V2_CLIENT (spezialisiert)
SCM-Typen:
  Anhang-Liste: zcl_scm_odata_crud_attm=>tyt_attachment_content
  Anhang-Struct: zcl_scm_odata_crud_attm=>tys_attachment_content
  FunctionImport: zcl_scm_odata_crud_attm=>gcs_function_import-get_all_originals
  FunctionImport-Params: zcl_scm_odata_crud_attm=>tys_parameters_3

Testdaten:
  Buchungskreis: 3910
  Belegnummer:   in 'Journalbelege verwalten' — Beleg mit Anhang suchen
  Geschäftsjahr: 2024
  → Anhang in App hochladen (Reiter 'Anhänge')
  → LinkedSAPObjectKey-Format: Bukrs(4)+Belnr(10 padded)+Gjahr(4) = 18 Zeichen
```

---

## Bekannte offene Punkte

### 1. [KRITISCH] `TYPE ANY` / `TYPE ANY TABLE` im Interface — ABAP Cloud ATC-Risiko

**Dateien:** `zif_odata_v2_client.intf.abap`
**Problem:** Generische Typen in PUBLIC Interface-Methoden.
**Status:** Im System my405410 getestet — falls Aktivierung funktioniert, kein Fix nötig.

### 2. [KRITISCH] `navigate_with_key` — Signatur im Zielsystem prüfen

**Datei:** `zcl_odata_v2_client.clas.abap`, Methoden `read_entity`, `update_entity`, `delete_entity`
**Problem:** `is_key TYPE ANY` direkt an `navigate_with_key()` übergeben.

### 3. [IMPORTANT] Demo-Klasse hat externe Abhängigkeit (Dunning)

**Datei:** `zcl_odata_v2_clnt_demo.clas.abap`
**Problem:** Referenziert `zcl_dunningentry_scm` aus `phoron-ar-automation`. Nur aktivierbar wenn beide Pakete deployed sind.

### 4. [NICE-TO-HAVE] `create_by_range` Range-Typ Kompatibilität

**Datei:** `zcl_odata_v2_client.clas.abap`, Methode `build_filter_node`
**Problem:** Lokaler Range-Typ vs. `/iwbep/t_cp_range_primitive`. Beim ersten `read_list` mit Filter testen.

---

## Wichtige Referenz-Dateien

1. **Alle ABAP-Quelldateien** in `phoron-abap-odata-client/src/*.abap`
2. **EDMX Attachment API**: `doc/API_CV_ATTACHMENT_SRV_0001.edmx`
3. **EDMX Timesheet API**: `doc/API_MANAGE_WORKFORCE_TIMESHEET.edmx`
4. **Attachment API Doku**: `doc/ATTACHMENT_API.md`
5. **Setup-Anleitung**: `ODATA_SETUP_GUIDE.md`

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
5. Neuen `CONSTANTS BEGIN OF <api_name>` Block in `ZCL_ODATA_API_CONFIG` ergänzen
6. Consumer-Code via Factory: `zcl_odata_client_factory=>get_client( zcl_odata_api_config=><api_name> )`
7. POST-only? → `iv_post_only = abap_true`
8. FunctionImport + Binary Stream? → Spezialisierte Klasse analog `ZCL_ATTACHMENT_V2_CLIENT`
