namespace sales.analytics;

using { cuid, managed } from '@sap/cds/common';

entity Products {
  key ID       : Integer;
  name         : String(100);
  category     : String(50);
}

entity Regions {
  key ID       : Integer;
  name         : String(50);
}

entity Customers {
  key ID       : Integer;
  name         : String(100);
  region       : Association to Regions;
}

entity SalesOrderItems : cuid, managed {
  orderDate    : Date;
  product      : Association to Products;
  customer     : Association to Customers;
  region       : Association to Regions;
  quantity     : Integer;
  revenue      : Decimal(15,2);
  discount     : Decimal(5,2);
}