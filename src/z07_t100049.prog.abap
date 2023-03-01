*&---------------------------------------------------------------------*
*& Report z07_t100049
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z07_t100049.

INSERT zemploye_t100049 FROM TABLE @( VALUE #( (   employee_id  = 122
                                                    name         = 'John'
                                                    last_name    = 'Smith'
                                                    gender       = 'M' ) ) ).

 select from zemploye_T100049
         FIELDS *
         INTO TABLE @DATA(GT_EMPLOYEES).

* borrar datos temporales
DELETE FROM zemploye_T100049.

 IF SY-SUBRC = 0.
 cl_demo_output=>display( GT_EMPLOYEES ).
 ENDIF.
