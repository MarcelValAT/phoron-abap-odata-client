CLASS zcx_odata_v2_error DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        iv_operation   TYPE string   OPTIONAL
        iv_entity_set  TYPE string   OPTIONAL
        iv_http_status TYPE i        OPTIONAL
        previous       TYPE REF TO cx_root OPTIONAL.

    METHODS get_text
      REDEFINITION.

    DATA mv_operation   TYPE string.
    DATA mv_entity_set  TYPE string.
    DATA mv_http_status TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcx_odata_v2_error IMPLEMENTATION.

  METHOD constructor.
    super->constructor( previous = previous ).
    me->mv_operation   = iv_operation.
    me->mv_entity_set  = iv_entity_set.
    me->mv_http_status = iv_http_status.
  ENDMETHOD.

  METHOD get_text.
    DATA lv_prev_text TYPE string.

    IF previous IS BOUND.
      lv_prev_text = previous->get_text( ).
    ENDIF.

    IF mv_http_status > 0.
      result = |{ mv_operation } { mv_entity_set } HTTP { mv_http_status }: { lv_prev_text }|.
    ELSEIF lv_prev_text IS NOT INITIAL.
      result = |{ mv_operation } { mv_entity_set }: { lv_prev_text }|.
    ELSE.
      result = |{ mv_operation } { mv_entity_set }: Unbekannter Fehler|.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
