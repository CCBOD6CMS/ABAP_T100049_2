@AbapCatalog.sqlViewName: 'ZCDS_20_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS Asociacion Inner Explicito'
define view ZCDS_20_T100049
  as select from spfli
  association to scarr as _scarr on spfli.carrid = _scarr.carrid
{
  key spfli.carrid    as Carrid,
  key spfli.connid    as Flight,
//   _scarr.carrname as Carrier,
     _scarr.carrname[inner] as Carrier,
      spfli.cityfrom  as Departure,
      spfli.cityto    as Arrival,
//      _scarr.currcode as CurrencyCode
       _scarr.currcode[inner] as CurrencyCode
}
