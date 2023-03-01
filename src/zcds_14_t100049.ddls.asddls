@AbapCatalog.sqlViewName: 'ZCDS_14_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS Asociacion 2'
define view ZCDS_14_T100049
  with parameters
    p_Airline  : s_carr_id,
    p_Language : spras
  as select from spfli as Flight
  association [1] to ZCDS_13_T100049 as _COUNTRYNAMEFROM on  $projection.CountryNameFrom = _COUNTRYNAMEFROM.CountryKey
                                                         and _COUNTRYNAMEFROM.Language   = $parameters.p_Language
  association [1] to ZCDS_13_T100049 as _COUNTRYNAMETO   on  $projection.CountryNameTO = _COUNTRYNAMETO.CountryKey
                                                         and _COUNTRYNAMETO.Language   = $parameters.p_Language
{
  key Flight.carrid                as AirlineCode,
  key Flight.connid                as FlighConnection,
      Flight.cityfrom              as CityFrom,
      Flight.countryfr             as CountryKeyFrom,
      _COUNTRYNAMEFROM.CountryName as CountryNameFrom,
      Flight.countryto             as Countrykeyto,
      Flight.cityto                as Cityto,
      _COUNTRYNAMETO.CountryName   as CountryNameTO

}
where
  Flight.carrid = $parameters.p_Airline
