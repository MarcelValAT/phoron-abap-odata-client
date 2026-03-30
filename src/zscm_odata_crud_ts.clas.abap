"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>API_MANAGE_WORKFORCE_TIMESHEET</em>
CLASS zscm_odata_crud_ts DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">TimeSheetDataFields</p>
      BEGIN OF tys_time_sheet_data_fields,
        "! ControllingArea
        controlling_area           TYPE c LENGTH 4,
        "! SenderCostCenter
        sender_cost_center         TYPE c LENGTH 10,
        "! ReceiverCostCenter
        receiver_cost_center       TYPE c LENGTH 10,
        "! InternalOrder
        internal_order             TYPE c LENGTH 12,
        "! ActivityType
        activity_type              TYPE c LENGTH 6,
        "! WBSElement
        wbselement                 TYPE c LENGTH 24,
        "! WorkItem
        work_item                  TYPE c LENGTH 10,
        "! BillingControlCategory
        billing_control_category   TYPE c LENGTH 8,
        "! PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! PurchaseOrderItem
        purchase_order_item        TYPE c LENGTH 5,
        "! TimeSheetTaskType
        time_sheet_task_type       TYPE c LENGTH 4,
        "! TimeSheetTaskLevel
        time_sheet_task_level      TYPE c LENGTH 8,
        "! TimeSheetTaskComponent
        time_sheet_task_component  TYPE c LENGTH 8,
        "! TimeSheetNote
        time_sheet_note            TYPE string,
        "! RecordedHours
        recorded_hours             TYPE p LENGTH 3 DECIMALS 2,
        "! RecordedQuantity
        recorded_quantity          TYPE p LENGTH 8 DECIMALS 3,
        "! HoursUnitOfMeasure
        hours_unit_of_measure      TYPE c LENGTH 3,
        "! RejectionReason
        rejection_reason           TYPE c LENGTH 4,
        "! TimeSheetWrkLocCode
        time_sheet_wrk_loc_code    TYPE c LENGTH 4,
        "! TimeSheetOvertimeCategory
        time_sheet_overtime_catego TYPE c LENGTH 4,
        "! SenderPubSecFund
        sender_pub_sec_fund        TYPE c LENGTH 10,
        "! SendingPubSecFunctionalArea
        sending_pub_sec_functional TYPE c LENGTH 16,
        "! SenderPubSecGrant
        sender_pub_sec_grant       TYPE c LENGTH 20,
        "! SenderPubSecBudgetPeriod
        sender_pub_sec_budget_peri TYPE c LENGTH 10,
        "! ReceiverPubSecFund
        receiver_pub_sec_fund      TYPE c LENGTH 10,
        "! ReceiverPubSecFuncnlArea
        receiver_pub_sec_funcnl_ar TYPE c LENGTH 16,
        "! ReceiverPubSecGrant
        receiver_pub_sec_grant     TYPE c LENGTH 20,
        "! ReceiverPubSecBudgetPeriod
        receiver_pub_sec_budget_pe TYPE c LENGTH 10,
      END OF tys_time_sheet_data_fields,
      "! <p class="shorttext synchronized">List of TimeSheetDataFields</p>
      tyt_time_sheet_data_fields TYPE STANDARD TABLE OF tys_time_sheet_data_fields WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">TimeSheetEntry</p>
      BEGIN OF tys_time_sheet_entry,
        "! TimeSheetDataFields
        time_sheet_data_fields     TYPE tys_time_sheet_data_fields,
        "! <em>Key property</em> PersonWorkAgreementExternalID
        person_work_agreement_exte TYPE c LENGTH 20,
        "! <em>Key property</em> CompanyCode
        company_code               TYPE c LENGTH 4,
        "! <em>Key property</em> TimeSheetRecord
        time_sheet_record          TYPE c LENGTH 12,
        "! PersonWorkAgreement
        person_work_agreement      TYPE c LENGTH 8,
        "! TimeSheetDate
        time_sheet_date            TYPE timestamp,
        "! TimeSheetIsReleasedOnSave
        time_sheet_is_released_on  TYPE abap_bool,
        "! TimeSheetPredecessorRecord
        time_sheet_predecessor_rec TYPE c LENGTH 12,
        "! TimeSheetStatus
        time_sheet_status          TYPE c LENGTH 2,
        "! TimeSheetIsExecutedInTestRun
        time_sheet_is_executed_in  TYPE abap_bool,
        "! TimeSheetOperation
        time_sheet_operation       TYPE c LENGTH 1,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_time_sheet_entry,
      "! <p class="shorttext synchronized">List of TimeSheetEntry</p>
      tyt_time_sheet_entry TYPE STANDARD TABLE OF tys_time_sheet_entry WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! TimeSheetEntryCollection
        "! <br/> Collection of type 'TimeSheetEntry'
        time_sheet_entry_collectio TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'TIME_SHEET_ENTRY_COLLECTIO',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for complex types</p>
      BEGIN OF gcs_complex_type,
        "! <p class="shorttext synchronized">Internal names for TimeSheetDataFields</p>
        "! See also structure type {@link ..tys_time_sheet_data_fields}
        BEGIN OF time_sheet_data_fields,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF time_sheet_data_fields,
      END OF gcs_complex_type.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for TimeSheetEntry</p>
        "! See also structure type {@link ..tys_time_sheet_entry}
        BEGIN OF time_sheet_entry,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF time_sheet_entry,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define TimeSheetDataFields</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_time_sheet_data_fields RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define TimeSheetEntry</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_time_sheet_entry RAISING /iwbep/cx_gateway.

ENDCLASS.


