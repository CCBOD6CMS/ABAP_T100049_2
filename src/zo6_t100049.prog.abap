*&---------------------------------------------------------------------*
*& Report zo6_t100049
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zo6_t100049.

WITH +tmp_table AS (
SELECT FROM scarr
  FIELDS carrname,
  CAST( '-' AS CHAR( 4 ) ) AS connid,
     '-' AS cityfrom, '-' AS cityto

  WHERE carrid = 'LH'

UNION
 SELECT FROM spfli
 FIELDS '-' AS carrname,
 CAST( connid AS CHAR( 4 ) ) AS connid,
 cityfrom, cityto

WHERE carrid = 'LH' )

SELECT FROM +tmp_table FIELDS *
ORDER BY carrname DESCENDING
INTO TABLE @DATA(lt_result)
UP TO 10 ROWS.


cl_demo_output=>display(  lt_result ).
