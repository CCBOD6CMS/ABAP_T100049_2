*&---------------------------------------------------------------------*
*& Report z01_semantics_t100049
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_semantics_t100049.

SELECT FROM cdsviewannopos
FIELDS *
WHERE cdsname = 'ZCDS_10_T100049'
*AND annotationname LIKE '%.%'
INTO TABLE @DATA(gt_annotaciones_header).

cl_Demo_output=>write( gt_annotaciones_header ).

SELECT FROM cds_field_annotation
FIELDS *
WHERE cdsname = 'ZCDS_10_T100049'
*AND annotationname LIKE '%.%'
INTO TABLE @DATA(gt_annotaciones).

cl_Demo_output=>write( gt_annotaciones ).

cl_demo_output=>display(  ).
