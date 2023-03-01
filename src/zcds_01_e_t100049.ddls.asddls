@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'cds Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zcds_01_e_T100049
  as select from bookings
{

  key carrid     as Carrid,
  key connid     as Connid,
  key fldate     as Fldate,
  key bookid     as Bookid,
      customid   as Customid,
      custtype   as Custtype,
      smoker     as Smoker,
      //luggweight as Luggweight,
      wunit      as Wunit,
      invoice    as Invoice,
      class      as Class,
      @Semantics.amount.currencyCode: 'Forcurkey'
      forcuram   as Forcuram,
      forcurkey  as Forcurkey,
      @Semantics.amount.currencyCode: 'Forcurkey'
      loccuram   as Loccuram,
      order_date as OrderDate
}
