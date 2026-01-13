using my.Order as db from '../db/schema';

// path will be shown as '' when we run the app instaed of /odata/v4
service MyCustomService @(path: '/api/customlogic'){
    entity Order as projection on db.Order;

    // functions - bounded function(depended on the entity Order)
    function getStatus(Order:UUID) returns String;

    // functions - unbounded function(independent)
    function getOrders(quantity:Integer) returns String;

    // action - unbounded action(independent)
    action PlaceBulkOrders(quantity:Integer) returns String;

    // actions - unbounded
    action CalculateDiscount(total:Decimal(10, 2)) returns Decimal(10, 2);
}
