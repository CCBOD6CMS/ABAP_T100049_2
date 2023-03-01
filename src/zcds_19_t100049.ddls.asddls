@AbapCatalog.sqlViewName: 'ZCDS_19_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS Asociacion Filtros'
define view ZCDS_19_T100049
  with parameters
    //   @Environment.systemField: #SYSTEM_LANGUAGE ( otra forma de definir es con el simbolo @< )
    p_language : syst_langu @<Environment.systemField: #SYSTEM_LANGUAGE
  as select from scarr as CompanyCode
  association [0..*] to tcurt as _Currency on _Currency.waers = CompanyCode.currcode

{
  key CompanyCode.carrid                                 as Carrid,
      CompanyCode.carrname                               as CarrName,
      CompanyCode.currcode                               as Currencycode,
      $parameters.p_language                             as Language,
      _Currency[1:spras = $parameters.p_language ].ktext as CurrencyName,
      _Currency[1:spras = $parameters.p_language ].ktext as CurrencyName1
}
