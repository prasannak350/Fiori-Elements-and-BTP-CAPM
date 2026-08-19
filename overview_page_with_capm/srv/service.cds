using sales from '../db/schema';

service SalesService{
    entity Products as projection on sales.Products;
    entity Orders as projection on sales.Orders;

    entity LowStockProducts as projection on sales.LowStockProducts;
    entity ExpensiveProducts as projection on sales.ExpensiveProducts;

    entity CompletedOrders as projection on sales.CompletedOrders;

    entity RevenueByStatus as projection on sales.RevenueByStatus;

}

// for analytical card
annotate SalesService.RevenueByStatus with @(
    Aggregation.CustomAggregate#revenue : 'Edm.Decimal'
);


annotate SalesService.Orders with @(
    UI:{
        SelectionFields : [
            status
        ],
        HeaderInfo : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Order',
            TypeNamePlural : 'Orders',
            Title : {
                Value : customer
            },
            Description : {
                Value :status
            }

        },
        LineItem  : [
            {
                Value : customer,
                Label : 'Customer'
            },
            {
                Value : status,
                Label : 'Status'
            },
            {
                Value : orderDate,
                Label : 'Order Date'
            },
            {
                Value : total,
                Label : 'Total'
            }
        ],
    }
);

annotate SalesService.Products with @(
    UI:{
        LineItem  : [
            {
                Value : name,
                Label : 'Name'
            },
            {
                Value : stock,
                Label : 'Stock'
            },
            {
                Value : price,
                Label : 'Price'
            }
        ],
    }
);