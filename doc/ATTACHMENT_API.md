# Attachment API — FI-Beleg-Anhänge abrufen

## Überblick

`API_CV_ATTACHMENT_SRV` ist ein SAP OData V2 Service zum Verwalten von Anhängen an SAP Business Objects.
In diesem Projekt wird er genutzt um **PDF-Anhänge an FI-Belegen (BKPF / Journal Entries)** abzurufen,
die später als Email-Anhänge in Mahnungs-Emails versendet werden.

**Communication Scenario**: `SAP_COM_0002` (Finance – Posting Integration)
**Business Accelerator Hub**: `API_CV_ATTACHMENT_SRV`

---

## Voraussetzungen (SAP-System)

### 1. Anhang an FI-Beleg vorhanden

Für die Demo und Tests muss ein echter FI-Beleg mit hochgeladenem Anhang existieren:

1. App **"Journalbelege verwalten"** öffnen
2. Beleg mit Buchungskreis `3910` suchen
3. Beleg öffnen → Reiter **"Anhänge"**
4. PDF hochladen (beliebiges PDF)
5. **Belegnummer** (10-stellig intern, z.B. `0000123456`) und **Geschäftsjahr** notieren

### 2. Communication Arrangement aktiv

In unserem System `my405410` bereits konfiguriert:
- Communication Scenario: `ZCS_ODATA_CRUD_OB` (shared mit Timesheet)
- Outbound Service: `ZOBS_ODATA_CRUD_ATTM_REST`
- Communication System: `ZMV_API_INTF_TEST_SYS`

---

## LinkedSAPObjectKey für BKPF

Der Key zur eindeutigen Identifikation eines FI-Belegs ist eine **18-stellige Zeichenkette**:

```
Format: Buchungskreis(4) + Belegnummer(10, führende Nullen) + Geschäftsjahr(4)

Beispiel:
  Buchungskreis: 3910
  Belegnummer:   0000123456  (intern — 10 Stellen mit führenden Nullen)
  Geschäftsjahr: 2024
  → LinkedSAPObjectKey = '391000001234562024'
```

**ABAP Aufbau:**
```abap
DATA(lv_key) = zcl_attachment_v2_client=>build_bkpf_key(
  iv_bukrs = '3910'
  iv_belnr = '0000123456'   " 10-stellig intern
  iv_gjahr = '2024' ).
```

---

## Zwei-Schritt-Workflow

### Schritt 1: Metadaten abrufen (GetAllOriginals)

FunctionImport `GetAllOriginals` liefert alle Anhänge eines Business Objects:

```abap
DATA(lo_attm) = NEW zcl_attachment_v2_client(
  is_config = zcl_odata_api_config=>attachment_srv ).

DATA(lt_attachments) = lo_attm->get_fi_doc_attachments(
  iv_bukrs = '3910'
  iv_belnr = '0000123456'   " 10-stellig intern
  iv_gjahr = '2024' ).
```

**Rückgabe** (`zcl_scm_odata_crud_attm=>tyt_attachment_content`):
- `file_name` — Dateiname (z.B. `Rechnung_2024.pdf`)
- `mime_type` — MIME-Typ (z.B. `application/pdf`)
- `file_size` — Dateigröße in Byte
- `document_info_record_doc_t/n/v/p` — Key-Felder für Schritt 2
- `logical_document`, `archive_document_id` — weitere Key-Felder

### Schritt 2: Binären Inhalt herunterladen

```abap
DATA(lv_pdf_content) = lo_attm->download_attachment( lt_attachments[ 1 ] ).
" lv_pdf_content TYPE xstring — kann direkt als Email-Anhang genutzt werden
```

Intern wird folgende URL aufgebaut und per HTTP GET aufgerufen:
```
/sap/opu/odata/sap/API_CV_ATTACHMENT_SRV/AttachmentContentSet(
  DocumentInfoRecordDocType='...',
  DocumentInfoRecordDocNumber='...',
  DocumentInfoRecordDocVersion='...',
  DocumentInfoRecordDocPart='...',
  LogicalDocument='...',
  ArchiveDocumentID='...',
  LinkedSAPObjectKey='391000001234562024',
  BusinessObjectTypeName='BKPF')/$value
```

