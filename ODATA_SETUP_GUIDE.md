# OData V2 CRUD Interface — Setup Guide

> Dieses Dokument beschreibt den vollständigen Workflow, um den generischen OData V2 Client
> (`ZCL_ODATA_V2_CLIENT`) mit einer neuen API zu verbinden — von der SAP-Systemkonfiguration
> bis zum lauffähigen ABAP-Code. Ziel: minimaler Aufwand, maximale Wiederverwendung.

---

## Welchen Weg nehme ich?

```
Neue API einbinden
       │
       ▼
Existiert ein SAP Standard Communication Scenario (SAP_COM_XXXX)?
       │
  ┌────┴────┐
 JA        NEIN
  │          │
  ▼          ▼
Pfad A    Pfad B
Standard  Custom
```

| | **Pfad A — SAP Standard API** | **Pfad B — Custom / eigene API** |
|---|---|---|
| Typisch für | SAP-eigene APIs (Timesheet, Business Partner, ...) | Eigene Z-Services, Drittsysteme |
| SAP Inbound Scenario | Vorhanden (`SAP_COM_XXXX`) | Nicht vorhanden |
| Custom Outbound Scenario | **Immer nötig** (`Z..._OB` in ADT) | **Immer nötig** (`Z..._OB` in ADT) |
| Outbound Service (ZOBS) | **Immer nötig** | **Immer nötig** |
| Unterschied im Code | Keiner — identischer ABAP-Code | Keiner — identischer ABAP-Code |

> ⚠️ **Wichtig:** `SAP_COM_XXXX` Scenarios sind für **Inbound** (externe Systeme rufen dein S/4HANA auf).
> Für ABAP-Code der eine API **aufruft** (Outbound) braucht man **immer** ein eigenes Custom Outbound
> Scenario in ADT — unabhängig ob Pfad A oder B.

---

## Übersicht

```
                     Pfad A (Standard)            Pfad B (Custom)
                     ─────────────────            ───────────────
Phase 1: Ermitteln   API Hub → SAP_COM_XXXX        API Hub → kein Standard-Scenario
Phase 2: Comm.Sys.   Comm. System anlegen          Comm. System anlegen         (gleich)
Phase 3: Outbound    ZOBS + Z-Scenario in ADT      ZOBS + Z-Scenario in ADT     (gleich!)
Phase 4: Arr. OB     Outbound Arrangement anlegen  Outbound Arrangement anlegen (gleich)
Phase 4b: Arr. IB    SAP_COM_XXXX Arrangement      ── entfällt ──               (nur A, optional)
                     ────────────────────────────────────────────────────────────────────
Phase 5: SCM         metadata.xml → SCM generieren                              (gleich)
Phase 6: Config      ZCL_ODATA_API_CONFIG erweitern                             (gleich)
Phase 7: Code        Consumer-Klasse schreiben                                  (gleich)
Phase 8: Test        ADT Console                                                (gleich)
```

**Zeitaufwand:** ~45–60 Min pro API (inkl. Test)

---

## Voraussetzungen

- Zugriff auf das S/4HANA System (Fiori Launchpad) mit Admin-Berechtigung für Communication Management
- ADT (ABAP Development Tools in Eclipse) mit Zugang zum System
- Das ABAP-Paket mit den generischen Client-Klassen ist aktiviert:
  - `ZIF_ODATA_V2_CLIENT`
  - `ZCL_ODATA_V2_CLIENT`
  - `ZCX_ODATA_V2_ERROR`
  - `ZCL_ODATA_API_CONFIG`

---

## Phase 1 — API ermitteln & Pfad bestimmen

**Ziel:** Herausfinden welcher OData Service genutzt werden soll und ob ein Standard
Communication Scenario existiert (→ Pfad A oder B).

### Schritt 1.1 — Service im SAP API Business Hub suchen

