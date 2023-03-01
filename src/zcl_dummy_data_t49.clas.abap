CLASS zcl_dummy_data_t49 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dummy_data_t49 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    MODIFY zempl_h_t49 FROM TABLE @( VALUE #(
                                        ( employe  = '1' manager = ' ' name  = 'name 1' )
                                        ( employe  = '2' manager = '1' name  = 'name 2' )
                                        ( employe  = '3' manager = '2' name  = 'name 3' )
                                        ( employe  = '4' manager = '2' name  = 'name 4' )
                                        ( employe  = '5' manager = ' ' name  = 'name 5' )
                                        ( employe  = '6' manager = '5' name  = 'name 6' )
                                        ( employe  = '7' manager = '5' name  = 'name 7' )
                                        ( employe  = '8' manager = '7' name  = 'name 8' )
                                        ( employe  = '9' manager = '8'  name  = 'name 9' )  ) ).

  ENDMETHOD.

ENDCLASS.
