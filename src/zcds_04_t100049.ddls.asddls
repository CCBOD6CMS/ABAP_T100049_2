@AbapCatalog.sqlViewName: 'ZCDS_04_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Variables sesion'
define view ZCDS_04_T100049
  as select from t000
{
  $session.client          as ClientField,
  $session.system_date     as SistemDateField,
  $session.system_language as SystemLanguageField,
  $session.user            as UserField

}
