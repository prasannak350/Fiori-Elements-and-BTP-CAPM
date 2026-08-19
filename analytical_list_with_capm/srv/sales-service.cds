using sales.analytics as db from '../db/schema';

service SalesService {
  @readonly
  entity SalesAnalytics as projection on db.SalesOrderItems {
    *,
    product.name  as productName,
    region.name   as regionName,
    customer.name as customerName,
    case
      when revenue >= 10000 then 3   // Green - Positive
      when revenue >= 5000  then 2   // Yellow - Critical
      else 1                          // Red - Negative
    end as revenueCriticality : Integer
  } excluding { createdAt, createdBy, modifiedAt, modifiedBy }
}

annotate SalesService.SalesAnalytics with @Aggregation.ApplySupported: {
  Transformations       : ['aggregate','groupby','filter','search'],
  Rollup                : #None,
  PropertyRestrictions  : true,
  GroupableProperties    : [productName, regionName, customerName, orderDate],
  AggregatableProperties : [
    {Property: quantity},
    {Property: revenue},
    {Property: discount}
  ]
};

annotate SalesService.SalesAnalytics with {
  quantity     @Analytics.Measure: true @Aggregation.default: #SUM @Common.Label: 'Quantity';
  revenue      @Analytics.Measure: true @Aggregation.default: #SUM @Common.Label: 'Revenue';
  discount     @Analytics.Measure: true @Aggregation.default: #SUM @Common.Label: 'Discount %';
  productName  @Analytics.Dimension: true @Common.Label: 'Product';
  regionName   @Analytics.Dimension: true @Common.Label: 'Region';
  customerName @Analytics.Dimension: true @Common.Label: 'Customer';
  orderDate    @Analytics.Dimension: true @Common.Label: 'Order Date';
};


annotate SalesService.SalesAnalytics with @(
    Aggregation.CustomAggregate#revenue : 'Edm.Decimal',
    Aggregation.CustomAggregate#quantity : 'Edm.Int32',
    Aggregation.CustomAggregate#discount : 'Edm.Decimal'
);