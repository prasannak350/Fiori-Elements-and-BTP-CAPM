namespace my.orders;
using {cuid, managed, localized} from '@sap/cds/common';

// to perform searching for particular value for a field
@cds.search: {status, ID}
entity Orders {
    key ID: UUID @default.uuid; // it auto generated the id's
    orderDate: Date;
    status: String(20);
    totalAmount: Decimal(10, 2);
    createdBy: String(50);
    items: Composition of many OrderItems on items.orderID = $self;
}


entity OrderItems {
    key ID: UUID @default.uuid;
    orderID: Association to Orders;
    productName: String(100);
    quantity: Integer;
    price: Decimal(10, 2);
}