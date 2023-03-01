@AbapCatalog.sqlViewName: 'ZCDS_21_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS Path Expresion'
define view ZCDS_21_T100049
  as select from spfli
  association [0..*] to sflight  as _Flight   on _Flight.carrid = spfli.carrid
                                              and _Flight.connid = spfli.connid
  association [1..1] to sairport as _Airports on  _Airports.id = spfli.airpfrom
{
  key carrid,
  key connid,
      spfli.airpfrom,
      _Flight,
      _Airports

}
