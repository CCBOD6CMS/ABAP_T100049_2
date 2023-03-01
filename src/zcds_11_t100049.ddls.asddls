@AbapCatalog.sqlViewName: 'ZCDS_11_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS Join'
define view ZCDS_11_T100049
  with parameters
    p_Currency : s_currcode
  as select from spfli   as FlighPlan
    inner join   sflight as Fligt on  FlighPlan.carrid = Fligt.carrid
                                  and FlighPlan.connid = Fligt.connid

{
  key FlighPlan.carrid    as caRRID,
  key Fligt.connid        as CONNID,
      FlighPlan.countryfr as CountryFrom,
      Fligt.fldate        as Fldate,
      FlighPlan.period    as Period
}
where
  Fligt.currency = $parameters.p_Currency
