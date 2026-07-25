@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@ObjectModel.semanticKey: [ 'BookingID' ]
define view entity ZR_BOOKING08
  as select from ZBOOKING08 as Booking
  association to parent ZR_TRAVEL08 as _Travel on $projection.ParentUuid = _Travel.Uuid
{
  key uuid as UUID,
  parent_uuid as ParentUUID,
  @ObjectModel.text.element: [ 'BookingText' ]
  booking_id as BookingID,
  booking_text as BookingText,
  booking_date as BookingDate,
  flight_date as FlightDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  price as Price,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  currency_code as CurrencyCode,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  discounted_flight_price as DiscountedFlightPrice,
  _Travel
}
