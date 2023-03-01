*&---------------------------------------------------------------------*
*& Report z02_cds_path_t100049
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z02_cds_path_t100049.

DATA gv_carrid TYPE s_carr_id VALUE 'LH'.

CL_demo_input=>request(  CHANGING field = gv_carrid ).

SELECT FROM zcds_22_t100049 AS cds
FIELDS cds~carrname AS carname,
\_Flights-connid AS Connid,
\_Flights\_Flight-fldate AS fldate,
\_Flights\_Airports-name  AS name
WHERE cds~carrid EQ @gv_carrid
INTO TABLE @DATA(gt_results).

IF sy-subrc = 0.
  cl_demo_output=>display(  gt_results ).
ENDIF.
