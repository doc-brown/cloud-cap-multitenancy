namespace my.bookshop;
using { User, Country, managed } from '@sap/cds/common';

entity Books {
  key ID : Integer;
  title  : localized String;
  author : Association to Authors;
  stock  : Integer;
}

entity Authors {
  key ID : Integer;
  name   : String;
  books  : Association to many Books on books.author = $self;
}

entity Orders : managed {
  key ID    : UUID;
  book      : Association to Books;
  country   : Country;
  sold_on   : Date;
  quantity  : Integer;
  Price_USD : Double;
  state     : Association to States;
}

@cds.persistence.exists
entity Currencies {
  key code : String(3);
  name     : String(128);
  UperUSD  : Double;
  USDperU  : Double;
}

@cds.persistence.exists
entity States {
  key code : String(2);
  abbrev   : String(6);
  name     : String(24);
}

// entity OrdersWithState as projection on Orders {
//   Orders.ID as ID, 
//   Orders.book.title as Title, 
//   Orders.quantity as Quantity, 
//   Orders.sold_on as Sold_On,
//   Orders.Price_USD as Price_USD,
//   Orders.state.name as State
// } 

@cds.persistence.exists
entity Orders_View {
  key ID     : Integer;
  title      : String(5000);
  quantity   : Integer;
  sold_on    : Date;
  state_code : String(2);
  price_USD  : Double;
  total_USD  : Double;
  total_EUR  : Double;
  total_VES  : Double;
  total_GLD  : Double;
}

// entity OrdersInGLD     as
//   select from Orders_View
//   join States
//     on Orders_View.state_code = States.code
//   {
//     Orders_View.ID        as ID,
//     Orders_View.title     as Title,
//     Orders_View.quantity  as Quantity,
//     Orders_View.sold_on   as Sold_On,
//     Orders_View.total_GLD as Price_GLD,
//     States.name           as State
//   }
//   order by
//     Orders_View.sold_on asc;

entity config {
  key name : String(12);
  value    : String(24);
}

entity ChargingStations {
key ID : Integer;
// |templateHash |string |VARCHAR
// |templateHashTechnical |string |VARCHAR
// |templateHashCapabilities |string |VARCHAR
// |templateHashOcppStandard |string |VARCHAR
// |templateHashOcppVendor |string |VARCHAR
issuer : Boolean;
// public |boolean |BOOLEAN
// |siteAreaID |string |VARCHAR
// |siteID |string |VARCHAR
// chargePointSerialNumber: String;
chargePointModel :String;
// chargeBoxSerialNumber :String;
// chargePointVendor :String;
// |iccid |string |VARCHAR
// |imsi |string |VARCHAR
// |meterType |string |VARCHAR
// |firmwareVersion |string |VARCHAR
// |meterSerialNumber |string |VARCHAR
// |endpoint |string |VARCHAR
// |ocppVersion |OCPPVersion (string enum) |VARCHAR
// |ocppProtocol |OCPPProtocol (string enum) |VARCHAR
// |cfApplicationIDAndInstanceIndex |string |VARCHAR
// |lastSeen |Date |SECONDDATE
// |deleted |boolean |BOOLEAN
// |lastReboot |Date |SECONDDATE
// |chargingStationURL |string |NVARCHAR
// |maximumPower |number |SMALL
// |excludeFromSmartCharging |boolean |BOOLEAN
// |forceInactive |boolean |BOOLEAN
// |manualConfiguration |boolean |BOOLEAN
// |powerLimitUnit | ChargingRateUnitType (string enum) |VARCHAR
voltage: Integer;
connectors:  Association to many Connectors on connectors.chargingStation = $self;
// |chargePoints |ChargePoints[] |deferred to new table
// |coordinates |number[] |deferred to new coordinates table
// |remoteAuthorizations |RemoteAuthorization[] |deferred to new table
// |currentIPAddress |string |VARCHAR
// |capabilities |ChargingStationCapabilities |deferred to new table
// |ocppStandardParameters |KeyValue[] |deferred to new table
// |ocppVendorParameters |KeyValue[] |deferred to new table
// |ocpiData |ChargingStationOcpiData |deferred to new table
}

entity Connectors {
//   key id: Integer;
  key connectorId: Integer;
  chargingStation: Association to ChargingStations;
//   currentInstantWatts?: number;
//   currentStateOfCharge?: number;
//   currentTotalConsumptionWh?: number;
//   currentTotalInactivitySecs?: number;
//   currentInactivityStatus?: InactivityStatus;
//   currentTransactionID?: number;
  currentTransactionDate: DateTime;
//   currentTagID?: string;
//   status: ChargePointStatus;
//   errorCode?: string;
  info: LargeString;
//   vendorErrorCode?: string;
//   power?: number;
//   type?: ConnectorType;
// //   voltage?: Voltage;
//   amperage?: number;
//   amperageLimit?: number;
//   userID?: string;
//   user?: User;
//   statusLastChangedOn?: Date;
//   numberOfConnectedPhase?: number;
//   currentType?: CurrentType;
//   chargePointID?: number;
//   phaseAssignmentToGrid?: PhaseAssignmentToGrid;
}
