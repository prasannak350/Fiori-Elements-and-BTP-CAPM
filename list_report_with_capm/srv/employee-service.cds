using btp.emp as be from '../db/data_model';

service EmployeeService{
    entity Employees @(
        Capabilities:{
            InsertRestrictions : {
                $Type : 'Capabilities.InsertRestrictionsType',
                Insertable : true
            },
            UpdateRestrictions : {
                $Type : 'Capabilities.UpdateRestrictionsType',
                Updatable : true
            },
            DeleteRestrictions : {
                $Type : 'Capabilities.DeleteRestrictionsType',
                Deletable : true
            },
        },
    )
    as select from be.EMPLOYEE_REGISTERY
    actions{
        action PromoteEmployee();      // creating an action inside odata service -- this is bound action(attached to an entity and works on one specific record). 
                                        // Unbound Action → Works on the service as a whole.
    };
    annotate Employees with @odata.draft.enabled;


    // if we give read only then in the metadata it will show insertable, updatable and deletable as false at the end for this Department entity.
    @readonly entity Department as select from be.DEPARTMENT;
    annotate Department with @odata.draft.enabled;
}

annotate EmployeeService.Employees with @(
    UI:{

        // Filter bar
        SelectionFields  : [
            DEPARTMENT_ID
        ],

        // Table columns
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value: NAME,
                Importance : #High           // on smaller screens, importance high columns will be visible
            },
            {
                $Type : 'UI.DataField',
                Value: EMAIL_ID,
                Importance : #High
            },
            {
                $Type : 'UI.DataField',
                Value: DEPARTMENT_ID,
                Importance : #Medium
            },
            {
                $Type : 'UI.DataField',
                Value: STATUS,
                Criticality : STATUS_CRITICALITY,
                Importance : #High
            },
            {
                $Type : 'UI.DataField',
                Value: createdAt,
                Importance : #Low
            },
            {
                $Type : 'UI.DataField',
                Value: createdBy,
                Importance : #Low
            }
        ],

        // object page designing
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Employee',
            TypeNamePlural : 'Employees',
            Title : {
                Value : NAME
            },

            Description : {
                Value : EMAIL_ID
            }
        },

        HeaderFacets : [
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Employee Info',
                Target : '@UI.FieldGroup#Header'
            },
            {
                $Type : 'UI.ReferenceFacet',   //to see a KPI-style value in the Object Page header
                Label : 'Salary KPI',
                Target : '@UI.DataPoint#Salary'
            }
        ],

        FieldGroup #Header : {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : DESIGNATION
                },
                {
                    $Type : 'UI.DataField',
                    Value : PHONE
                }
            ]
        },

        DataPoint #Salary : {
            $Type : 'UI.DataPointType',
            Title : 'Monthly Salary',
            Value : SALARY,
        },

        Identification : [                  // which fields should appear as the primary business information on the Object Page
            {
                $Type : 'UI.DataField',
                Value : NAME
            },
            {
                $Type : 'UI.DataField',
                Value : EMAIL_ID
            },
            {
                $Type : 'UI.DataField',
                Value : DESIGNATION
            },
            {
                $Type : 'UI.DataField',
                Value : DEPARTMENT_ID
            },
            {
                $Type : 'UI.DataField',
                Value : STATUS
            },
            {
                $Type : 'UI.DataField',
                Value : SALARY
            },
            {
                $Type : 'UI.DataFieldForAction',                // to show action button on object page
                Action : 'EmployeeService.PromoteEmployee',
                Label : 'Promote'
            }
        ],

        Facets  : [
            {
                $Type : 'UI.ReferenceFacet',
                ID : 'JobInfo',
                Label : 'Job Information',
                Target : '@UI.Identification'
            },
            {
                $Type : 'UI.ReferenceFacet',
                ID : 'AdminData',
                Label : 'Administrative Data',
                Target : '@UI.FieldGroup#Admin'
            }
        ],

        FieldGroup #Admin : {
            $Type : 'UI.FieldGroupType',
            Data :[
                {
                    $Type : 'UI.DataField',
                    Value : createdAt
                },
                {
                    $Type : 'UI.DataField',
                    Value : createdBy
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedAt
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedBy
                }
            ]
        },
    }

)


//  Property annotations

{
    NAME        @title : 'Name';
    EMAIL_ID    @title : 'Email ID';
    PHONE       @(
        title : 'Phone',
        UI.Hidden                           // It will be hidden
    );
    DESIGNATION @title : 'Designation';
    SALARY      @(
        title : 'Salary',
        Common.FieldControl: #ReadOnly        //Now the salary field is visible but cannot be edited
    );
    STATUS      @title : 'Status';
    DEPARTMENT  @(
        title : 'Department',
        Common :{                
            Text : DEPARTMENT.NAME,                 // To display the department name instead of DEPARTMENT_ID
            TextArrangement : #TextOnly,
                     
            ValueList : {                             // added the value list inside Common annotation to the DEPARTMENT field to make it a value help field in the filter bar
                $Type : 'Common.ValueListType',
                CollectionPath : 'Department',
                Parameters : [
                    {
                        $Type : 'Common.ValueListParameterOutType',
                        LocalDataProperty : 'DEPARTMENT_ID',
                        ValueListProperty : 'ID'
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'NAME'
                    }
                ]
            },
        }
    );
}