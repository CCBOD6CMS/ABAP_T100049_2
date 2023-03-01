@AbapCatalog.sqlViewName: 'ZCDS_16_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS Asociacion parametros 2'
define view ZCDS_16_T100049
  with parameters
    p_Airlinecode :s_carr_id
  as select from sflight as FLIGHT
  association [1] to ZCDS_15_T100049 as _Airline on _Airline.Carrid = FLIGHT.carrid


{
  key carrid,
  key connid,
  key fldate,
      @Semantics.amount.currencyCode: 'Currcode'
      price,
      planetype,
      // parametros obligatorios
      //_Airline(p_Airlinecode:'AA').Carrname,
      _Airline(p_Airlinecode:$parameters.p_Airlinecode ).Carrname,
      @Semantics.currencyCode: true
      _Airline(p_Airlinecode:$parameters.p_airlinecode ).Currcode,
      _Airline(p_Airlinecode:$parameters.p_airlinecode ).Url

}
where
  FLIGHT.carrid = $parameters.p_Airlinecode
