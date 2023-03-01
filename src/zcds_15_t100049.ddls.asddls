@AbapCatalog.sqlViewName: 'ZCDS_15_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS Asociacion parametros'
define view ZCDS_15_T100049
  with parameters
    p_Airlinecode :s_carr_id
  as select from scarr
{
  key carrid   as Carrid,
      carrname as Carrname,
      @Semantics.currencyCode: true
      currcode as Currcode,
      @Semantics.url.mimeType: 'Url'
      url      as Url
}
where
  carrid = $parameters.p_Airlinecode
