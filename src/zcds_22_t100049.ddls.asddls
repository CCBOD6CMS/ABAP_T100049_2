@AbapCatalog.sqlViewName: 'ZCDS_22_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS Path Expresion 2'
define view ZCDS_22_T100049
  as select from scarr
  association [*] to ZCDS_21_T100049 as _Flights on _Flights.carrid = scarr.carrid
{
  key scarr.carrid,
      scarr.carrname,
      _Flights
}
