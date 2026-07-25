@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Semantickey: [ 'BookingID' ]
}
@AccessControl.authorizationCheck: #MANDATORY
define view entity ZC_BOOKING08
  as projection on ZR_BOOKING08
  association [1..1] to ZR_BOOKING08 as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
  ParentUUID,
  @Objectmodel: {
    Text.Element: [ 'BookingText' ]
  }
  BookingID,
  BookingText,
  BookingDate,
  FlightDate,
  @Semantics: {
    Amount.Currencycode: 'CurrencyCode'
  }
  Price,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'Currency', 
      Entity.Name: 'I_CurrencyStdVH', 
      Useforvalidation: true
    } ]
  }
  CurrencyCode,
  @Semantics: {
    Amount.Currencycode: 'CurrencyCode'
  }
  DiscountedFlightPrice,
  _Travel : redirected to parent ZC_TRAVEL08,
  _BaseEntity
}
