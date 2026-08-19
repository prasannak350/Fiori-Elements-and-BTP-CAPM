using SalesService as service from '../../srv/service';

// For table card
annotate service.Orders with @(
    UI.LineItem #orders : [
        {
            $Type : 'UI.DataField',
            Value : customer,
            Label : 'Customer',
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Label : 'Status',
        },
        {
            $Type : 'UI.DataField',
            Value : orderDate,
            Label : 'OrderDate',
        },
    ]
);

annotate service.Products with @(
    // For table card
    UI.LineItem #productsTable : [
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'Name',
        },
        {
            $Type : 'UI.DataField',
            Value : price,
            Label : 'Price',
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'Stock',
        },
    ],

    // For List card
    UI.LineItem #productList : [
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'Product'
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'Stock'
        },
        {
            $Type : 'UI.DataField',
            Value : price,
            Label : 'Price'
        }
    ]
);

// for table card
annotate service.LowStockProducts with @(
    UI.LineItem #lowStock : [
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : stock
        },
        {
            $Type : 'UI.DataField',
            Value : price
        }
    ]
);


//for table card
annotate service.ExpensiveProducts with @(
    UI.LineItem #expensive : [
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : stock
        },
        {
            $Type : 'UI.DataField',
            Value : price
        }
    ]
);

// for table card
annotate service.CompletedOrders with @(
    UI.LineItem #completedOrders : [
        {
            $Type : 'UI.DataField',
            Value : customer
        },
        {
            $Type : 'UI.DataField',
            Value : status
        },
        {
            $Type : 'UI.DataField',
            Value : orderDate
        }
    ]
);

// SelectionVariant (Filtering Data) - Whenever you read Orders, automatically apply this filter.(status = open)
annotate service.Orders with @(
    UI.SelectionVariant #OpenOrders : {
        SelectOptions : [
            {
                PropertyName : status,
                Ranges : [
                    {
                        Sign : #I,
                        Option : #EQ,
                        Low : 'open'
                    }
                ]
            }
        ]
    }
);

// PresentationVariant (Sorting & Display)
annotate service.Products with @(
    UI.PresentationVariant #Expensive : {
        SortOrder : [
            {
                Property : price,
                Descending : true
            }
        ],
        MaxItems : 5
    },
);


// for analytical card
annotate service.RevenueByStatus with @(
    UI.Chart #RevenueChart : {
        ChartType : #Donut,
        Dimensions : [
            status
        ],
        Measures : [
            revenue
        ],

        DimensionAttributes : [
            {
                Dimension : status,
                Role : #Category
            }
        ],

        MeasureAttributes : [
            {
                Measure : revenue,
                Role : #Axis1
            }
        ]
    },

    UI.DataPoint #RevenueKPI : {
        Title : 'Total Revenue',
        Value : revenue
    }
);

annotate service.RevenueByStatus with @(
    Aggregation.ApplySupported : {
        Transformations : ['aggregate', 'groupby'],
        GroupableProperties : [status],
        AggregatableProperties : [
            {
                Property : revenue,
                DefaultAggregationMethod : #SUM
            }
        ]
    }
);

// all the below annotations doesn't show up here. it shows up in list report object page. but we are not able to navigate there
// object page
annotate service.Products with @(
    UI.DataPoint #Price : {
        Title : 'Price',
        Value : price
    },

    UI.DataPoint #Stock : {
        Value : stock,
        Criticality : criticality
    },

    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : stock
        }
    ],

    UI.FieldGroup #General : {
        Data : [
            {
                Value : name
            },
            {
                Value : stock
            },
            {
                Value : price
            }
        ]
    },

    UI.Facets : [
        {
            $Type:'UI.ReferenceFacet',
            Target:'@UI.FieldGroup#General',
            Label:'General'
        }
    ]
);

// not working
// Navigation to List report page
annotate service.Products with @(
    UI.Identification #Navigate : [
        {
            $Type : 'UI.DataFieldForIntentBasedNavigation',
            Label : 'Open Product',
            SemanticObject : 'Product',
            Action : 'display'
        }
    ]
);

