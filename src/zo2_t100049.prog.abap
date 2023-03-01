*&---------------------------------------------------------------------*
*& Report zo2_t100049
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zo2_t100049.

SELECT carrid, connid, fldate
       FROM sflight
       INTO TABLE @DATA(gt_new_flights).

DATA(gv_carrid)  = 'AA'.

SELECT carrid, connid, fldate
FROM sflight
INTO TABLE @gt_new_flights
WHERE carrid = @gv_carrid.

READ TABLE gt_new_flights INTO DATA(gs_new_flights) INDEX 1.
* con sy-subrc


TRY.
    DATA(gs_new_flights2) = gt_new_flights[ 1 ].
* para evitar excepciones utilizar try endtry

    gs_new_flights2 =  gT_new_flights[ carrid = 'AA' connid = '1070' ].

    DATA(GV_CARRId_2) = gt_new_flights[ 3 ]-carrid.

  CATCH cx_sy_itab_line_not_found INTO DATA(gx_excepcion).
    WRITE gx_excepcion->get_text( ).

ENDTRY.

* Asignar puntero y grabar valor
APPEND INITIAL LINE TO gt_new_flights  ASSIGNING FIELD-SYMBOL(<gs_new_fligth>).
<gs_new_fligth>-carrid = 'LH'.

* Asignar tipo - problema decimal
DATA: gv_value_1 TYPE f VALUE '10',
      gv_value_2 TYPE f VALUE '1.9'.  "si valor 1.9 - ignora decimales!!! (solucion CONV con tipo de datos con decimals ok!)

DATA(gv_final) = gv_value_1 + gv_value_2.

* Iteración tablas
DATA: gt_final TYPE TABLE OF sflight,
      gs_final TYPE sflight.

SELECT carrid, connid, fldate
      FROM sflight  INTO TABLE @DATA(gt_flights).

SELECT carrid, connid, fldate
      FROM sflight  INTO TABLE @DATA(gt_airline).

gt_final = VALUE #( FOR <gs_new_flights_for> IN gt_flights WHERE ( carrid  EQ 'LH' )
                    FOR gs_new_airline   IN gt_airline WHERE ( connid  = <gs_new_flights_for>-connid )
                   (  carrid = <gs_new_flights_for>-carrid
                      connid  = gs_new_airline-connid ) ).


.
