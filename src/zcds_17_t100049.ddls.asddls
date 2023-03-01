@AbapCatalog.sqlViewName: 'ZCDS_17_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS Asociacion exponer'

@ObjectModel.representativeKey: 'AirportId'

define view ZCDS_17_T100049
  as select from sairport
{
  key id        as AirportId,
      name      as AirportName,
      time_zone as AirportTimeZone
}
