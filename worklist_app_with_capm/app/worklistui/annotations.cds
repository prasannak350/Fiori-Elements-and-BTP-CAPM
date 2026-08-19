using WorklistService as service from '../../srv/service';
annotate service.Products with @(

    UI.SelectionFields : [
        status_code,
        name
    ],
    
    UI.HeaderInfo : {
        TypeName : 'Product',
        TypeNamePlural : 'Products',
        Title : { Value : name },
        Description : { Value : description }
    },


    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'currency',
                Value : currency,
            },
            {
                $Type : 'UI.DataField',
                Label : 'stock',
                Value : stock,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status',
                Value : status_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'createdAt',
                Value : createdAt,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Stock',
            Value : stock,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : status_code,
            Criticality: statusCriticality
        }
    ],

    UI.Identification : [
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'WorklistService.markRestocked',
            Label  : 'Mark Restocked'
        }
    ],

    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#Header'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.DataPoint#Stock'
        }
    ],

    UI.FieldGroup #Header : {
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Price',
                Value : price
            },
            {
                $Type : 'UI.DataField',
                Label : 'Stock',
                Value : stock
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : status_code,
                Criticality : statusCriticality
            }
        ]
    },

    UI.DataPoint #Stock : {
        Title : 'Stock',
        Value : stock,
        Criticality : statusCriticality
    }
);

// adds currency also to the Price column
annotate service.Products with {
    price    @Measures.ISOCurrency : currency;
};

// status gets a value help
annotate service.Products with {

    status @Common.Text : status.text;
    status @Common.TextArrangement : #TextLast;

    status @Common.ValueList: {
        CollectionPath : 'StatusCodes',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',       // When the user selects a row from the value help, copy the code value into the status field of the Product.
                LocalDataProperty : status,
                ValueListProperty : 'code'
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',   // Show this column in the Value Help dialog, but don't save it.It only helps the user choose.
                ValueListProperty : 'text'
            }
        ]
    };

};