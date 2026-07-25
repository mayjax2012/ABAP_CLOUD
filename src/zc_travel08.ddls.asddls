@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZMSS_Travel_IA_0808', 
  Semantickey: [ 'TravelID' ]
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_TRAVEL08
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TRAVEL08
  association [1..1] to ZR_TRAVEL08 as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
  @Objectmodel: {
    Text.Element: [ 'Description' ]
  }
  TravelID,
  Description,
  @Semantics: {
    Amount.Currencycode: 'CurrencyCode'
  }
  TotalPrice,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'Currency', 
      Entity.Name: 'I_CurrencyStdVH', 
      Useforvalidation: true
    } ]
  }
  CurrencyCode,
  BeginDate,
  EndDate,
  Destination,
  SightseeingsTips,
  @Semantics: {
    User.Createdby: true
  }
  LocalCreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  LocalCreatedAt,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LocalLastChangedBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  _Booking : redirected to composition child ZC_BOOKING08,
  _BaseEntity
}
