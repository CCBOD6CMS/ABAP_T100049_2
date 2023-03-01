@AbapCatalog.sqlViewName: 'ZCDS_18_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS Asociacion exponer 2'
define view ZCDS_18_T100049
  as select from spfli as Flight
  association [1] to ZCDS_17_T100049 as _AirportFrom on _AirportFrom.AirportId = Flight.airpfrom

{
  key carrid,
  key connid,
      countryfr,
      cityfrom,
      airpfrom,
      _AirportFrom
}
