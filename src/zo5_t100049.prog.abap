*&---------------------------------------------------------------------*
*& Report zo5_t100049
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zo5_t100049.

PARAMETERS: pa_page TYPE i,
            pa_reg  TYPE i.

DATA gv_offset TYPE int8.

* obtener el bloque para usuario  (incial es 0.. en bbdd 1 para usuario ) * numero de registros
gv_offset = ( pa_page - 1 ) * pa_reg.

* solo muestra los registro del bloque salen por pantalla
* ctrl+space  componentes de tabla con FIELDS
SELECT FROM sflight  FIELDS *
                      WHERE carrid EQ 'AA'
                      ORDER BY carrid, connid, fldate ASCENDING
                      INTO TABLE @DATA(gt_result)
                      OFFSET @gv_offset     "bloque que se necesita
                      UP TO @pa_reg ROWS.  "registros bloque


IF sy-subrc = 0.
  cl_demo_output=>display( gt_result ).
ENDIF.
