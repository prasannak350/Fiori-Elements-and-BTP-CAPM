using SalesService as service from '../../srv/sales-service';

annotate service.SalesAnalytics with @UI: {
  SelectionFields: [ productName, regionName, orderDate ],

  Chart: {
    ChartType: #Column,
    Dimensions: [ productName, regionName ],
    Measures: [ revenue ],
    MeasureAttributes: [
      { Measure: revenue, Role: #Axis1 }
    ],
    DimensionAttributes: [
      { Dimension: productName, Role: #Category },
      { Dimension: regionName, Role: #Series }
    ]
  },

  PresentationVariant: {
    Visualizations : [ '@UI.LineItem', '@UI.Chart' ],
    SortOrder      : [ { Property: revenue, Descending: true } ]
  },

  LineItem: [
    { Value: productName },
    { Value: regionName },
    { Value: customerName },
    { Value: orderDate },
    { Value: quantity },
    { Value: revenue, Criticality: revenueCriticality },
    { Value: discount }
  ]
};