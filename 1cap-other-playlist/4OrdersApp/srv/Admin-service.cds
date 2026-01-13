using my.orders as db from '../db/schema';

service RestrictedService @(required:'admin'){   // if we give required, it asks for user credentials
    entity Orders as projection on db.Orders;
    entity OrderItems as projection on db.OrderItems;
}