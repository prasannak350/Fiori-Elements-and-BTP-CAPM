namespace order;
using {cuid, managed, localized} from '@sap/cds/common';

// authorization - once we run the application it asks for userdetails
@requires: 'authenticated-user'
entity Orders @(restrict:[
    {grant: 'READ', to: 'authenticated-user'},
    {grant: 'CREATE', to: 'Customer'},
    {grant: 'UPDATE', to: 'Admin'},
    {grant: 'DELETE', to: 'Admin'}
]){
    key ID: UUID;
    customerID: String;
    orderDate: DateTime;
    TotalAmount: Decimal(10, 2);
    items: Composition of many OrderItems on items.orderID = $self;
}

@requires: 'authenticated-user'
entity OrderItems @(restrict:[
    {grant: 'READ', to: 'authenticated-user'},
    {grant: 'CREATE', to: 'Customer'},
    {grant: 'UPDATE', to: 'Admin'},
    {grant: 'DELETE', to: 'Admin'}
]){
    key ID: UUID;
    orderID: Association to Orders;
    productName:localized String;
    Quantity: Integer;
    UnitPrice: Decimal(10, 2);
    TotalPrice: Decimal(10, 2);
}