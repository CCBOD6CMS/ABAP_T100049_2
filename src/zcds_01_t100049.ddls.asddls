@AbapCatalog.sqlViewName: 'ZCDS_01_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS - Basic View'
define view ZCDS_01_T100049
  as select from zproduct_t100049
{
  key product        as Product,
  product_type       as Productype,
  creation_date_time as CreationDateTime

}
