@AbapCatalog.sqlViewName: 'ZCDS_09_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS Conversion cantidad'
define view ZCDS_09_T100049
  with parameters
    p_ToUnit     : abap.unit( 3 ),
    p_UnitFilter : abap.unit( 3 )

  as select from spfli
{
  distance                                                                     as OriginalValue,
  distid                                                                       as OriginalUnit,

  //cast( 'KM' as abap.unit( 3 )) as KmUnit,  "Modelo de conversion unidades con KM Harcode

  cast( unit_conversion( quantity    => distance,
                         source_unit => distid,
  //                      target_unit => cast( 'MI' as abap.unit( 3 ) ),
  // uso parametro
                         target_unit => :p_ToUnit,
                         error_handling => 'SET_TO_NULL' ) as abap.dec(10,3) ) as ConvertedValue,
  //  Proyectamos parametro 'MI'                                                                         as ConvertUnit
  $parameters.p_ToUnit                                                         as ConvertUnit
}
where
  // Filtro parametro
  distid = $parameters.p_UnitFilter;
