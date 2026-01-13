using order from '../db/schema';
service OrderManagementService{
    entity Orders as projection on order.Orders;
    entity OrderItems as projection on order.OrderItems;
}