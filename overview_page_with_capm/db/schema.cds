namespace sales;

entity Products {
  key ID    : UUID;
  name      : String;
  stock     : Integer;
  price     : Decimal(9,2);
  criticality : Integer;
}

entity Orders {
  key ID     : UUID;
  customer   : String;
  status     : String enum { open; shipped; completed; cancelled; };   // restricted to a fixed set of allowed values
  orderDate  : Date;
  total      : Decimal(9,2);
}

entity LowStockProducts as
select from Products {
    *
}
where stock < 20;


entity ExpensiveProducts as
select from Products {
    *
}
where price > 500;



entity CompletedOrders as
select from Orders {
    *
}
where status = 'completed';


//for analytical card
entity RevenueByStatus as select from Orders {
    key status,
    count(ID) as orderCount : Integer,

    @Aggregation.default: #SUM
    sum(total) as revenue : Decimal(15,2)
}
group by status;