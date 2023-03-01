@AbapCatalog.sqlViewName: 'ZCDS_13_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS Asociacion'

@ObjectModel: {
 dataCategory: #TEXT,
 representativeKey: 'CountryKey'
 }

define view ZCDS_13_T100049
  as select from t005t
{
  key land1   as CountryKey,
      @Semantics.language: true
  key spras   as Language,
      @Semantics.text: true
      @EndUserText.label: 'Country name'
      landx50 as CountryName
}
