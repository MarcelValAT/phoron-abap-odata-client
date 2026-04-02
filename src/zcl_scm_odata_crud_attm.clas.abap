"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>API_CV_ATTACHMENT_SRV</em>
CLASS zcl_scm_odata_crud_attm DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">Types for "OData Primitive Types"</p>
      BEGIN OF tys_types_for_prim_types,
        "! Used for primitive type ARCHIVE_DOCUMENT_ID
        archive_document_id        TYPE c LENGTH 40,
        "! Used for primitive type ARCHIVE_DOCUMENT_ID_2
        archive_document_id_2      TYPE c LENGTH 40,
        "! Used for primitive type ARCHIVE_DOCUMENT_ID_3
        archive_document_id_3      TYPE c LENGTH 40,
        "! Used for primitive type ARCHIVE_DOCUMENT_ID_4
        archive_document_id_4      TYPE c LENGTH 40,
        "! Used for primitive type BUSINESS_OBJECT_TYPE_NAME
        business_object_type_name  TYPE c LENGTH 40,
        "! Used for primitive type BUSINESS_OBJECT_TYPE_NAM_2
        business_object_type_nam_2 TYPE c LENGTH 40,
        "! Used for primitive type BUSINESS_OBJECT_TYPE_NAM_3
        business_object_type_nam_3 TYPE c LENGTH 40,
        "! Used for primitive type BUSINESS_OBJECT_TYPE_NAM_4
        business_object_type_nam_4 TYPE c LENGTH 40,
        "! Used for primitive type BUSINESS_OBJECT_TYPE_NAM_5
        business_object_type_nam_5 TYPE c LENGTH 40,
        "! Used for primitive type DOCUMENT_INFO_RECORD_DOC_N
        document_info_record_doc_n TYPE c LENGTH 25,
        "! Used for primitive type DOCUMENT_INFO_RECORD_DOC_P
        document_info_record_doc_p TYPE c LENGTH 3,
        "! Used for primitive type DOCUMENT_INFO_RECORD_DOC_T
        document_info_record_doc_t TYPE c LENGTH 3,
        "! Used for primitive type DOCUMENT_INFO_RECORD_DOC_V
        document_info_record_doc_v TYPE c LENGTH 2,
        "! Used for primitive type EXTERNAL_DOCUMENT_ID
        external_document_id       TYPE c LENGTH 200,
        "! Used for primitive type FILE_NAME
        file_name                  TYPE c LENGTH 255,
        "! Used for primitive type HARMONIZED_DOCUMENT_TYPE
        harmonized_document_type   TYPE c LENGTH 40,
        "! Used for primitive type HARMONIZED_DOCUMENT_TYPE_2
        harmonized_document_type_2 TYPE c LENGTH 40,
        "! Used for primitive type HARMONIZED_DOCUMENT_TYPE_3
        harmonized_document_type_3 TYPE c LENGTH 40,
        "! Used for primitive type HARMONIZED_DOCUMENT_TYPE_4
        harmonized_document_type_4 TYPE c LENGTH 40,
        "! Used for primitive type LINKED_SAPOBJECT_KEY
        linked_sapobject_key       TYPE c LENGTH 90,
        "! Used for primitive type LINKED_SAPOBJECT_KEY_2
        linked_sapobject_key_2     TYPE c LENGTH 90,
        "! Used for primitive type LINKED_SAPOBJECT_KEY_3
        linked_sapobject_key_3     TYPE c LENGTH 90,
        "! Used for primitive type LINKED_SAPOBJECT_KEY_4
        linked_sapobject_key_4     TYPE c LENGTH 90,
        "! Used for primitive type LINKED_SAPOBJECT_KEY_5
        linked_sapobject_key_5     TYPE c LENGTH 90,
        "! Used for primitive type LINKED_SAPOBJECT_KEY_6
        linked_sapobject_key_6     TYPE c LENGTH 90,
        "! Used for primitive type LINKED_SAPOBJECT_KEY_7
        linked_sapobject_key_7     TYPE c LENGTH 90,
        "! Used for primitive type LOGICAL_DOCUMENT
        logical_document           TYPE c LENGTH 32,
        "! Used for primitive type LOGICAL_DOCUMENT_2
        logical_document_2         TYPE c LENGTH 32,
        "! Used for primitive type LOGICAL_DOCUMENT_3
        logical_document_3         TYPE c LENGTH 32,
        "! Used for primitive type MIMETYPE
        mimetype                   TYPE c LENGTH 40,
        "! Used for primitive type SAPOBJECT_NODE_TYPE
        sapobject_node_type        TYPE c LENGTH 30,
        "! Used for primitive type SAPOBJECT_NODE_TYPE_2
        sapobject_node_type_2      TYPE c LENGTH 30,
        "! Used for primitive type SAPOBJECT_NODE_TYPE_3
        sapobject_node_type_3      TYPE c LENGTH 30,
        "! Used for primitive type SAPOBJECT_NODE_TYPE_4
        sapobject_node_type_4      TYPE c LENGTH 30,
        "! Used for primitive type SAPOBJECT_NODE_TYPE_5
        sapobject_node_type_5      TYPE c LENGTH 30,
        "! Used for primitive type SAPOBJECT_NODE_TYPE_6
        sapobject_node_type_6      TYPE c LENGTH 30,
        "! Used for primitive type SAPOBJECT_NODE_TYPE_7
        sapobject_node_type_7      TYPE c LENGTH 30,
        "! Used for primitive type SAPOBJECT_NODE_TYPE_8
        sapobject_node_type_8      TYPE c LENGTH 30,
        "! Used for primitive type SAPOBJECT_TYPE
        sapobject_type             TYPE c LENGTH 30,
        "! Used for primitive type SAPOBJECT_TYPE_2
        sapobject_type_2           TYPE c LENGTH 30,
        "! Used for primitive type SAPOBJECT_TYPE_3
        sapobject_type_3           TYPE c LENGTH 30,
        "! Used for primitive type SAPOBJECT_TYPE_4
        sapobject_type_4           TYPE c LENGTH 30,
        "! Used for primitive type SAPOBJECT_TYPE_5
        sapobject_type_5           TYPE c LENGTH 30,
        "! Used for primitive type SAPOBJECT_TYPE_6
        sapobject_type_6           TYPE c LENGTH 30,
        "! Used for primitive type SAPOBJECT_TYPE_7
        sapobject_type_7           TYPE c LENGTH 30,
        "! Used for primitive type SAPOBJECT_TYPE_8
        sapobject_type_8           TYPE c LENGTH 30,
        "! Used for primitive type SEMANTIC_OBJECT
        semantic_object            TYPE c LENGTH 40,
        "! Used for primitive type SEMANTIC_OBJECT_2
        semantic_object_2          TYPE c LENGTH 40,
        "! Used for primitive type SEMANTIC_OBJECT_3
        semantic_object_3          TYPE c LENGTH 40,
        "! Used for primitive type SEMANTIC_OBJECT_4
        semantic_object_4          TYPE c LENGTH 40,
        "! Used for primitive type SOURCE_BUSINESS_OBJECT_TYP
        source_business_object_typ TYPE c LENGTH 40,
        "! Used for primitive type SOURCE_LINKED_SAPOBJECT_KE
        source_linked_sapobject_ke TYPE c LENGTH 90,
        "! Used for primitive type SOURCE_SAPOBJECT_NODE_TYPE
        source_sapobject_node_type TYPE c LENGTH 30,
        "! Used for primitive type SOURCE_SAPOBJECT_TYPE
        source_sapobject_type      TYPE c LENGTH 30,
        "! Used for primitive type STORAGE_CATEGORY
        storage_category           TYPE c LENGTH 10,
        "! Used for primitive type TARGET_BUSINESS_OBJECT_TYP
        target_business_object_typ TYPE c LENGTH 40,
        "! Used for primitive type TARGET_LINKED_SAPOBJECT_KE
        target_linked_sapobject_ke TYPE c LENGTH 90,
        "! Used for primitive type TARGET_SAPOBJECT_NODE_TYPE
        target_sapobject_node_type TYPE c LENGTH 30,
        "! Used for primitive type TARGET_SAPOBJECT_TYPE
        target_sapobject_type      TYPE c LENGTH 30,
        "! Used for primitive type URL
        url                        TYPE string,
        "! Used for primitive type URL_DESCRIPTION
        url_description            TYPE c LENGTH 255,
      END OF tys_types_for_prim_types.

    TYPES:
      "! <p class="shorttext synchronized">AssignDocument</p>
      BEGIN OF tys_assign_document,
        "! IsAssigned
        is_assigned TYPE abap_bool,
      END OF tys_assign_document,
      "! <p class="shorttext synchronized">List of AssignDocument</p>
      tyt_assign_document TYPE STANDARD TABLE OF tys_assign_document WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">AttachmentsCount</p>
      BEGIN OF tys_attachments_count,
        "! AttachmentCount
        attachment_count TYPE int2,
      END OF tys_attachments_count,
      "! <p class="shorttext synchronized">List of AttachmentsCount</p>
      tyt_attachments_count TYPE STANDARD TABLE OF tys_attachments_count WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function AssignDocumentToBusinessObject</p>
      "! <em>with the internal name</em> ASSIGN_DOCUMENT_TO_BUSINES
      BEGIN OF tys_parameters_1,
        "! SourceLinkedSAPObjectKey
        source_linked_sapobject_ke TYPE c LENGTH 90,
        "! SourceBusinessObjectTypeName
        source_business_object_typ TYPE c LENGTH 40,
        "! SourceSAPObjectNodeType
        source_sapobject_node_type TYPE c LENGTH 30,
        "! SourceSAPObjectType
        source_sapobject_type      TYPE c LENGTH 30,
        "! ArchiveDocumentID
        archive_document_id        TYPE c LENGTH 40,
        "! TargetLinkedSAPObjectKey
        target_linked_sapobject_ke TYPE c LENGTH 90,
        "! TargetBusinessObjectTypeName
        target_business_object_typ TYPE c LENGTH 40,
        "! TargetSAPObjectNodeType
        target_sapobject_node_type TYPE c LENGTH 30,
        "! TargetSAPObjectType
        target_sapobject_type      TYPE c LENGTH 30,
      END OF tys_parameters_1,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_1</p>
      tyt_parameters_1 TYPE STANDARD TABLE OF tys_parameters_1 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function CreateUrlAsAttachment</p>
      "! <em>with the internal name</em> CREATE_URL_AS_ATTACHMENT
      BEGIN OF tys_parameters_2,
        "! HarmonizedDocumentType
        harmonized_document_type  TYPE c LENGTH 40,
        "! SAPObjectType
        sapobject_type            TYPE c LENGTH 30,
        "! SAPObjectNodeType
        sapobject_node_type       TYPE c LENGTH 30,
        "! SemanticObject
        semantic_object           TYPE c LENGTH 40,
        "! LinkedSAPObjectKey
        linked_sapobject_key      TYPE c LENGTH 90,
        "! BusinessObjectTypeName
        business_object_type_name TYPE c LENGTH 40,
        "! Url
        url                       TYPE string,
        "! UrlDescription
        url_description           TYPE c LENGTH 255,
        "! MIMEType
        mimetype                  TYPE c LENGTH 40,
      END OF tys_parameters_2,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_2</p>
      tyt_parameters_2 TYPE STANDARD TABLE OF tys_parameters_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function GetAllOriginals</p>
      "! <em>with the internal name</em> GET_ALL_ORIGINALS
      BEGIN OF tys_parameters_3,
        "! SAPObjectNodeType
        sapobject_node_type       TYPE c LENGTH 30,
        "! SAPObjectType
        sapobject_type            TYPE c LENGTH 30,
        "! SemanticObject
        semantic_object           TYPE c LENGTH 40,
        "! BusinessObjectTypeName
        business_object_type_name TYPE c LENGTH 40,
        "! LinkedSAPObjectKey
        linked_sapobject_key      TYPE c LENGTH 90,
      END OF tys_parameters_3,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_3</p>
      tyt_parameters_3 TYPE STANDARD TABLE OF tys_parameters_3 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function GetAttachmentCount</p>
      "! <em>with the internal name</em> GET_ATTACHMENT_COUNT
      BEGIN OF tys_parameters_4,
        "! SAPObjectNodeType
        sapobject_node_type       TYPE c LENGTH 30,
        "! SAPObjectType
        sapobject_type            TYPE c LENGTH 30,
        "! SemanticObject
        semantic_object           TYPE c LENGTH 40,
        "! LinkedSAPObjectKey
        linked_sapobject_key      TYPE c LENGTH 90,
        "! BusinessObjectTypeName
        business_object_type_name TYPE c LENGTH 40,
      END OF tys_parameters_4,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_4</p>
      tyt_parameters_4 TYPE STANDARD TABLE OF tys_parameters_4 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function GetSAPObjectDocumentType</p>
      "! <em>with the internal name</em> GET_SAPOBJECT_DOCUMENT_TYP
      BEGIN OF tys_parameters_5,
        "! SAPObjectNodeType
        sapobject_node_type TYPE c LENGTH 30,
        "! SAPObjectType
        sapobject_type      TYPE c LENGTH 30,
      END OF tys_parameters_5,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_5</p>
      tyt_parameters_5 TYPE STANDARD TABLE OF tys_parameters_5 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function LinkAttachmentToSAPObjectNode</p>
      "! <em>with the internal name</em> LINK_ATTACHMENT_TO_SAPOBJE
      BEGIN OF tys_parameters_6,
        "! SAPObjectType
        sapobject_type           TYPE c LENGTH 30,
        "! SAPObjectNodeType
        sapobject_node_type      TYPE c LENGTH 30,
        "! LogicalDocument
        logical_document         TYPE c LENGTH 32,
        "! ArchiveDocumentID
        archive_document_id      TYPE c LENGTH 40,
        "! HarmonizedDocumentType
        harmonized_document_type TYPE c LENGTH 40,
        "! LinkedSAPObjectKey
        linked_sapobject_key     TYPE c LENGTH 90,
      END OF tys_parameters_6,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_6</p>
      tyt_parameters_6 TYPE STANDARD TABLE OF tys_parameters_6 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function LinkAttachmentToSAPObject</p>
      "! <em>with the internal name</em> LINK_ATTACHMENT_TO_SAPOB_2
      BEGIN OF tys_parameters_7,
        "! LinkedSAPObjectKey
        linked_sapobject_key     TYPE c LENGTH 90,
        "! HarmonizedDocumentType
        harmonized_document_type TYPE c LENGTH 40,
        "! ArchiveDocumentID
        archive_document_id      TYPE c LENGTH 40,
        "! LogicalDocument
        logical_document         TYPE c LENGTH 32,
        "! SAPObjectNodeType
        sapobject_node_type      TYPE c LENGTH 30,
        "! SAPObjectType
        sapobject_type           TYPE c LENGTH 30,
      END OF tys_parameters_7,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_7</p>
      tyt_parameters_7 TYPE STANDARD TABLE OF tys_parameters_7 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function LinkFileToBO</p>
      "! <em>with the internal name</em> LINK_FILE_TO_BO
      BEGIN OF tys_parameters_8,
        "! StorageCategory
        storage_category          TYPE c LENGTH 10,
        "! ExternalDocumentID
        external_document_id      TYPE c LENGTH 200,
        "! BusinessObjectTypeName
        business_object_type_name TYPE c LENGTH 40,
        "! LinkedSAPObjectKey
        linked_sapobject_key      TYPE c LENGTH 90,
        "! SAPObjectType
        sapobject_type            TYPE c LENGTH 30,
        "! SAPObjectNodeType
        sapobject_node_type       TYPE c LENGTH 30,
        "! HarmonizedDocumentType
        harmonized_document_type  TYPE c LENGTH 40,
      END OF tys_parameters_8,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_8</p>
      tyt_parameters_8 TYPE STANDARD TABLE OF tys_parameters_8 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function RenameAttachment</p>
      "! <em>with the internal name</em> RENAME_ATTACHMENT
      BEGIN OF tys_parameters_9,
        "! SAPObjectNodeType
        sapobject_node_type        TYPE c LENGTH 30,
        "! SAPObjectType
        sapobject_type             TYPE c LENGTH 30,
        "! DocumentInfoRecordDocPart
        document_info_record_doc_p TYPE c LENGTH 3,
        "! DocumentInfoRecordDocNumber
        document_info_record_doc_n TYPE c LENGTH 25,
        "! FileName
        file_name                  TYPE c LENGTH 255,
        "! SemanticObject
        semantic_object            TYPE c LENGTH 40,
        "! LinkedSAPObjectKey
        linked_sapobject_key       TYPE c LENGTH 90,
        "! BusinessObjectTypeName
        business_object_type_name  TYPE c LENGTH 40,
        "! ArchiveDocumentID
        archive_document_id        TYPE c LENGTH 40,
        "! LogicalDocument
        logical_document           TYPE c LENGTH 32,
        "! DocumentInfoRecordDocVersion
        document_info_record_doc_v TYPE c LENGTH 2,
        "! DocumentInfoRecordDocType
        document_info_record_doc_t TYPE c LENGTH 3,
      END OF tys_parameters_9,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_9</p>
      tyt_parameters_9 TYPE STANDARD TABLE OF tys_parameters_9 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">AttachmentContent</p>
      BEGIN OF tys_attachment_content,
        "! <em>Key property</em> DocumentInfoRecordDocType
        document_info_record_doc_t TYPE c LENGTH 3,
        "! <em>Key property</em> DocumentInfoRecordDocNumber
        document_info_record_doc_n TYPE c LENGTH 25,
        "! <em>Key property</em> DocumentInfoRecordDocVersion
        document_info_record_doc_v TYPE c LENGTH 2,
        "! <em>Key property</em> DocumentInfoRecordDocPart
        document_info_record_doc_p TYPE c LENGTH 3,
        "! <em>Key property</em> LogicalDocument
        logical_document           TYPE c LENGTH 32,
        "! <em>Key property</em> ArchiveDocumentID
        archive_document_id        TYPE c LENGTH 40,
        "! <em>Key property</em> LinkedSAPObjectKey
        linked_sapobject_key       TYPE c LENGTH 90,
        "! <em>Key property</em> BusinessObjectTypeName
        business_object_type_name  TYPE c LENGTH 40,
        "! SemanticObject
        semantic_object            TYPE c LENGTH 40,
        "! WorkstationApplication
        workstation_application    TYPE c LENGTH 3,
        "! FileSize
        file_size                  TYPE c LENGTH 12,
        "! FileName
        file_name                  TYPE c LENGTH 255,
        "! DocumentURL
        document_url               TYPE string,
        "! MimeType
        mime_type                  TYPE c LENGTH 128,
        "! Content
        content                    TYPE xstring,
        "! CreatedByUser
        created_by_user            TYPE c LENGTH 12,
        "! CreatedByUserFullName
        created_by_user_full_name  TYPE c LENGTH 80,
        "! CreationDateTime
        creation_date_time         TYPE timestampl,
        "! BusinessObjectType
        business_object_type       TYPE c LENGTH 40,
        "! LastChangedByUser
        last_changed_by_user       TYPE c LENGTH 12,
        "! LastChangedByUserFullName
        last_changed_by_user_full  TYPE c LENGTH 80,
        "! ChangedDateTime
        changed_date_time          TYPE timestampl,
        "! StorageCategory
        storage_category           TYPE c LENGTH 10,
        "! ArchiveLinkRepository
        archive_link_repository    TYPE c LENGTH 2,
        "! SAPObjectType
        sapobject_type             TYPE c LENGTH 30,
        "! SAPObjectNodeType
        sapobject_node_type        TYPE c LENGTH 30,
        "! HarmonizedDocumentType
        harmonized_document_type   TYPE c LENGTH 40,
        "! AttachmentDeletionIsAllowed
        attachment_deletion_is_all TYPE abap_bool,
        "! AttachmentRenameIsAllowed
        attachment_rename_is_allow TYPE abap_bool,
        "! Source
        source                     TYPE c LENGTH 10,
        "! AttachmentContentHash
        attachment_content_hash    TYPE c LENGTH 255,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_attachment_content,
      "! <p class="shorttext synchronized">List of AttachmentContent</p>
      tyt_attachment_content TYPE STANDARD TABLE OF tys_attachment_content WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">AttachmentForSAPObjectNodeType</p>
      BEGIN OF tys_attachment_for_sapobject_2,
        "! DocumentInfoRecordDocType
        document_info_record_doc_t TYPE c LENGTH 3,
        "! DocumentInfoRecordDocNumber
        document_info_record_doc_n TYPE c LENGTH 25,
        "! DocumentInfoRecordDocVersion
        document_info_record_doc_v TYPE c LENGTH 2,
        "! DocumentInfoRecordDocPart
        document_info_record_doc_p TYPE c LENGTH 3,
        "! <em>Key property</em> LogicalDocument
        logical_document           TYPE c LENGTH 32,
        "! <em>Key property</em> ArchiveDocumentID
        archive_document_id        TYPE c LENGTH 40,
        "! <em>Key property</em> LinkedSAPObjectKey
        linked_sapobject_key       TYPE c LENGTH 90,
        "! BusinessObjectTypeName
        business_object_type_name  TYPE c LENGTH 40,
        "! FileSize
        file_size                  TYPE c LENGTH 12,
        "! FileName
        file_name                  TYPE c LENGTH 255,
        "! MimeType
        mime_type                  TYPE c LENGTH 128,
        "! CheckoutUser
        checkout_user              TYPE c LENGTH 12,
        "! CheckoutUserFullName
        checkout_user_full_name    TYPE c LENGTH 80,
        "! CreatedByUser
        created_by_user            TYPE c LENGTH 12,
        "! CreatedByUserFullName
        created_by_user_full_name  TYPE c LENGTH 80,
        "! CreationDateTime
        creation_date_time         TYPE timestampl,
        "! LastChangedByUser
        last_changed_by_user       TYPE c LENGTH 12,
        "! LastChangedByUserFullName
        last_changed_by_user_full  TYPE c LENGTH 80,
        "! ChangedDateTime
        changed_date_time          TYPE timestampl,
        "! StorageCategory
        storage_category           TYPE c LENGTH 10,
        "! ArchiveLinkRepository
        archive_link_repository    TYPE c LENGTH 2,
        "! <em>Key property</em> SAPObjectType
        sapobject_type             TYPE c LENGTH 30,
        "! <em>Key property</em> SAPObjectNodeType
        sapobject_node_type        TYPE c LENGTH 30,
        "! <em>Key property</em> HarmonizedDocumentType
        harmonized_document_type   TYPE c LENGTH 40,
        "! AttachmentDeletionIsAllowed
        attachment_deletion_is_all TYPE abap_bool,
        "! AttachmentRenameIsAllowed
        attachment_rename_is_allow TYPE abap_bool,
        "! URLToUploadAttachment
        urlto_upload_attachment    TYPE string,
        "! URLToReadAttachment
        urlto_read_attachment      TYPE string,
        "! OneTimeValidTokenForAttachment
        one_time_valid_token_for_a TYPE c LENGTH 128,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_attachment_for_sapobject_2,
      "! <p class="shorttext synchronized">List of AttachmentForSAPObjectNodeType</p>
      tyt_attachment_for_sapobject_2 TYPE STANDARD TABLE OF tys_attachment_for_sapobject_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">AttachmentHarmonizedOperation</p>
      BEGIN OF tys_attachment_harmonized_op_2,
        "! DocumentInfoRecordDocType
        document_info_record_doc_t TYPE c LENGTH 3,
        "! DocumentInfoRecordDocNumber
        document_info_record_doc_n TYPE c LENGTH 25,
        "! DocumentInfoRecordDocVersion
        document_info_record_doc_v TYPE c LENGTH 2,
        "! DocumentInfoRecordDocPart
        document_info_record_doc_p TYPE c LENGTH 3,
        "! <em>Key property</em> LogicalDocument
        logical_document           TYPE c LENGTH 32,
        "! <em>Key property</em> ArchiveDocumentID
        archive_document_id        TYPE c LENGTH 40,
        "! <em>Key property</em> LinkedSAPObjectKey
        linked_sapobject_key       TYPE c LENGTH 90,
        "! BusinessObjectTypeName
        business_object_type_name  TYPE c LENGTH 40,
        "! FileSize
        file_size                  TYPE c LENGTH 12,
        "! FileName
        file_name                  TYPE c LENGTH 255,
        "! MimeType
        mime_type                  TYPE c LENGTH 128,
        "! CheckoutUser
        checkout_user              TYPE c LENGTH 12,
        "! CheckoutUserFullName
        checkout_user_full_name    TYPE c LENGTH 80,
        "! CreatedByUser
        created_by_user            TYPE c LENGTH 12,
        "! CreatedByUserFullName
        created_by_user_full_name  TYPE c LENGTH 80,
        "! CreationDateTime
        creation_date_time         TYPE timestampl,
        "! LastChangedByUser
        last_changed_by_user       TYPE c LENGTH 12,
        "! LastChangedByUserFullName
        last_changed_by_user_full  TYPE c LENGTH 80,
        "! ChangedDateTime
        changed_date_time          TYPE timestampl,
        "! StorageCategory
        storage_category           TYPE c LENGTH 10,
        "! ArchiveLinkRepository
        archive_link_repository    TYPE c LENGTH 2,
        "! <em>Key property</em> SAPObjectType
        sapobject_type             TYPE c LENGTH 30,
        "! SAPObjectNodeType
        sapobject_node_type        TYPE c LENGTH 30,
        "! <em>Key property</em> HarmonizedDocumentType
        harmonized_document_type   TYPE c LENGTH 40,
        "! AttachmentDeletionIsAllowed
        attachment_deletion_is_all TYPE abap_bool,
        "! AttachmentRenameIsAllowed
        attachment_rename_is_allow TYPE abap_bool,
        "! URLToUploadAttachment
        urlto_upload_attachment    TYPE string,
        "! URLToReadAttachment
        urlto_read_attachment      TYPE string,
        "! OneTimeValidTokenForAttachment
        one_time_valid_token_for_a TYPE c LENGTH 128,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_attachment_harmonized_op_2,
      "! <p class="shorttext synchronized">List of AttachmentHarmonizedOperation</p>
      tyt_attachment_harmonized_op_2 TYPE STANDARD TABLE OF tys_attachment_harmonized_op_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_DocumentInfoRecordAttchType</p>
      BEGIN OF tys_a_document_info_record_a_2,
        "! <em>Key property</em> DocumentInfoRecordDocType
        document_info_record_doc_t TYPE c LENGTH 3,
        "! <em>Key property</em> DocumentInfoRecordDocNumber
        document_info_record_doc_n TYPE c LENGTH 25,
        "! <em>Key property</em> DocumentInfoRecordDocVersion
        document_info_record_doc_v TYPE c LENGTH 2,
        "! <em>Key property</em> DocumentInfoRecordDocPart
        document_info_record_doc_p TYPE c LENGTH 3,
        "! DocumentInfoRecord
        document_info_record       TYPE c LENGTH 70,
        "! DocumentDescription
        document_description       TYPE c LENGTH 40,
        "! ExternalDocumentStatus
        external_document_status   TYPE c LENGTH 2,
        "! DocumentStatusName
        document_status_name       TYPE c LENGTH 16,
        "! DocInfoRecdIsMarkedForDeletion
        doc_info_recd_is_marked_fo TYPE abap_bool,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_a_document_info_record_a_2,
      "! <p class="shorttext synchronized">List of A_DocumentInfoRecordAttchType</p>
      tyt_a_document_info_record_a_2 TYPE STANDARD TABLE OF tys_a_document_info_record_a_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAPObjectDocumentType</p>
      BEGIN OF tys_sapobject_document_type,
        "! <em>Key property</em> SAPObjectType
        sapobject_type             TYPE c LENGTH 30,
        "! <em>Key property</em> SAPObjectNodeType
        sapobject_node_type        TYPE c LENGTH 30,
        "! <em>Key property</em> HarmonizedDocumentType
        harmonized_document_type   TYPE c LENGTH 40,
        "! DocumentTypeDescription
        document_type_description  TYPE c LENGTH 40,
        "! PermittedArchiveLinkMimeType
        permitted_archive_link_mim TYPE c LENGTH 128,
        "! AttachmentFramework
        attachment_framework       TYPE c LENGTH 3,
        "! DocumentTypeIsDefault
        document_type_is_default   TYPE c LENGTH 1,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_sapobject_document_type,
      "! <p class="shorttext synchronized">List of SAPObjectDocumentType</p>
      tyt_sapobject_document_type TYPE STANDARD TABLE OF tys_sapobject_document_type WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! AttachmentContentSet
        "! <br/> Collection of type 'AttachmentContent'
        attachment_content_set     TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'ATTACHMENT_CONTENT_SET',
        "! AttachmentForSAPObjectNodeTypeSet
        "! <br/> Collection of type 'AttachmentForSAPObjectNodeType'
        attachment_for_sapobject_n TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'ATTACHMENT_FOR_SAPOBJECT_N',
        "! AttachmentHarmonizedOperationSet
        "! <br/> Collection of type 'AttachmentHarmonizedOperation'
        attachment_harmonized_oper TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'ATTACHMENT_HARMONIZED_OPER',
        "! A_DocumentInfoRecordAttch
        "! <br/> Collection of type 'A_DocumentInfoRecordAttchType'
        a_document_info_record_att TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_DOCUMENT_INFO_RECORD_ATT',
        "! SAPObjectDocumentTypeSet
        "! <br/> Collection of type 'SAPObjectDocumentType'
        sapobject_document_type_se TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAPOBJECT_DOCUMENT_TYPE_SE',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the function imports</p>
      BEGIN OF gcs_function_import,
        "! AssignDocumentToBusinessObject
        "! <br/> See structure type {@link ..tys_parameters_1} for the parameters
        assign_document_to_busines TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'ASSIGN_DOCUMENT_TO_BUSINES',
        "! AuthorizationCheck
        authorization_check        TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'AUTHORIZATION_CHECK',
        "! CreateUrlAsAttachment
        "! <br/> See structure type {@link ..tys_parameters_2} for the parameters
        create_url_as_attachment   TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'CREATE_URL_AS_ATTACHMENT',
        "! GetAllOriginals
        "! <br/> See structure type {@link ..tys_parameters_3} for the parameters
        get_all_originals          TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'GET_ALL_ORIGINALS',
        "! GetAttachmentCount
        "! <br/> See structure type {@link ..tys_parameters_4} for the parameters
        get_attachment_count       TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'GET_ATTACHMENT_COUNT',
        "! GetSAPObjectDocumentType
        "! <br/> See structure type {@link ..tys_parameters_5} for the parameters
        get_sapobject_document_typ TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'GET_SAPOBJECT_DOCUMENT_TYP',
        "! LinkAttachmentToSAPObjectNode
        "! <br/> See structure type {@link ..tys_parameters_6} for the parameters
        link_attachment_to_sapobje TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'LINK_ATTACHMENT_TO_SAPOBJE',
        "! LinkAttachmentToSAPObject
        "! <br/> See structure type {@link ..tys_parameters_7} for the parameters
        link_attachment_to_sapob_2 TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'LINK_ATTACHMENT_TO_SAPOB_2',
        "! LinkFileToBO
        "! <br/> See structure type {@link ..tys_parameters_8} for the parameters
        link_file_to_bo            TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'LINK_FILE_TO_BO',
        "! RenameAttachment
        "! <br/> See structure type {@link ..tys_parameters_9} for the parameters
        rename_attachment          TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'RENAME_ATTACHMENT',
      END OF gcs_function_import.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the bound functions</p>
      BEGIN OF gcs_bound_function,
         "! Dummy field - Structure must not be empty
         dummy TYPE int1 VALUE 0,
      END OF gcs_bound_function.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for complex types</p>
      BEGIN OF gcs_complex_type,
        "! <p class="shorttext synchronized">Internal names for AssignDocument</p>
        "! See also structure type {@link ..tys_assign_document}
        BEGIN OF assign_document,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF assign_document,
        "! <p class="shorttext synchronized">Internal names for AttachmentsCount</p>
        "! See also structure type {@link ..tys_attachments_count}
        BEGIN OF attachments_count,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF attachments_count,
      END OF gcs_complex_type.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for AttachmentContent</p>
        "! See also structure type {@link ..tys_attachment_content}
        BEGIN OF attachment_content,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF attachment_content,
        "! <p class="shorttext synchronized">Internal names for AttachmentForSAPObjectNodeType</p>
        "! See also structure type {@link ..tys_attachment_for_sapobject_2}
        BEGIN OF attachment_for_sapobject_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF attachment_for_sapobject_2,
        "! <p class="shorttext synchronized">Internal names for AttachmentHarmonizedOperation</p>
        "! See also structure type {@link ..tys_attachment_harmonized_op_2}
        BEGIN OF attachment_harmonized_op_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF attachment_harmonized_op_2,
        "! <p class="shorttext synchronized">Internal names for A_DocumentInfoRecordAttchType</p>
        "! See also structure type {@link ..tys_a_document_info_record_a_2}
        BEGIN OF a_document_info_record_a_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! DocumentInfoRecordToAttachmentNavigation
            document_info_record_to_at TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'DOCUMENT_INFO_RECORD_TO_AT',
          END OF navigation,
        END OF a_document_info_record_a_2,
        "! <p class="shorttext synchronized">Internal names for SAPObjectDocumentType</p>
        "! See also structure type {@link ..tys_sapobject_document_type}
        BEGIN OF sapobject_document_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sapobject_document_type,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define AssignDocument</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_assign_document RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define AttachmentsCount</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_attachments_count RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define AttachmentContent</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_attachment_content RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define AttachmentForSAPObjectNodeType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_attachment_for_sapobject_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define AttachmentHarmonizedOperation</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_attachment_harmonized_op_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_DocumentInfoRecordAttchType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_document_info_record_a_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAPObjectDocumentType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sapobject_document_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define AssignDocumentToBusinessObject</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_assign_document_to_busines RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define AuthorizationCheck</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_authorization_check RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define CreateUrlAsAttachment</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_create_url_as_attachment RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define GetAllOriginals</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_get_all_originals RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define GetAttachmentCount</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_get_attachment_count RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define GetSAPObjectDocumentType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_get_sapobject_document_typ RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define LinkAttachmentToSAPObjectNode</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_link_attachment_to_sapobje RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define LinkAttachmentToSAPObject</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_link_attachment_to_sapob_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define LinkFileToBO</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_link_file_to_bo RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define RenameAttachment</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_rename_attachment RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define all primitive types</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS define_primitive_types RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZCL_SCM_ODATA_CRUD_ATTM IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'API_CV_ATTACHMENT_SRV' ) ##NO_TEXT.

    def_assign_document( ).
    def_attachments_count( ).
    def_attachment_content( ).
    def_attachment_for_sapobject_2( ).
    def_attachment_harmonized_op_2( ).
    def_a_document_info_record_a_2( ).
    def_sapobject_document_type( ).
    def_assign_document_to_busines( ).
    def_authorization_check( ).
    def_create_url_as_attachment( ).
    def_get_all_originals( ).
    def_get_attachment_count( ).
    def_get_sapobject_document_typ( ).
    def_link_attachment_to_sapobje( ).
    def_link_attachment_to_sapob_2( ).
    def_link_file_to_bo( ).
    def_rename_attachment( ).
    define_primitive_types( ).

  ENDMETHOD.


  METHOD define_primitive_types.

    DATA lo_primitive_type TYPE REF TO /iwbep/if_v4_pm_prim_type.


    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'ARCHIVE_DOCUMENT_ID'
                            iv_element             = VALUE tys_types_for_prim_types-archive_document_id( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'ARCHIVE_DOCUMENT_ID_2'
                            iv_element             = VALUE tys_types_for_prim_types-archive_document_id_2( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'ARCHIVE_DOCUMENT_ID_3'
                            iv_element             = VALUE tys_types_for_prim_types-archive_document_id_3( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'ARCHIVE_DOCUMENT_ID_4'
                            iv_element             = VALUE tys_types_for_prim_types-archive_document_id_4( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'BUSINESS_OBJECT_TYPE_NAME'
                            iv_element             = VALUE tys_types_for_prim_types-business_object_type_name( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'BUSINESS_OBJECT_TYPE_NAM_2'
                            iv_element             = VALUE tys_types_for_prim_types-business_object_type_nam_2( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'BUSINESS_OBJECT_TYPE_NAM_3'
                            iv_element             = VALUE tys_types_for_prim_types-business_object_type_nam_3( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'BUSINESS_OBJECT_TYPE_NAM_4'
                            iv_element             = VALUE tys_types_for_prim_types-business_object_type_nam_4( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'BUSINESS_OBJECT_TYPE_NAM_5'
                            iv_element             = VALUE tys_types_for_prim_types-business_object_type_nam_5( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'DOCUMENT_INFO_RECORD_DOC_N'
                            iv_element             = VALUE tys_types_for_prim_types-document_info_record_doc_n( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'DOCUMENT_INFO_RECORD_DOC_P'
                            iv_element             = VALUE tys_types_for_prim_types-document_info_record_doc_p( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'DOCUMENT_INFO_RECORD_DOC_T'
                            iv_element             = VALUE tys_types_for_prim_types-document_info_record_doc_t( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'DOCUMENT_INFO_RECORD_DOC_V'
                            iv_element             = VALUE tys_types_for_prim_types-document_info_record_doc_v( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'EXTERNAL_DOCUMENT_ID'
                            iv_element             = VALUE tys_types_for_prim_types-external_document_id( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'FILE_NAME'
                            iv_element             = VALUE tys_types_for_prim_types-file_name( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'HARMONIZED_DOCUMENT_TYPE'
                            iv_element             = VALUE tys_types_for_prim_types-harmonized_document_type( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'HARMONIZED_DOCUMENT_TYPE_2'
                            iv_element             = VALUE tys_types_for_prim_types-harmonized_document_type_2( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'HARMONIZED_DOCUMENT_TYPE_3'
                            iv_element             = VALUE tys_types_for_prim_types-harmonized_document_type_3( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'HARMONIZED_DOCUMENT_TYPE_4'
                            iv_element             = VALUE tys_types_for_prim_types-harmonized_document_type_4( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'LINKED_SAPOBJECT_KEY'
                            iv_element             = VALUE tys_types_for_prim_types-linked_sapobject_key( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'LINKED_SAPOBJECT_KEY_2'
                            iv_element             = VALUE tys_types_for_prim_types-linked_sapobject_key_2( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'LINKED_SAPOBJECT_KEY_3'
                            iv_element             = VALUE tys_types_for_prim_types-linked_sapobject_key_3( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'LINKED_SAPOBJECT_KEY_4'
                            iv_element             = VALUE tys_types_for_prim_types-linked_sapobject_key_4( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'LINKED_SAPOBJECT_KEY_5'
                            iv_element             = VALUE tys_types_for_prim_types-linked_sapobject_key_5( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'LINKED_SAPOBJECT_KEY_6'
                            iv_element             = VALUE tys_types_for_prim_types-linked_sapobject_key_6( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'LINKED_SAPOBJECT_KEY_7'
                            iv_element             = VALUE tys_types_for_prim_types-linked_sapobject_key_7( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'LOGICAL_DOCUMENT'
                            iv_element             = VALUE tys_types_for_prim_types-logical_document( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'LOGICAL_DOCUMENT_2'
                            iv_element             = VALUE tys_types_for_prim_types-logical_document_2( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'LOGICAL_DOCUMENT_3'
                            iv_element             = VALUE tys_types_for_prim_types-logical_document_3( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'MIMETYPE'
                            iv_element             = VALUE tys_types_for_prim_types-mimetype( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SAPOBJECT_NODE_TYPE'
                            iv_element             = VALUE tys_types_for_prim_types-sapobject_node_type( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SAPOBJECT_NODE_TYPE_2'
                            iv_element             = VALUE tys_types_for_prim_types-sapobject_node_type_2( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SAPOBJECT_NODE_TYPE_3'
                            iv_element             = VALUE tys_types_for_prim_types-sapobject_node_type_3( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SAPOBJECT_NODE_TYPE_4'
                            iv_element             = VALUE tys_types_for_prim_types-sapobject_node_type_4( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SAPOBJECT_NODE_TYPE_5'
                            iv_element             = VALUE tys_types_for_prim_types-sapobject_node_type_5( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SAPOBJECT_NODE_TYPE_6'
                            iv_element             = VALUE tys_types_for_prim_types-sapobject_node_type_6( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SAPOBJECT_NODE_TYPE_7'
                            iv_element             = VALUE tys_types_for_prim_types-sapobject_node_type_7( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SAPOBJECT_NODE_TYPE_8'
                            iv_element             = VALUE tys_types_for_prim_types-sapobject_node_type_8( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SAPOBJECT_TYPE'
                            iv_element             = VALUE tys_types_for_prim_types-sapobject_type( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SAPOBJECT_TYPE_2'
                            iv_element             = VALUE tys_types_for_prim_types-sapobject_type_2( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SAPOBJECT_TYPE_3'
                            iv_element             = VALUE tys_types_for_prim_types-sapobject_type_3( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SAPOBJECT_TYPE_4'
                            iv_element             = VALUE tys_types_for_prim_types-sapobject_type_4( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SAPOBJECT_TYPE_5'
                            iv_element             = VALUE tys_types_for_prim_types-sapobject_type_5( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SAPOBJECT_TYPE_6'
                            iv_element             = VALUE tys_types_for_prim_types-sapobject_type_6( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SAPOBJECT_TYPE_7'
                            iv_element             = VALUE tys_types_for_prim_types-sapobject_type_7( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SAPOBJECT_TYPE_8'
                            iv_element             = VALUE tys_types_for_prim_types-sapobject_type_8( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SEMANTIC_OBJECT'
                            iv_element             = VALUE tys_types_for_prim_types-semantic_object( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SEMANTIC_OBJECT_2'
                            iv_element             = VALUE tys_types_for_prim_types-semantic_object_2( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SEMANTIC_OBJECT_3'
                            iv_element             = VALUE tys_types_for_prim_types-semantic_object_3( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SEMANTIC_OBJECT_4'
                            iv_element             = VALUE tys_types_for_prim_types-semantic_object_4( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SOURCE_BUSINESS_OBJECT_TYP'
                            iv_element             = VALUE tys_types_for_prim_types-source_business_object_typ( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SOURCE_LINKED_SAPOBJECT_KE'
                            iv_element             = VALUE tys_types_for_prim_types-source_linked_sapobject_ke( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SOURCE_SAPOBJECT_NODE_TYPE'
                            iv_element             = VALUE tys_types_for_prim_types-source_sapobject_node_type( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SOURCE_SAPOBJECT_TYPE'
                            iv_element             = VALUE tys_types_for_prim_types-source_sapobject_type( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'STORAGE_CATEGORY'
                            iv_element             = VALUE tys_types_for_prim_types-storage_category( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'TARGET_BUSINESS_OBJECT_TYP'
                            iv_element             = VALUE tys_types_for_prim_types-target_business_object_typ( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'TARGET_LINKED_SAPOBJECT_KE'
                            iv_element             = VALUE tys_types_for_prim_types-target_linked_sapobject_ke( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'TARGET_SAPOBJECT_NODE_TYPE'
                            iv_element             = VALUE tys_types_for_prim_types-target_sapobject_node_type( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'TARGET_SAPOBJECT_TYPE'
                            iv_element             = VALUE tys_types_for_prim_types-target_sapobject_type( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'URL'
                            iv_element             = VALUE tys_types_for_prim_types-url( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'URL_DESCRIPTION'
                            iv_element             = VALUE tys_types_for_prim_types-url_description( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

  ENDMETHOD.


  METHOD def_assign_document.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'ASSIGN_DOCUMENT'
                                    is_structure              = VALUE tys_assign_document( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'AssignDocument' ) ##NO_TEXT.


    lo_primitive_property = lo_complex_type->get_primitive_property( 'IS_ASSIGNED' ).
    lo_primitive_property->set_edm_name( 'IsAssigned' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_assign_document_to_busines.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'ASSIGN_DOCUMENT_TO_BUSINES' ).
    lo_function->set_edm_name( 'AssignDocumentToBusinessObject' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_1( ) ).

    lo_function_import = lo_function->create_function_import( 'ASSIGN_DOCUMENT_TO_BUSINES' ).
    lo_function_import->set_edm_name( 'AssignDocumentToBusinessObject' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'POST' ).


    lo_parameter = lo_function->create_parameter( 'SOURCE_LINKED_SAPOBJECT_KE' ).
    lo_parameter->set_edm_name( 'SourceLinkedSAPObjectKey' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SOURCE_LINKED_SAPOBJECT_KE' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SOURCE_BUSINESS_OBJECT_TYP' ).
    lo_parameter->set_edm_name( 'SourceBusinessObjectTypeName' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SOURCE_BUSINESS_OBJECT_TYP' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SOURCE_SAPOBJECT_NODE_TYPE' ).
    lo_parameter->set_edm_name( 'SourceSAPObjectNodeType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SOURCE_SAPOBJECT_NODE_TYPE' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SOURCE_SAPOBJECT_TYPE' ).
    lo_parameter->set_edm_name( 'SourceSAPObjectType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SOURCE_SAPOBJECT_TYPE' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'ARCHIVE_DOCUMENT_ID' ).
    lo_parameter->set_edm_name( 'ArchiveDocumentID' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'ARCHIVE_DOCUMENT_ID_4' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'TARGET_LINKED_SAPOBJECT_KE' ).
    lo_parameter->set_edm_name( 'TargetLinkedSAPObjectKey' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'TARGET_LINKED_SAPOBJECT_KE' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'TARGET_BUSINESS_OBJECT_TYP' ).
    lo_parameter->set_edm_name( 'TargetBusinessObjectTypeName' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'TARGET_BUSINESS_OBJECT_TYP' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'TARGET_SAPOBJECT_NODE_TYPE' ).
    lo_parameter->set_edm_name( 'TargetSAPObjectNodeType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'TARGET_SAPOBJECT_NODE_TYPE' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'TARGET_SAPOBJECT_TYPE' ).
    lo_parameter->set_edm_name( 'TargetSAPObjectType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'TARGET_SAPOBJECT_TYPE' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_complex_type( 'ASSIGN_DOCUMENT' ).

  ENDMETHOD.


  METHOD def_attachments_count.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'ATTACHMENTS_COUNT'
                                    is_structure              = VALUE tys_attachments_count( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'AttachmentsCount' ) ##NO_TEXT.


    lo_primitive_property = lo_complex_type->get_primitive_property( 'ATTACHMENT_COUNT' ).
    lo_primitive_property->set_edm_name( 'AttachmentCount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int16' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_attachment_content.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'ATTACHMENT_CONTENT'
                                    is_structure              = VALUE tys_attachment_content( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'AttachmentContent' ) ##NO_TEXT.
    lo_entity_type->/iwbep/if_v4_pm_entity_type_v2~set_has_stream( ).


    lo_entity_set = lo_entity_type->create_entity_set( 'ATTACHMENT_CONTENT_SET' ).
    lo_entity_set->set_edm_name( 'AttachmentContentSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_INFO_RECORD_DOC_T' ).
    lo_primitive_property->set_edm_name( 'DocumentInfoRecordDocType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_INFO_RECORD_DOC_N' ).
    lo_primitive_property->set_edm_name( 'DocumentInfoRecordDocNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_INFO_RECORD_DOC_V' ).
    lo_primitive_property->set_edm_name( 'DocumentInfoRecordDocVersion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_INFO_RECORD_DOC_P' ).
    lo_primitive_property->set_edm_name( 'DocumentInfoRecordDocPart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOGICAL_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'LogicalDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARCHIVE_DOCUMENT_ID' ).
    lo_primitive_property->set_edm_name( 'ArchiveDocumentID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LINKED_SAPOBJECT_KEY' ).
    lo_primitive_property->set_edm_name( 'LinkedSAPObjectKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 90 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_OBJECT_TYPE_NAME' ).
    lo_primitive_property->set_edm_name( 'BusinessObjectTypeName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SEMANTIC_OBJECT' ).
    lo_primitive_property->set_edm_name( 'SemanticObject' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WORKSTATION_APPLICATION' ).
    lo_primitive_property->set_edm_name( 'WorkstationApplication' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FILE_SIZE' ).
    lo_primitive_property->set_edm_name( 'FileSize' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FILE_NAME' ).
    lo_primitive_property->set_edm_name( 'FileName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_URL' ).
    lo_primitive_property->set_edm_name( 'DocumentURL' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4096 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MIME_TYPE' ).
    lo_primitive_property->set_edm_name( 'MimeType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 128 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTENT' ).
    lo_primitive_property->set_edm_name( 'Content' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Binary' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY_USER' ).
    lo_primitive_property->set_edm_name( 'CreatedByUser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY_USER_FULL_NAME' ).
    lo_primitive_property->set_edm_name( 'CreatedByUserFullName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATION_DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'CreationDateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_OBJECT_TYPE' ).
    lo_primitive_property->set_edm_name( 'BusinessObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAST_CHANGED_BY_USER' ).
    lo_primitive_property->set_edm_name( 'LastChangedByUser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAST_CHANGED_BY_USER_FULL' ).
    lo_primitive_property->set_edm_name( 'LastChangedByUserFullName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHANGED_DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'ChangedDateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STORAGE_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'StorageCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARCHIVE_LINK_REPOSITORY' ).
    lo_primitive_property->set_edm_name( 'ArchiveLinkRepository' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAPOBJECT_TYPE' ).
    lo_primitive_property->set_edm_name( 'SAPObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAPOBJECT_NODE_TYPE' ).
    lo_primitive_property->set_edm_name( 'SAPObjectNodeType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HARMONIZED_DOCUMENT_TYPE' ).
    lo_primitive_property->set_edm_name( 'HarmonizedDocumentType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ATTACHMENT_DELETION_IS_ALL' ).
    lo_primitive_property->set_edm_name( 'AttachmentDeletionIsAllowed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ATTACHMENT_RENAME_IS_ALLOW' ).
    lo_primitive_property->set_edm_name( 'AttachmentRenameIsAllowed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SOURCE' ).
    lo_primitive_property->set_edm_name( 'Source' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ATTACHMENT_CONTENT_HASH' ).
    lo_primitive_property->set_edm_name( 'AttachmentContentHash' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

  ENDMETHOD.


  METHOD def_attachment_for_sapobject_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'ATTACHMENT_FOR_SAPOBJECT_2'
                                    is_structure              = VALUE tys_attachment_for_sapobject_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'AttachmentForSAPObjectNodeType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'ATTACHMENT_FOR_SAPOBJECT_N' ).
    lo_entity_set->set_edm_name( 'AttachmentForSAPObjectNodeTypeSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_INFO_RECORD_DOC_T' ).
    lo_primitive_property->set_edm_name( 'DocumentInfoRecordDocType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_INFO_RECORD_DOC_N' ).
    lo_primitive_property->set_edm_name( 'DocumentInfoRecordDocNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_INFO_RECORD_DOC_V' ).
    lo_primitive_property->set_edm_name( 'DocumentInfoRecordDocVersion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_INFO_RECORD_DOC_P' ).
    lo_primitive_property->set_edm_name( 'DocumentInfoRecordDocPart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOGICAL_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'LogicalDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARCHIVE_DOCUMENT_ID' ).
    lo_primitive_property->set_edm_name( 'ArchiveDocumentID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LINKED_SAPOBJECT_KEY' ).
    lo_primitive_property->set_edm_name( 'LinkedSAPObjectKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 90 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_OBJECT_TYPE_NAME' ).
    lo_primitive_property->set_edm_name( 'BusinessObjectTypeName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FILE_SIZE' ).
    lo_primitive_property->set_edm_name( 'FileSize' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FILE_NAME' ).
    lo_primitive_property->set_edm_name( 'FileName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MIME_TYPE' ).
    lo_primitive_property->set_edm_name( 'MimeType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 128 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHECKOUT_USER' ).
    lo_primitive_property->set_edm_name( 'CheckoutUser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHECKOUT_USER_FULL_NAME' ).
    lo_primitive_property->set_edm_name( 'CheckoutUserFullName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY_USER' ).
    lo_primitive_property->set_edm_name( 'CreatedByUser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY_USER_FULL_NAME' ).
    lo_primitive_property->set_edm_name( 'CreatedByUserFullName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATION_DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'CreationDateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAST_CHANGED_BY_USER' ).
    lo_primitive_property->set_edm_name( 'LastChangedByUser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAST_CHANGED_BY_USER_FULL' ).
    lo_primitive_property->set_edm_name( 'LastChangedByUserFullName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHANGED_DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'ChangedDateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STORAGE_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'StorageCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARCHIVE_LINK_REPOSITORY' ).
    lo_primitive_property->set_edm_name( 'ArchiveLinkRepository' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAPOBJECT_TYPE' ).
    lo_primitive_property->set_edm_name( 'SAPObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAPOBJECT_NODE_TYPE' ).
    lo_primitive_property->set_edm_name( 'SAPObjectNodeType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HARMONIZED_DOCUMENT_TYPE' ).
    lo_primitive_property->set_edm_name( 'HarmonizedDocumentType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ATTACHMENT_DELETION_IS_ALL' ).
    lo_primitive_property->set_edm_name( 'AttachmentDeletionIsAllowed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ATTACHMENT_RENAME_IS_ALLOW' ).
    lo_primitive_property->set_edm_name( 'AttachmentRenameIsAllowed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'URLTO_UPLOAD_ATTACHMENT' ).
    lo_primitive_property->set_edm_name( 'URLToUploadAttachment' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4096 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'URLTO_READ_ATTACHMENT' ).
    lo_primitive_property->set_edm_name( 'URLToReadAttachment' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4096 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ONE_TIME_VALID_TOKEN_FOR_A' ).
    lo_primitive_property->set_edm_name( 'OneTimeValidTokenForAttachment' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 128 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

  ENDMETHOD.


  METHOD def_attachment_harmonized_op_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'ATTACHMENT_HARMONIZED_OP_2'
                                    is_structure              = VALUE tys_attachment_harmonized_op_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'AttachmentHarmonizedOperation' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'ATTACHMENT_HARMONIZED_OPER' ).
    lo_entity_set->set_edm_name( 'AttachmentHarmonizedOperationSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_INFO_RECORD_DOC_T' ).
    lo_primitive_property->set_edm_name( 'DocumentInfoRecordDocType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_INFO_RECORD_DOC_N' ).
    lo_primitive_property->set_edm_name( 'DocumentInfoRecordDocNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_INFO_RECORD_DOC_V' ).
    lo_primitive_property->set_edm_name( 'DocumentInfoRecordDocVersion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_INFO_RECORD_DOC_P' ).
    lo_primitive_property->set_edm_name( 'DocumentInfoRecordDocPart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOGICAL_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'LogicalDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARCHIVE_DOCUMENT_ID' ).
    lo_primitive_property->set_edm_name( 'ArchiveDocumentID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LINKED_SAPOBJECT_KEY' ).
    lo_primitive_property->set_edm_name( 'LinkedSAPObjectKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 90 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_OBJECT_TYPE_NAME' ).
    lo_primitive_property->set_edm_name( 'BusinessObjectTypeName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FILE_SIZE' ).
    lo_primitive_property->set_edm_name( 'FileSize' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FILE_NAME' ).
    lo_primitive_property->set_edm_name( 'FileName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MIME_TYPE' ).
    lo_primitive_property->set_edm_name( 'MimeType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 128 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHECKOUT_USER' ).
    lo_primitive_property->set_edm_name( 'CheckoutUser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHECKOUT_USER_FULL_NAME' ).
    lo_primitive_property->set_edm_name( 'CheckoutUserFullName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY_USER' ).
    lo_primitive_property->set_edm_name( 'CreatedByUser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY_USER_FULL_NAME' ).
    lo_primitive_property->set_edm_name( 'CreatedByUserFullName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATION_DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'CreationDateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAST_CHANGED_BY_USER' ).
    lo_primitive_property->set_edm_name( 'LastChangedByUser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAST_CHANGED_BY_USER_FULL' ).
    lo_primitive_property->set_edm_name( 'LastChangedByUserFullName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHANGED_DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'ChangedDateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STORAGE_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'StorageCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARCHIVE_LINK_REPOSITORY' ).
    lo_primitive_property->set_edm_name( 'ArchiveLinkRepository' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAPOBJECT_TYPE' ).
    lo_primitive_property->set_edm_name( 'SAPObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAPOBJECT_NODE_TYPE' ).
    lo_primitive_property->set_edm_name( 'SAPObjectNodeType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HARMONIZED_DOCUMENT_TYPE' ).
    lo_primitive_property->set_edm_name( 'HarmonizedDocumentType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ATTACHMENT_DELETION_IS_ALL' ).
    lo_primitive_property->set_edm_name( 'AttachmentDeletionIsAllowed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ATTACHMENT_RENAME_IS_ALLOW' ).
    lo_primitive_property->set_edm_name( 'AttachmentRenameIsAllowed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'URLTO_UPLOAD_ATTACHMENT' ).
    lo_primitive_property->set_edm_name( 'URLToUploadAttachment' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4096 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'URLTO_READ_ATTACHMENT' ).
    lo_primitive_property->set_edm_name( 'URLToReadAttachment' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4096 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ONE_TIME_VALID_TOKEN_FOR_A' ).
    lo_primitive_property->set_edm_name( 'OneTimeValidTokenForAttachment' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 128 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

  ENDMETHOD.


  METHOD def_authorization_check.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'AUTHORIZATION_CHECK' ).
    lo_function->set_edm_name( 'AuthorizationCheck' ) ##NO_TEXT.

    lo_function_import = lo_function->create_function_import( 'AUTHORIZATION_CHECK' ).
    lo_function_import->set_edm_name( 'AuthorizationCheck' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'GET' ).


    lo_return = lo_function->create_return( ).
    lo_return->set_entity_type( 'ATTACHMENT_CONTENT' ).

  ENDMETHOD.


  METHOD def_a_document_info_record_a_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_DOCUMENT_INFO_RECORD_A_2'
                                    is_structure              = VALUE tys_a_document_info_record_a_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_DocumentInfoRecordAttchType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_DOCUMENT_INFO_RECORD_ATT' ).
    lo_entity_set->set_edm_name( 'A_DocumentInfoRecordAttch' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_INFO_RECORD_DOC_T' ).
    lo_primitive_property->set_edm_name( 'DocumentInfoRecordDocType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_INFO_RECORD_DOC_N' ).
    lo_primitive_property->set_edm_name( 'DocumentInfoRecordDocNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_INFO_RECORD_DOC_V' ).
    lo_primitive_property->set_edm_name( 'DocumentInfoRecordDocVersion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_INFO_RECORD_DOC_P' ).
    lo_primitive_property->set_edm_name( 'DocumentInfoRecordDocPart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_INFO_RECORD' ).
    lo_primitive_property->set_edm_name( 'DocumentInfoRecord' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_DESCRIPTION' ).
    lo_primitive_property->set_edm_name( 'DocumentDescription' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTERNAL_DOCUMENT_STATUS' ).
    lo_primitive_property->set_edm_name( 'ExternalDocumentStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_STATUS_NAME' ).
    lo_primitive_property->set_edm_name( 'DocumentStatusName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOC_INFO_RECD_IS_MARKED_FO' ).
    lo_primitive_property->set_edm_name( 'DocInfoRecdIsMarkedForDeletion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'DOCUMENT_INFO_RECORD_TO_AT' ).
    lo_navigation_property->set_edm_name( 'DocumentInfoRecordToAttachmentNavigation' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'ATTACHMENT_CONTENT' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_create_url_as_attachment.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'CREATE_URL_AS_ATTACHMENT' ).
    lo_function->set_edm_name( 'CreateUrlAsAttachment' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_2( ) ).

    lo_function_import = lo_function->create_function_import( 'CREATE_URL_AS_ATTACHMENT' ).
    lo_function_import->set_edm_name( 'CreateUrlAsAttachment' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'POST' ).


    lo_parameter = lo_function->create_parameter( 'HARMONIZED_DOCUMENT_TYPE' ).
    lo_parameter->set_edm_name( 'HarmonizedDocumentType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'HARMONIZED_DOCUMENT_TYPE_4' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SAPOBJECT_TYPE' ).
    lo_parameter->set_edm_name( 'SAPObjectType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SAPOBJECT_TYPE_8' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SAPOBJECT_NODE_TYPE' ).
    lo_parameter->set_edm_name( 'SAPObjectNodeType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SAPOBJECT_NODE_TYPE_8' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SEMANTIC_OBJECT' ).
    lo_parameter->set_edm_name( 'SemanticObject' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SEMANTIC_OBJECT_4' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'LINKED_SAPOBJECT_KEY' ).
    lo_parameter->set_edm_name( 'LinkedSAPObjectKey' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'LINKED_SAPOBJECT_KEY_7' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'BUSINESS_OBJECT_TYPE_NAME' ).
    lo_parameter->set_edm_name( 'BusinessObjectTypeName' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'BUSINESS_OBJECT_TYPE_NAM_5' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'URL' ).
    lo_parameter->set_edm_name( 'Url' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'URL' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'URL_DESCRIPTION' ).
    lo_parameter->set_edm_name( 'UrlDescription' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'URL_DESCRIPTION' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'MIMETYPE' ).
    lo_parameter->set_edm_name( 'MIMEType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'MIMETYPE' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_entity_type( 'ATTACHMENT_CONTENT' ).

  ENDMETHOD.


  METHOD def_get_all_originals.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'GET_ALL_ORIGINALS' ).
    lo_function->set_edm_name( 'GetAllOriginals' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_3( ) ).

    lo_function_import = lo_function->create_function_import( 'GET_ALL_ORIGINALS' ).
    lo_function_import->set_edm_name( 'GetAllOriginals' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'GET' ).


    lo_parameter = lo_function->create_parameter( 'SAPOBJECT_NODE_TYPE' ).
    lo_parameter->set_edm_name( 'SAPObjectNodeType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SAPOBJECT_NODE_TYPE_2' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SAPOBJECT_TYPE' ).
    lo_parameter->set_edm_name( 'SAPObjectType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SAPOBJECT_TYPE_2' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SEMANTIC_OBJECT' ).
    lo_parameter->set_edm_name( 'SemanticObject' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SEMANTIC_OBJECT' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'BUSINESS_OBJECT_TYPE_NAME' ).
    lo_parameter->set_edm_name( 'BusinessObjectTypeName' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'BUSINESS_OBJECT_TYPE_NAME' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'LINKED_SAPOBJECT_KEY' ).
    lo_parameter->set_edm_name( 'LinkedSAPObjectKey' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'LINKED_SAPOBJECT_KEY_2' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_entity_type( 'ATTACHMENT_CONTENT' ).
    lo_return->set_is_collection( ).

  ENDMETHOD.


  METHOD def_get_attachment_count.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'GET_ATTACHMENT_COUNT' ).
    lo_function->set_edm_name( 'GetAttachmentCount' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_4( ) ).

    lo_function_import = lo_function->create_function_import( 'GET_ATTACHMENT_COUNT' ).
    lo_function_import->set_edm_name( 'GetAttachmentCount' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'GET' ).


    lo_parameter = lo_function->create_parameter( 'SAPOBJECT_NODE_TYPE' ).
    lo_parameter->set_edm_name( 'SAPObjectNodeType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SAPOBJECT_NODE_TYPE_3' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SAPOBJECT_TYPE' ).
    lo_parameter->set_edm_name( 'SAPObjectType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SAPOBJECT_TYPE_3' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SEMANTIC_OBJECT' ).
    lo_parameter->set_edm_name( 'SemanticObject' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SEMANTIC_OBJECT_2' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'LINKED_SAPOBJECT_KEY' ).
    lo_parameter->set_edm_name( 'LinkedSAPObjectKey' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'LINKED_SAPOBJECT_KEY_3' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'BUSINESS_OBJECT_TYPE_NAME' ).
    lo_parameter->set_edm_name( 'BusinessObjectTypeName' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'BUSINESS_OBJECT_TYPE_NAM_2' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_complex_type( 'ATTACHMENTS_COUNT' ).

  ENDMETHOD.


  METHOD def_get_sapobject_document_typ.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'GET_SAPOBJECT_DOCUMENT_TYP' ).
    lo_function->set_edm_name( 'GetSAPObjectDocumentType' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_5( ) ).

    lo_function_import = lo_function->create_function_import( 'GET_SAPOBJECT_DOCUMENT_TYP' ).
    lo_function_import->set_edm_name( 'GetSAPObjectDocumentType' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'GET' ).


    lo_parameter = lo_function->create_parameter( 'SAPOBJECT_NODE_TYPE' ).
    lo_parameter->set_edm_name( 'SAPObjectNodeType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SAPOBJECT_NODE_TYPE_5' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SAPOBJECT_TYPE' ).
    lo_parameter->set_edm_name( 'SAPObjectType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SAPOBJECT_TYPE_5' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_entity_type( 'SAPOBJECT_DOCUMENT_TYPE' ).
    lo_return->set_is_collection( ).

  ENDMETHOD.


  METHOD def_link_attachment_to_sapobje.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'LINK_ATTACHMENT_TO_SAPOBJE' ).
    lo_function->set_edm_name( 'LinkAttachmentToSAPObjectNode' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_6( ) ).

    lo_function_import = lo_function->create_function_import( 'LINK_ATTACHMENT_TO_SAPOBJE' ).
    lo_function_import->set_edm_name( 'LinkAttachmentToSAPObjectNode' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'POST' ).


    lo_parameter = lo_function->create_parameter( 'SAPOBJECT_TYPE' ).
    lo_parameter->set_edm_name( 'SAPObjectType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SAPOBJECT_TYPE' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SAPOBJECT_NODE_TYPE' ).
    lo_parameter->set_edm_name( 'SAPObjectNodeType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SAPOBJECT_NODE_TYPE' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'LOGICAL_DOCUMENT' ).
    lo_parameter->set_edm_name( 'LogicalDocument' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'LOGICAL_DOCUMENT' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'ARCHIVE_DOCUMENT_ID' ).
    lo_parameter->set_edm_name( 'ArchiveDocumentID' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'ARCHIVE_DOCUMENT_ID' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'HARMONIZED_DOCUMENT_TYPE' ).
    lo_parameter->set_edm_name( 'HarmonizedDocumentType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'HARMONIZED_DOCUMENT_TYPE' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'LINKED_SAPOBJECT_KEY' ).
    lo_parameter->set_edm_name( 'LinkedSAPObjectKey' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'LINKED_SAPOBJECT_KEY' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_entity_type( 'ATTACHMENT_FOR_SAPOBJECT_2' ).

  ENDMETHOD.


  METHOD def_link_attachment_to_sapob_2.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'LINK_ATTACHMENT_TO_SAPOB_2' ).
    lo_function->set_edm_name( 'LinkAttachmentToSAPObject' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_7( ) ).

    lo_function_import = lo_function->create_function_import( 'LINK_ATTACHMENT_TO_SAPOB_2' ).
    lo_function_import->set_edm_name( 'LinkAttachmentToSAPObject' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'POST' ).


    lo_parameter = lo_function->create_parameter( 'LINKED_SAPOBJECT_KEY' ).
    lo_parameter->set_edm_name( 'LinkedSAPObjectKey' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'LINKED_SAPOBJECT_KEY_5' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'HARMONIZED_DOCUMENT_TYPE' ).
    lo_parameter->set_edm_name( 'HarmonizedDocumentType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'HARMONIZED_DOCUMENT_TYPE_2' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'ARCHIVE_DOCUMENT_ID' ).
    lo_parameter->set_edm_name( 'ArchiveDocumentID' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'ARCHIVE_DOCUMENT_ID_3' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'LOGICAL_DOCUMENT' ).
    lo_parameter->set_edm_name( 'LogicalDocument' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'LOGICAL_DOCUMENT_3' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SAPOBJECT_NODE_TYPE' ).
    lo_parameter->set_edm_name( 'SAPObjectNodeType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SAPOBJECT_NODE_TYPE_6' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SAPOBJECT_TYPE' ).
    lo_parameter->set_edm_name( 'SAPObjectType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SAPOBJECT_TYPE_6' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_entity_type( 'ATTACHMENT_HARMONIZED_OP_2' ).

  ENDMETHOD.


  METHOD def_link_file_to_bo.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'LINK_FILE_TO_BO' ).
    lo_function->set_edm_name( 'LinkFileToBO' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_8( ) ).

    lo_function_import = lo_function->create_function_import( 'LINK_FILE_TO_BO' ).
    lo_function_import->set_edm_name( 'LinkFileToBO' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'POST' ).


    lo_parameter = lo_function->create_parameter( 'STORAGE_CATEGORY' ).
    lo_parameter->set_edm_name( 'StorageCategory' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'STORAGE_CATEGORY' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'EXTERNAL_DOCUMENT_ID' ).
    lo_parameter->set_edm_name( 'ExternalDocumentID' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'EXTERNAL_DOCUMENT_ID' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'BUSINESS_OBJECT_TYPE_NAME' ).
    lo_parameter->set_edm_name( 'BusinessObjectTypeName' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'BUSINESS_OBJECT_TYPE_NAM_4' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'LINKED_SAPOBJECT_KEY' ).
    lo_parameter->set_edm_name( 'LinkedSAPObjectKey' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'LINKED_SAPOBJECT_KEY_6' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SAPOBJECT_TYPE' ).
    lo_parameter->set_edm_name( 'SAPObjectType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SAPOBJECT_TYPE_7' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SAPOBJECT_NODE_TYPE' ).
    lo_parameter->set_edm_name( 'SAPObjectNodeType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SAPOBJECT_NODE_TYPE_7' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'HARMONIZED_DOCUMENT_TYPE' ).
    lo_parameter->set_edm_name( 'HarmonizedDocumentType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'HARMONIZED_DOCUMENT_TYPE_3' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_entity_type( 'ATTACHMENT_CONTENT' ).

  ENDMETHOD.


  METHOD def_rename_attachment.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'RENAME_ATTACHMENT' ).
    lo_function->set_edm_name( 'RenameAttachment' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_9( ) ).

    lo_function_import = lo_function->create_function_import( 'RENAME_ATTACHMENT' ).
    lo_function_import->set_edm_name( 'RenameAttachment' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'POST' ).


    lo_parameter = lo_function->create_parameter( 'SAPOBJECT_NODE_TYPE' ).
    lo_parameter->set_edm_name( 'SAPObjectNodeType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SAPOBJECT_NODE_TYPE_4' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SAPOBJECT_TYPE' ).
    lo_parameter->set_edm_name( 'SAPObjectType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SAPOBJECT_TYPE_4' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'DOCUMENT_INFO_RECORD_DOC_P' ).
    lo_parameter->set_edm_name( 'DocumentInfoRecordDocPart' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'DOCUMENT_INFO_RECORD_DOC_P' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'DOCUMENT_INFO_RECORD_DOC_N' ).
    lo_parameter->set_edm_name( 'DocumentInfoRecordDocNumber' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'DOCUMENT_INFO_RECORD_DOC_N' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'FILE_NAME' ).
    lo_parameter->set_edm_name( 'FileName' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'FILE_NAME' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SEMANTIC_OBJECT' ).
    lo_parameter->set_edm_name( 'SemanticObject' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SEMANTIC_OBJECT_3' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'LINKED_SAPOBJECT_KEY' ).
    lo_parameter->set_edm_name( 'LinkedSAPObjectKey' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'LINKED_SAPOBJECT_KEY_4' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'BUSINESS_OBJECT_TYPE_NAME' ).
    lo_parameter->set_edm_name( 'BusinessObjectTypeName' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'BUSINESS_OBJECT_TYPE_NAM_3' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'ARCHIVE_DOCUMENT_ID' ).
    lo_parameter->set_edm_name( 'ArchiveDocumentID' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'ARCHIVE_DOCUMENT_ID_2' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'LOGICAL_DOCUMENT' ).
    lo_parameter->set_edm_name( 'LogicalDocument' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'LOGICAL_DOCUMENT_2' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'DOCUMENT_INFO_RECORD_DOC_V' ).
    lo_parameter->set_edm_name( 'DocumentInfoRecordDocVersion' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'DOCUMENT_INFO_RECORD_DOC_V' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'DOCUMENT_INFO_RECORD_DOC_T' ).
    lo_parameter->set_edm_name( 'DocumentInfoRecordDocType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'DOCUMENT_INFO_RECORD_DOC_T' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_entity_type( 'ATTACHMENT_CONTENT' ).

  ENDMETHOD.


  METHOD def_sapobject_document_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAPOBJECT_DOCUMENT_TYPE'
                                    is_structure              = VALUE tys_sapobject_document_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAPObjectDocumentType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAPOBJECT_DOCUMENT_TYPE_SE' ).
    lo_entity_set->set_edm_name( 'SAPObjectDocumentTypeSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAPOBJECT_TYPE' ).
    lo_primitive_property->set_edm_name( 'SAPObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAPOBJECT_NODE_TYPE' ).
    lo_primitive_property->set_edm_name( 'SAPObjectNodeType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HARMONIZED_DOCUMENT_TYPE' ).
    lo_primitive_property->set_edm_name( 'HarmonizedDocumentType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_TYPE_DESCRIPTION' ).
    lo_primitive_property->set_edm_name( 'DocumentTypeDescription' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERMITTED_ARCHIVE_LINK_MIM' ).
    lo_primitive_property->set_edm_name( 'PermittedArchiveLinkMimeType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 128 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ATTACHMENT_FRAMEWORK' ).
    lo_primitive_property->set_edm_name( 'AttachmentFramework' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_TYPE_IS_DEFAULT' ).
    lo_primitive_property->set_edm_name( 'DocumentTypeIsDefault' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

  ENDMETHOD.
ENDCLASS.