CLASS zscm_odata_crud_ts IMPLEMENTATION.

  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'API_MANAGE_WORKFORCE_TIMESHEET' ) ##NO_TEXT.

    def_time_sheet_data_fields( ).
    def_time_sheet_entry( ).

  ENDMETHOD.


  METHOD def_time_sheet_data_fields.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'TIME_SHEET_DATA_FIELDS'
                                    is_structure              = VALUE tys_time_sheet_data_fields( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'TimeSheetDataFields' ) ##NO_TEXT.


    lo_primitive_property = lo_complex_type->get_primitive_property( 'CONTROLLING_AREA' ).
    lo_primitive_property->set_edm_name( 'ControllingArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'SENDER_COST_CENTER' ).
    lo_primitive_property->set_edm_name( 'SenderCostCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'RECEIVER_COST_CENTER' ).
    lo_primitive_property->set_edm_name( 'ReceiverCostCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'INTERNAL_ORDER' ).
    lo_primitive_property->set_edm_name( 'InternalOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'ACTIVITY_TYPE' ).
    lo_primitive_property->set_edm_name( 'ActivityType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'WBSELEMENT' ).
    lo_primitive_property->set_edm_name( 'WBSElement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'WORK_ITEM' ).
    lo_primitive_property->set_edm_name( 'WorkItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'BILLING_CONTROL_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'BillingControlCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'PURCHASE_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'TIME_SHEET_TASK_TYPE' ).
    lo_primitive_property->set_edm_name( 'TimeSheetTaskType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'TIME_SHEET_TASK_LEVEL' ).
    lo_primitive_property->set_edm_name( 'TimeSheetTaskLevel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'TIME_SHEET_TASK_COMPONENT' ).
    lo_primitive_property->set_edm_name( 'TimeSheetTaskComponent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'TIME_SHEET_NOTE' ).
    lo_primitive_property->set_edm_name( 'TimeSheetNote' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'RECORDED_HOURS' ).
    lo_primitive_property->set_edm_name( 'RecordedHours' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'RECORDED_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'RecordedQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'HOURS_UNIT_OF_MEASURE' ).
    lo_primitive_property->set_edm_name( 'HoursUnitOfMeasure' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'REJECTION_REASON' ).
    lo_primitive_property->set_edm_name( 'RejectionReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'TIME_SHEET_WRK_LOC_CODE' ).
    lo_primitive_property->set_edm_name( 'TimeSheetWrkLocCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'TIME_SHEET_OVERTIME_CATEGO' ).
    lo_primitive_property->set_edm_name( 'TimeSheetOvertimeCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'SENDER_PUB_SEC_FUND' ).
    lo_primitive_property->set_edm_name( 'SenderPubSecFund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'SENDING_PUB_SEC_FUNCTIONAL' ).
    lo_primitive_property->set_edm_name( 'SendingPubSecFunctionalArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'SENDER_PUB_SEC_GRANT' ).
    lo_primitive_property->set_edm_name( 'SenderPubSecGrant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'SENDER_PUB_SEC_BUDGET_PERI' ).
    lo_primitive_property->set_edm_name( 'SenderPubSecBudgetPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'RECEIVER_PUB_SEC_FUND' ).
    lo_primitive_property->set_edm_name( 'ReceiverPubSecFund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'RECEIVER_PUB_SEC_FUNCNL_AR' ).
    lo_primitive_property->set_edm_name( 'ReceiverPubSecFuncnlArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'RECEIVER_PUB_SEC_GRANT' ).
    lo_primitive_property->set_edm_name( 'ReceiverPubSecGrant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'RECEIVER_PUB_SEC_BUDGET_PE' ).
    lo_primitive_property->set_edm_name( 'ReceiverPubSecBudgetPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_time_sheet_entry.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'TIME_SHEET_ENTRY'
                                    is_structure              = VALUE tys_time_sheet_entry( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'TimeSheetEntry' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'TIME_SHEET_ENTRY_COLLECTIO' ).
    lo_entity_set->set_edm_name( 'TimeSheetEntryCollection' ) ##NO_TEXT.


    lo_complex_property = lo_entity_type->create_complex_property( 'TIME_SHEET_DATA_FIELDS' ).
    lo_complex_property->set_edm_name( 'TimeSheetDataFields' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'TIME_SHEET_DATA_FIELDS' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERSON_WORK_AGREEMENT_EXTE' ).
    lo_primitive_property->set_edm_name( 'PersonWorkAgreementExternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_CODE' ).
    lo_primitive_property->set_edm_name( 'CompanyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TIME_SHEET_RECORD' ).
    lo_primitive_property->set_edm_name( 'TimeSheetRecord' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERSON_WORK_AGREEMENT' ).
    lo_primitive_property->set_edm_name( 'PersonWorkAgreement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TIME_SHEET_DATE' ).
    lo_primitive_property->set_edm_name( 'TimeSheetDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TIME_SHEET_IS_RELEASED_ON' ).
    lo_primitive_property->set_edm_name( 'TimeSheetIsReleasedOnSave' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TIME_SHEET_PREDECESSOR_REC' ).
    lo_primitive_property->set_edm_name( 'TimeSheetPredecessorRecord' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TIME_SHEET_STATUS' ).
    lo_primitive_property->set_edm_name( 'TimeSheetStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TIME_SHEET_IS_EXECUTED_IN' ).
    lo_primitive_property->set_edm_name( 'TimeSheetIsExecutedInTestRun' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TIME_SHEET_OPERATION' ).
    lo_primitive_property->set_edm_name( 'TimeSheetOperation' ) ##NO_TEXT.
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
