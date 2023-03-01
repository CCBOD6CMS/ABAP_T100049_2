@AbapCatalog.sqlViewName: 'ZCDS_061_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS Union 1'
define view ZCDS_061_T100049
  as select from zint_products
{
  key product_id  as ProductId,
      description as Description
}
//union all select  from zext1_products
  union select  from zext1_products
{
  key product_id  as ProductId,
      description as Description
}
