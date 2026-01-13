using emp.app as ea from '../db/employee-dbmodel';

service Employeeservice{

    @odata.draft.enabled 
    // shows all capabilities- create, read, update, delete for V4 service if the draft is enabled    &    one more search field will also be added - 'Editing Status' in the app preview
    entity Employees as select from ea.EMPLOYEE;

    @odata.draft.enabled
    entity Departments as select from ea.DEPARTMENT;
}


// annotations
annotate Employeeservice.Employees with @(
    // design level annotation comes here 
    //  with this code, we can see all these columns by default during the page run (no need to select from personalization settings)
    UI:{
        // Coulumns
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value: NAME
            },
            {
                $Type : 'UI.DataField',
                Value: EMAIL_ID
            },
            {
                $Type : 'UI.DataField',
                Value: DEPARTMENT
            },
            {
                $Type : 'UI.DataField',
                Value: createdAt
            },
            {
                $Type : 'UI.DataField',
                Value: createdBy
            }
        ],

        // Facets / grouped data for the end user to enter
        //  When we click on create option, these field groups will be displayed as facets
        FieldGroup #BasicData : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value: NAME
                },
                {
                    $Type : 'UI.DataField',
                    Value: EMAIL_ID
                },
                {
                    $Type : 'UI.DataField',
                    Value: DEPARTMENT
                },
            ]
        },
        FieldGroup #Admin : {
            $Type : 'UI.FieldGroupType',
            Data: [
                {
                    $Type : 'UI.DataField',
                    Value: createdAt
                },
                {
                    $Type : 'UI.DataField',
                    Value: createdBy
                },
                {
                    $Type : 'UI.DataField',
                    Value: modifiedAt
                },
                {
                    $Type : 'UI.DataField',
                    Value: modifiedBy
                },
            ]
        },

        // club both of them as facets
        Facets  : [
            {
                $Type: 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#BasicData',
                Label: 'Basic Data',
                ID: 'idBasicData'
            },
            {
                $Type: 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#Admin',
                Label: 'Admin Data',
                ID: 'idAdminData'
            }
        ],
    }
)
{
    // property level annotation comes here
    EMAIL_ID @title : 'Email Id';
    DEPARTMENT @title : 'Department';
}