
using { my.bookshop, sap.common } from '../db/data-model';

service CatalogService {
  entity Books @readonly as projection on bookshop.Books;
  entity Authors @readonly as projection on bookshop.Authors;
  entity Orders @insertonly as projection on bookshop.Orders;
  entity Currencies @readonly as projection on bookshop.Currencies; 
//  entity States @readonly as projection on bookshop.States;
// entity ChargingStations as SELECT from bookshop.ChargingStations {*} excluding { createdBy, modifiedBy };

entity ChargingStations as projection on bookshop.ChargingStations;
entity Connectors as projection on bookshop.Connectors;

  //@readonly entity Connectors as SELECT from bookshop.Connectors {*} excluding { createdBy, modifiedBy };
}