---

## SCM-Typen (ZCL_SCM_ODATA_CRUD_ATTM)

| ABAP-Typ | Zweck |
|---|---|
| `tys_attachment_content` | Einzelner Anhang (alle Felder inkl. Keys) |
| `tyt_attachment_content` | Liste von Anhängen |
| `tys_parameters_3` | Eingabe für `GetAllOriginals` (BusinessObjectTypeName + LinkedSAPObjectKey) |
| `gcs_function_import-get_all_originals` | Interne Name des FunctionImports: `'GET_ALL_ORIGINALS'` |
| `gcs_entity_set-attachment_content_set` | Entity Set Name: `'ATTACHMENT_CONTENT_SET'` |

---

## Demo-Code

Vollständiges Demo in `zcl_odata_v2_clnt_demo.clas.abap` → Methode `demo_fi_attachment`.

Testdaten anpassen (echte Belegnummer eintragen):
```abap
DATA(lv_bukrs) = '3910'.
DATA(lv_belnr) = '0000123456'.  " ← hier anpassen
DATA(lv_gjahr) = '2024'.
```

---

## Integration in ar-automation

Das nächste Ziel: `zcl_fi_attachment_provider` in `phoron-ar-automation` implementieren,
die `zif_email_attachment_provider` implementiert und `zcl_attachment_v2_client` nutzt.

```abap
" Konzept (noch nicht implementiert):
METHOD zif_email_attachment_provider~get_attachments.
  DATA lo_attm TYPE REF TO zcl_attachment_v2_client.
  lo_attm = NEW #( is_config = zcl_odata_api_config=>attachment_srv ).
  
  " FI-Belegnummer aus is_request-object_id extrahieren
  DATA(lt_metadata) = lo_attm->get_fi_doc_attachments(
    iv_bukrs = is_request-bukrs
    iv_belnr = is_request-object_id
    iv_gjahr = is_request-gjahr ).
  
  " Alle Anhänge herunterladen
  LOOP AT lt_metadata INTO DATA(ls_meta).
    DATA(lv_content) = lo_attm->download_attachment( ls_meta ).
    APPEND VALUE #(
      content   = lv_content
      file_name = ls_meta-file_name
      mime_type = ls_meta-mime_type ) TO rt_attachments.
  ENDLOOP.
ENDMETHOD.
```

---

## Troubleshooting

| Problem | Ursache | Fix |
|---|---|---|
| `GetAllOriginals` liefert leere Liste | Kein Anhang an Beleg | In "Journalbelege verwalten" → Anhang hochladen |
| LinkedSAPObjectKey-Fehler | Falsche Zeichenlänge | Exakt: Bukrs(4)+Belnr(10, Nullen)+Gjahr(4)=18 |
| HTTP 403 Forbidden | SAP_COM_0002 nicht konfiguriert | Communication Arrangement prüfen |
| `INIT` Fehler bei Client-Erstellung | Outbound Service nicht gefunden | `ZOBS_ODATA_CRUD_ATTM_REST` in ADT prüfen |
| HTTP 404 bei Download | Key-Felder nicht korrekt | Werte aus `get_fi_doc_attachments` unverändert übergeben |

---

## Quellen

- [SAP API Business Hub — API_CV_ATTACHMENT_SRV](https://api.sap.com/api/API_CV_ATTACHMENT_SRV/overview)
- [SAP Community — Troubleshooting API_CV_ATTACHMENT_SRV](https://community.sap.com/t5/enterprise-resource-planning-blog-posts-by-sap/troubleshooting-guide-for-issues-when-using-api-api-cv-attachment-srv-in-s/ba-p/14023687)
- [EDMX Metadata](../doc/API_CV_ATTACHMENT_SRV_0001.edmx)
