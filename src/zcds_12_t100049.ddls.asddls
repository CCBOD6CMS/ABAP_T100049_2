@AbapCatalog.sqlViewName: 'ZCDS_12_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS TEXT'
@ObjectModel: {
    dataCategory:#TEXT ,
    representativeKey: 'Unit'
 }

define view ZCDS_12_T100049
  with parameters
    p_language : spras
  as select from t006a
{
      @Semantics.language: true
  key spras as languaje,
  key msehi as unit,
      mseh3 as ComercialFormat,
      mseh6 as TecnicalFormat,
      @Semantics.text: true
      @EndUserText.label: 'Unidad de medida'
      msehl as UnixText
}
where
  spras = $parameters.p_language;
