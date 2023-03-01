@AbapCatalog.sqlViewName: 'ZCDS_08_T49'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Union Agregacion'
define view ZCDS_08_T100049
  as select from ZCDS_07_T100049
{
  key Field1,
      min(Field3)              as FieldWhitMin,
      max(Field3)              as FieldWhitMax,
      avg(Field3)              as FieldWhitAvg,
      sum(Field3)              as FieldWhitSum,
      count ( distinct Field3) as FieldCountDistinct,
      count(*)                 as FieldCountAll
}
group by
    Field1

