@AbapCatalog.sqlViewName: 'ZCDS_10_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDs Conversion importe'
define view ZCDS_10_T100049
  with parameters
    p_CurrencyConvert : abap.cuky
  as select from sflight
{
  key carrid                                              as Carrid,
  key connid                                              as Connid,
  key fldate                                              as Fldate,
      @Semantics.amount.currencyCode: 'Currency'
      price                                               as Price,
      @Semantics.currencyCode: true
      currency                                            as Currency,
      currency_conversion( amount => price,
                           source_currency => currency,
      //                          target_currency => cast('EUR' as abap.cuky),
                             target_currency => $parameters.p_CurrencyConvert,
                           exchange_rate_date => fldate ) as PriceInEur,
      $parameters.p_CurrencyConvert                       as ConvertCurry
}
where
  currency = 'USD';
