CLASS zcl_datos_tabla_t49 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_datos_tabla_t49 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lt_results TYPE TABLE OF zemployee_t49.

    lt_results = VALUE #( (  id = '11UX' name = 'Lorena' )
                          (  id = '12UX' name = 'Rosa' ) ).

    MODIFY zemployee_t49 FROM TABLE  @lt_results.
    IF sy-subrc = 0.
      WRITE  'Data inserted'.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
