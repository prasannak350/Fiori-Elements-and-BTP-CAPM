using bookstore.db as db from '../db/schema';

service BookStore {

    @(restrict: [                            // AUthorization for Books entity
        {
            grant :[
                'READ', 'WRITE'
            ],
            to :'admin'
        },
        {
            grant :[
                'READ'
            ],
            to :'only-read-access'
        }
    ])

    entity Books as projection on db.Books actions{    // BOUND actions - only related to Books entity
        // usally whenever we perform any actions, we have to refresh the page to reflect them in the application. But if we add "common.sideEffects", we don't have to refresh the page
        @(Common.SideEffects:{TargetProperties:['stock']})
        action addStock();      
        action changePublishDate(newDate: Date);   // standard parameters like date
        // action changeStatus(newStatus: String);    // custom parameters

        // adding annotations to display values in dropdown
        @(Common.SideEffects:{TargetProperties:['status_code']})
        action changeStatus(@(Common: {
            ValueListWithFixedValues: true,
            Label : 'New Status',
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath: 'BookStatus',
                Parameters :[{
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty: newStatus,
                    ValueListProperty : 'code'
                }]
            },
        })
        newStatus: String);
    };

    // to target whole entity
    @(Common.SideEffects:{TargetEntities:['/BookStore.EntityContainer/Books']})

    @(requires: 'user-for-actions')  // restricting the addDiscount action to only particular user

    action addDiscount();   // UNBOUND action - bounded to whole service

    entity Authors as projection on db.Authors;
    entity Chapters as projection on db.Chapters;
    entity BookStatus as projection on db.BookStatus;
    entity GenresVH as projection on db.Genres;
}

annotate BookStore.Books with @odata.draft.enabled;

annotate BookStore.Authors with @(
    odata.draft.enabled,
    requires : 'admin'                // Authentication
);  