1. SAP API Business Hub öffnen: [api.sap.com](https://api.sap.com)
2. Nach der gewünschten API suchen (z.B. `Timesheet`, `Business Partner`, etc.)
3. Folgendes notieren:

| Was | Wo auf der API-Seite | Beispiel |
|---|---|---|
| API-Name / Service Name | Titel / "API Specification" | `API_MANAGE_WORKFORCE_TIMESHEET` |
| OData Version | "API Type" | Muss `OData V2` sein |
| Communication Scenario ID | "Configuration Details" Tab | `SAP_COM_0207` |

4. Pfad festlegen:
   - **Scenario ID gefunden** → **Pfad A** → Phase 2
   - **Keine Scenario ID** → **Pfad B** → Phase 2 (Phase 3 folgt danach)

### Schritt 1.2 — Alternativ: Lokal im System prüfen

Falls kein API Business Hub Zugriff:

Im Fiori Launchpad → App **"Display Communication Scenarios"** öffnen → nach API-Name
oder Service-Kürzel suchen.
- Gefunden → Scenario ID notieren → **Pfad A**
- Nicht gefunden → **Pfad B**

> **Faustregel:** Alle SAP-Standard-APIs (HR, Finance, Logistics) haben ein `SAP_COM_XXXX`
> Scenario. Custom Z-Services und Drittsystem-APIs haben keines.

---

## Phase 2 — Communication System anlegen

**Gilt für: Pfad A und Pfad B**

**Ziel:** Das Zielsystem (den Server der API) im S/4HANA registrieren.

> Überspringe diesen Schritt wenn bereits ein passendes Communication System für das
> Zielsystem existiert (z.B. für eine frühere API desselben Systems angelegt).

### Schritt 2.1 — Communication System erstellen

Im Fiori Launchpad → App **"Communication Systems"** → **"New"**:

| Feld | Wert | Beispiel Pfad A | Beispiel Pfad B |
|---|---|---|---|
| System ID | `Z<KÜRZEL>_SYS` | `ZPHORON_TIMESHEET_SYS` | `ZPHORON_MYCUSTOM_SYS` |
| System Name | Freitext | `Phoron Timesheet System` | `My Custom API System` |
| Host Name | URL des Zielsystems | `my405410.s4hana.cloud.sap` | `api.myfirm.com` |

4. Bei **"Users for Outbound Communication"**: User anlegen
   - SAP Standard APIs: meist **Basic Auth** mit einem technischen User
   - Custom/Drittsystem: je nach API-Dokumentation (Basic, OAuth, API Key)
5. **"Save"**

> **Hinweis:** Bei internen APIs (Aufruf innerhalb desselben S/4HANA Systems) den eigenen
> Hostnamen eintragen. User ist dann ein interner technischer User.

---

## Phase 3 — Outbound Service + Outbound Scenario anlegen

**Gilt für: Pfad A und Pfad B — immer erforderlich**

**Ziel:** Den "Ausgangskanal" definieren — welcher OData Service-Pfad aufgerufen wird und
unter welchem Scenario-Namen der ABAP-Code die Verbindung anspricht.

> ⚠️ Auch bei Pfad A (SAP Standard API) muss dieser Schritt durchgeführt werden.
> `SAP_COM_XXXX` ist nur für Inbound (externe Systeme → S/4HANA). Für Outbound
> (ABAP-Code → API) braucht man immer ein eigenes Z-Scenario.

### Schritt 3.1 — Outbound Service anlegen in ADT

In ADT (Eclipse):
1. Rechtsklick auf Paket → **"New" → "Other ABAP Repository Object"**
2. Suche nach **"Outbound Service"** → auswählen → **"Next"**
3. Felder ausfüllen:

| Feld | Wert | Beispiel |
|---|---|---|
| Name | `ZOBS_<API-KÜRZEL>_REST` | `ZOBS_ODATA_CRUD_REST` |
| Description | Freitext | `Timesheet API Outbound Service` |
| Default Path Prefix | Pfad des OData Services | `/sap/opu/odata/sap/API_MANAGE_WORKFORCE_TIMESHEET` |

4. **"Finish"** + **Aktivieren** (Ctrl+F3)

Die **Service ID** (`ZOBS_ODATA_CRUD_REST`) notieren — wird in Phase 6 benötigt.

### Schritt 3.2 — Communication Scenario anlegen in ADT

In ADT (Eclipse):
1. Rechtsklick auf Paket → **"New" → "Other ABAP Repository Object"**
2. Suche nach **"Communication Scenario"** → auswählen → **"Next"**
3. Felder ausfüllen:

| Feld | Wert | Beispiel |
|---|---|---|
| Name | `Z<API-KÜRZEL>_OB` | `ZCS_ODATA_CRUD_OB` |
| Description | Freitext | `OData CRUD Outbound Scenario` |
| Package | Eigenes Z-Paket | |

4. **"Finish"** → Scenario-Editor öffnet sich
5. Tab **"Outbound"** öffnen → **"Add"** → den Outbound Service aus Schritt 3.1 auswählen (`ZOBS_ODATA_CRUD_REST`)
6. **Publish** klicken + **Aktivieren** (Ctrl+F3)

Die **Scenario ID** (`ZCS_ODATA_CRUD_OB`) notieren — wird in Phase 4 + 6 benötigt.

---

## Phase 4 — Communication Arrangement anlegen

**Gilt für: Pfad A und Pfad B**

### Schritt 4.1 — Outbound Arrangement erstellen (beide Pfade)

Im Fiori Launchpad → App **"Communication Arrangements"** → **"New"**:

| Feld | Wert | Beispiel |
|---|---|---|
| Scenario | Custom Outbound Scenario aus Phase 3 | `ZCS_ODATA_CRUD_OB` |
| Arrangement Name | `Z<API-KÜRZEL>_OB_CA` | `ZMV_TIMESHEET_OB_CA` |
| Communication System | System aus Phase 2 | `ZMV_API_INTF_TEST_SYS` |

- Unter **"Outbound Services"**: URL prüfen/anpassen (muss auf den korrekten Endpunkt zeigen)
- **"Save"**

### Schritt 4.2 — Inbound Arrangement erstellen (nur Pfad A, optional)

Nur nötig wenn externe Systeme die API auf deinem S/4HANA aufrufen sollen.
Für reine ABAP-Consumer (unser Usecase) kann dieser Schritt übersprungen werden.

Im Fiori Launchpad → App **"Communication Arrangements"** → **"New"**:

| Feld | Wert | Beispiel |
|---|---|---|
| Scenario | SAP Standard Scenario aus Phase 1 | `SAP_COM_0027` |
| Arrangement Name | `Z<API-KÜRZEL>_IB_CA` | `ZMV_API_INTF_TEST_COM_0027_CA` |
| Communication System | System aus Phase 2 | `ZMV_API_INTF_TEST_SYS` |

### Schritt 4.3 — Alle Werte für den ABAP-Code notieren

Diese Tabelle vollständig ausfüllen — wird in Phase 6 direkt übernommen:

| Parameter im ABAP | Wo zu finden | Beispiel |
|---|---|---|
| `comm_scenario` | Outbound Scenario ID (Phase 3.2) | `ZCS_ODATA_CRUD_OB` |
| `service_id` | Outbound Service ID (Phase 3.1) | `ZOBS_ODATA_CRUD_REST` |
| `comm_system_id` | System ID (Phase 2) | `ZMV_API_INTF_TEST_SYS` |

---

## Phase 5 — Service Consumption Model (SCM) in ADT generieren

**Gilt für: Pfad A und Pfad B — identischer Ablauf**

**Ziel:** ABAP-Typen und Proxy-Modell aus der OData `$metadata` automatisch generieren.
Danach ist der Entity-Typ in ABAP verwendbar ohne eine Zeile manuell zu tippen.

### Schritt 5.1 — Metadata-URL ermitteln und herunterladen

Die `$metadata` URL des OData Services lautet:
```
https://<host>/sap/opu/odata/sap/<SERVICE_NAME>/$metadata
```

Beispiele:
```
Pfad A: https://my405410.s4hana.cloud.sap/sap/opu/odata/sap/API_MANAGE_WORKFORCE_TIMESHEET/$metadata
Pfad B: https://api.myfirm.com/sap/opu/odata/sap/ZMYCUSTOM_SERVICE/$metadata
```

Die URL im Browser aufrufen (ggf. mit Basic-Auth) → XML wird angezeigt →
als `metadata.xml` auf dem lokalen PC speichern.

### Schritt 5.2 — SCM-Objekt in ADT erstellen

In ADT:
1. Rechtsklick auf Paket → **"New" → "Other ABAP Repository Object"**
2. Suche nach **"Service Consumption Model"** → auswählen → **"Next"**
3. Felder:

| Feld | Wert | Beispiel |
|---|---|---|
| Name | `ZSCM_<API-KÜRZEL>` | `ZSCM_TIMESHEET` / `ZSCM_MYCUSTOM` |
| Description | Freitext | `Timesheet API Consumption Model` |
| Remote Service Type | `OData V2` | |

4. **"Next"** → `metadata.xml` hochladen (Browse → Datei auswählen)
5. **"Next"** → Entity Sets auswählen:
   - Nur die tatsächlich benötigten Entity Sets anhaken
   - Nicht alle importieren — reduziert generierte Code-Menge
6. **"Finish"** → ADT generiert alle Typen automatisch

### Schritt 5.3 — Generierte Werte notieren

Das SCM-Objekt enthält eine Klasse mit generierten Typen:

| Typ | Name-Schema | Verwendung |
|---|---|---|
| Einzelstruktur | `tys_<entity>_type` | für `cs_data` in `read_entity` |
| Tabelle | `tyt_<entity>_type` | für `ct_data` in `read_list` |

Folgendes notieren:

| Parameter | Wert | Beispiel |
|---|---|---|
| Proxy Model ID | = SCM-Name | `ZSCM_TIMESHEET` |
| Entity Set Name | Aus SCM sichtbar (CamelCase!) | `TimeSheetEntry` |
| Struct-Typ (Einzel) | `<scm-name>=>tys_<entity>_type` | `zscm_timesheet=>tys_timesheetentry_type` |
| Tabellen-Typ | `<scm-name>=>tyt_<entity>_type` | `zscm_timesheet=>tyt_timesheetentry_type` |

> **ACHTUNG — Entity Set Name:** Exakt so schreiben wie in der `$metadata` und im SCM
> angezeigt (meist CamelCase, z.B. `TimeSheetEntry`). Der ABAP-Feldname im Struct ist
> dagegen `lowercase_with_underscores`.

---

## Phase 6 — ZCL_ODATA_API_CONFIG erweitern

**Gilt für: Pfad A und Pfad B — identischer Ablauf**

**Ziel:** Die Verbindungsparameter zentral hinterlegen — kein Hardcoding in Consumer-Klassen.

### Schritt 6.1 — Neue Konstante in CLASS DEFINITION hinzufügen

`ZCL_ODATA_API_CONFIG` in ADT öffnen → in der `CLASS DEFINITION PUBLIC SECTION`
eine neue `CONSTANTS`-Struktur ergänzen:

```abap
" Pfad A Beispiel (SAP Standard Timesheet API):
CONSTANTS:
  BEGIN OF timesheet_entry,
    comm_scenario  TYPE string VALUE 'SAP_COM_0207',
    service_id     TYPE string VALUE 'API_MANAGE_WORKFORCE_TIMESHEET',
    proxy_model_id TYPE string VALUE 'ZSCM_TIMESHEET',
    entity_set     TYPE string VALUE 'TimeSheetEntry',
    comm_system_id TYPE string VALUE 'ZPHORON_TIMESHEET_SYS',
  END OF timesheet_entry.
```

```abap
" Pfad B Beispiel (Custom Service):
CONSTANTS:
  BEGIN OF my_custom_api,
    comm_scenario  TYPE string VALUE 'ZMYCUSTOM_OUTBOUND',
    service_id     TYPE string VALUE 'ZOBS_MYCUSTOM_REST',
    proxy_model_id TYPE string VALUE 'ZSCM_MYCUSTOM',
    entity_set     TYPE string VALUE 'MyCustomEntity',
    comm_system_id TYPE string VALUE 'ZPHORON_MYCUSTOM_SYS',
  END OF my_custom_api.
```

> Die Werte kommen 1:1 aus der Notiztabelle in Phase 4.2 und 5.3.

### Schritt 6.2 — Aktivieren

Klasse aktivieren (Ctrl+F3). Kein Implementierungscode nötig.

---

## Phase 7 — Consumer-Klasse schreiben

**Gilt für: Pfad A und Pfad B — identischer Code-Aufbau**

**Ziel:** Eine schlanke Klasse die den generischen Client nutzt. Der Aufrufer muss nichts
über OData, HTTP oder Communication Arrangements wissen.

### Schritt 7.1 — Klasse anlegen

Neue ABAP-Klasse `ZCL_<API-KÜRZEL>_READER` (oder `_SERVICE`) anlegen:

```abap
CLASS zcl_timesheet_reader DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    METHODS get_entries
      IMPORTING
        iv_person_work_agreement TYPE string
        iv_date_from             TYPE d
        iv_date_to               TYPE d
      RETURNING
        VALUE(rt_entries) TYPE zscm_timesheet=>tyt_timesheetentry_type
      RAISING
        zcx_odata_v2_error.
ENDCLASS.

CLASS zcl_timesheet_reader IMPLEMENTATION.
  METHOD get_entries.

    DATA(lo_client) = NEW zcl_odata_v2_client(
      iv_comm_scenario  = zcl_odata_api_config=>timesheet_entry-comm_scenario
      iv_service_id     = zcl_odata_api_config=>timesheet_entry-service_id
      iv_proxy_model_id = zcl_odata_api_config=>timesheet_entry-proxy_model_id
      iv_entity_set     = zcl_odata_api_config=>timesheet_entry-entity_set
      iv_comm_system_id = zcl_odata_api_config=>timesheet_entry-comm_system_id ).

    DATA lt_filter TYPE zif_odata_v2_client=>tt_filter.
    lt_filter = VALUE #(
      ( property_path = 'PERSON_WORK_AGREEMENT' sign = 'I' option = 'EQ' low = iv_person_work_agreement )
      ( property_path = 'TIME_SHEET_DATE'        sign = 'I' option = 'BT' low = iv_date_from high = iv_date_to ) ).

    lo_client->read_list(
      EXPORTING it_filter = lt_filter iv_top = 100 iv_skip = 0
      CHANGING  ct_data   = rt_entries ).

  ENDMETHOD.
ENDCLASS.
```

> **Wichtige Regeln für `property_path`:**
> - IMMER UPPERCASE mit Underscores: `'TIME_SHEET_DATE'` ✅
> - KEIN CamelCase: `'TimeSheetDate'` ❌ → Laufzeitfehler (→ E-11 in ERRORS.md)
> - Der korrekte Name = ABAP-Feldname im SCM-Struct (z.B. Struct-Feld `time_sheet_date` → Filter `'TIME_SHEET_DATE'`)

### Schritt 7.2 — Aktivieren (Ctrl+F3)

---

## Phase 8 — Test & Troubleshooting

**Gilt für: Pfad A und Pfad B — identischer Ablauf**

### Schritt 8.1 — Schnelltest mit Demo-Klasse

Neue Klasse mit `IF_OO_ADT_CLASSRUN` anlegen und ausführen (F9):

```abap
METHOD if_oo_adt_classrun~main.
  TRY.
      DATA(lo_reader) = NEW zcl_timesheet_reader( ).
      DATA(lt_result) = lo_reader->get_entries(
        iv_person_work_agreement = '00000001'
        iv_date_from             = '20240101'
        iv_date_to               = '20240131' ).
      out->write( |Einträge: { lines( lt_result ) }| ).
    CATCH zcx_odata_v2_error INTO DATA(lx).
      out->write( |Fehler: { lx->get_text( ) }| ).
      IF lx->previous IS BOUND.
        out->write( |Ursache: { lx->previous->get_text( ) }| ).
      ENDIF.
  ENDTRY.
ENDMETHOD.
```

### Schritt 8.2 — Fehlertabelle

| HTTP-Code / Fehlermeldung | Ursache | Fix |
|---|---|---|
| HTTP 401 Unauthorized | Falscher User/Passwort im Comm. System | Phase 2: Communication System → User prüfen |
| HTTP 403 Forbidden | User hat keine Berechtigung | Benutzerrolle im System prüfen |
| HTTP 404 Not Found | Falscher Entity Set Name oder Service-URL | Phase 5.3: Entity Set Name exakt aus SCM ablesen |
| HTTP 405 Method Not Allowed | API ist read-only (z.B. CDS View) | Nur `read_list` / `read_entity` nutzen |
| `Eigenschaft 'XYZ' nicht gefunden` | CamelCase in property_path | UPPERCASE_WITH_UNDERSCORES verwenden (→ E-11) |
| `comm_scenario not found` | Arrangement nicht gespeichert/aktiv | Phase 4: Arrangement erneut speichern |
| Aktivierungsfehler SCM | Proxy Model ID falsch | SCM-Name exakt übernehmen |
| `Der Datencontainer ist keine Struktur` | Key-Parameter ist eine Tabelle statt Struct | `is_key` als typisierte Struct übergeben (→ E-07) |

Weitere bekannte Fehler: `skills/abapgit-doctor/ERRORS.md`

---

## Checklisten

### Pfad A — SAP Standard API

```
[ ] Phase 1: API-Name + SAP_COM_XXXX Scenario ID ermittelt (api.sap.com)
[ ] Phase 2: Communication System angelegt (oder bestehendes genutzt)
[ ] Phase 3: ── entfällt ──
[ ] Phase 4: Communication Arrangement angelegt, Werte notiert (4.2)
[ ] Phase 5: metadata.xml heruntergeladen, SCM generiert, Werte notiert (5.3)
[ ] Phase 6: ZCL_ODATA_API_CONFIG erweitert und aktiviert
[ ] Phase 7: Consumer-Klasse geschrieben und aktiviert
[ ] Phase 8: Test läuft durch, READ LIST liefert Daten ✅
```

### Pfad B — Custom / eigene API

```
[ ] Phase 1: API-Name ermittelt, kein Standard-Scenario vorhanden
[ ] Phase 2: Communication System angelegt
[ ] Phase 3: Communication Scenario in ADT angelegt, ZOBS service_id notiert
[ ] Phase 4: Communication Arrangement angelegt, Werte notiert (4.2)
[ ] Phase 5: metadata.xml heruntergeladen, SCM generiert, Werte notiert (5.3)
[ ] Phase 6: ZCL_ODATA_API_CONFIG erweitert und aktiviert
[ ] Phase 7: Consumer-Klasse geschrieben und aktiviert
[ ] Phase 8: Test läuft durch, READ LIST liefert Daten ✅
```

---

## Referenzen

- Generischer Client (Code): `projects/PHORON/odata-client/src/`
- Bekannte Aktivierungs-/Laufzeitfehler: `skills/abapgit-doctor/ERRORS.md`
- GitHub Repo: [MarcelValAT/phoron-abap-odata-client](https://github.com/MarcelValAT/phoron-abap-odata-client)
