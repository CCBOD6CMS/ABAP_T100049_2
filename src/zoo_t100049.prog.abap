*&---------------------------------------------------------------------*
*& Report zoo_t100049
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zoo_t100049.
CLASS lcl_factura  DEFINITION.

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_factura,
             importe_base TYPE i,
             iva          TYPE i,
           END OF ty_factura,
           tt_factura TYPE TABLE OF ty_factura.

    METHODS add_item IMPORTING is_item TYPE ty_factura.
    METHODS add_items IMPORTING it_item TYPE tt_factura.

ENDCLASS.

CLASS lcl_factura IMPLEMENTATION.

  METHOD add_item.

  ENDMETHOD.

  METHOD add_items.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

* instancia objetos
*1
  DATA go_factura_old TYPE REF TO lcl_factura.
  CREATE OBJECT go_factura_old.
*2
  DATA go_factura_old1 TYPE REF TO lcl_factura.
  go_factura_old1 = NEW  #(  ).
*3
  DATA(go_factura_old2) = NEW lcl_factura(  ).

* Llamada metodo
  go_factura_old2->add_item( is_item = VALUE #( importe_base = 10  iva = 2 )  ).

  go_factura_old2->add_items( it_item = VALUE #(  ( importe_base = 10 iva = 2 )
                                                  ( importe_base = 20 iva = 2 ) ) ).

* Definicion con tipo table - valores en tablas
  DATA gt_facturas TYPE lcl_factura=>tt_factura.

  gt_facturas = VALUE #( ( importe_base = 10 iva = 2 )
                         ( importe_base = 20 iva = 2 ) ).

  go_factura_old2->add_items( it_item = gt_facturas ).

* convertir tipo
  data(gv_xstring) = cl_abap_codepage=>convert_to( source = conv #(  sy-uname ) ) .
