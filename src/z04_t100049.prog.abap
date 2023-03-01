*&---------------------------------------------------------------------*
*& Report z04_t100049
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04_t100049.
TYPES: BEGIN OF ty_empleados,
         nombre   TYPE char30,
         posicion TYPE char30,
         edad     TYPE i,
       END OF ty_empleados,
       tt_empleado TYPE STANDARD TABLE OF ty_empleados WITH KEY nombre.

* Crear tabla interna en linea
DATA(gt_empleados)  = VALUE tt_empleado( ( nombre  = 'Oscar' posicion = 'ABAP'       edad = 34 )
                                          ( nombre = 'Carlos' posicion = 'FUNCIONAL' edad = 26 )
                                          ( nombre = 'Lorena' posicion = 'ABAP'      edad = 32 )
                                          ( nombre = 'Erick' posicion = 'FUNCIONAL ' edad = 37 )
                                          ( nombre = 'Samuel' posicion = 'ABAP'      edad = 29 )
                                          ( nombre = 'Alicia' posicion = 'BASIS'     edad = 24 )  ).


DATA: gv_edad_total TYPE i,
      GV_EDAd_avg   TYPE i.

loop at gt_empleados into data(ls_employee)
     GROUP BY (  posicion_group = ls_employee-posicion
                 size     = GROUP size
                 index    = GROUP INDEX )
     ASCENDING
     ASSIGNINg FIELD-SYMBOL(<fs_group>).

clear gv_edad_total.

* Salida a nivel posicion concatena entre ||  variables con {}
write: / | Indice: { <fs_group>-index } Posicion { <fs_group>-posicion_group WIDTH = 10 } |
         & | Numero de empleados de esta posición: { <fs_group>-size } |.

* Miembros del group
loop at group <fs_group> ASSIGNING FIELD-SYMBOL(<ls_miembro>).

*gv_edad_total = gv_edad_total + <ls_miembro>-edad.
 gv_edad_total += <ls_miembro>-edad.
 write: /20 <ls_miembro>-nombre.

ENDLOOP.

* Edad del grupo
gv_edad_avg =  gv_edad_total / <fs_group>-size.
write: / |Edad media: { gv_edad_avg }|.


ENDLOOP.
