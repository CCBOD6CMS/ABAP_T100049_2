@AbapCatalog.sqlViewName: 'ZCDS_24_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'CDS Base jerarquia'
define view ZCDS_24_T100049
  as select from zempl_h_t49
  association [0..1] to ZCDS_24_T100049 as _Manager on $projection.Manager = _Manager.Employe
{
  key employe as Employe,
      manager as Manager,
      name    as Name,
      _Manager
}
