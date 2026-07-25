@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZMSS_TRAVEL_M_0808'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_MSS_TRAVEL_M_0808
  as select from ZMSS_TRAVEL_M_08
{
  key travel_id as TravelID,
  agency_id as AgencyID,
  customer_id as CustomerID,
  begin_date as BeginDate,
  end_date as EndDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  booking_fee as BookingFee,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  total_price as TotalPrice,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  currency_code as CurrencyCode,
  description as Description,
  overall_status as OverallStatus,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  last_changed_at as LastChangedAt
}
