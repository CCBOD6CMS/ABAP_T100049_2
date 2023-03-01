@AbapCatalog.sqlViewName: 'ZCDS_06_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Manejo cliente  2'
@ClientHandling.algorithm: #SESSION_VARIABLE
define view ZCDS_06_T100049 as select from scarr 
{
    key carrid as Carrid,
    carrname as Carrname,
    currcode as Currcode,
    url as Url
}
