@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZMSS_Travel_IA_0808'
@EndUserText.label: '###GENERATED Core Data Service Entity'
@ObjectModel.semanticKey: [ 'TravelID' ]
define root view entity ZR_TRAVEL08
  as select from ZTRAVEL08 as Travel
  composition [1..*] of ZR_BOOKING08 as _Booking
{
  key uuid as UUID,
  @ObjectModel.text.element: [ 'Description' ]
  travel_id as TravelID,
  description as Description,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  total_price as TotalPrice,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  currency_code as CurrencyCode,
  begin_date as BeginDate,
  end_date as EndDate,
  destination as Destination,
  sightseeings_tips as SightseeingsTips,
  @Semantics.user.createdBy: true
  local_created_by as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  local_created_at as LocalCreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  _Booking
}
