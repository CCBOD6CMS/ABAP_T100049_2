@AbapCatalog.sqlViewName: 'ZCDS_03_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS - CASE'
define view ZCDS_03_T100049
  as select from spfli
{
  key carrid,
  key connid,
  distance as Distance,
      case
        when distance >= 2000 then 'Long Flight'
        when distance >= 1000  and distance < 2000 then 'Medium Flight'
        when distance < 100  then 'Short Flight'
        else 'Error'
        end as FlightType

}
