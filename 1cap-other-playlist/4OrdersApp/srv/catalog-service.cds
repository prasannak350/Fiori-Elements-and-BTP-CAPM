using my.orders as db from '../db/schema';

service CatalogService {
    // supports only read operation
    // @readonly entity Orders as projection on db.Orders;  

    // to perform for read only for only one field for "createdBy"
    entity Orders as projection on db.Orders{
        key ID, orderDate, status, totalAmount, createdBy @readonly
    };

    // to hide a field
    // entity OrderItems as projection on db.OrderItems excluding {price,quantity};

    // for sorting
    entity OrderItems as projection on db.OrderItems order by price desc;
}
