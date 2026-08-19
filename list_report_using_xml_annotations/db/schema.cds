namespace my.bookshop;

using { cuid, managed } from '@sap/cds/common';

entity Products : cuid, managed {
    productName : String(100);
    category    : String(50);
    description : String(500);
    price       : Decimal(10, 2);
    currency    : String(3);
    stock       : Integer;
    status      : String(20);
}