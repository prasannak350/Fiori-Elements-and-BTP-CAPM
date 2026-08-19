// this file got generated automatically while creating list rpeort application using SAP Fiori elements. 
// commenting  this file as these annotations are over writing the annotations which we have created in the srv/employee-service.cds file.


// using EmployeeService as service from '../../srv/employee-service';
// annotate service.Employees with @(
//     UI.FieldGroup #GeneratedGroup : {
//         $Type : 'UI.FieldGroupType',
//         Data : [
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'NAME',
//                 Value : NAME,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'EMAIL_ID',
//                 Value : EMAIL_ID,
//             },
//         ],
//     },
//     UI.Facets : [
//         {
//             $Type : 'UI.ReferenceFacet',
//             ID : 'GeneratedFacet1',
//             Label : 'General Information',
//             Target : '@UI.FieldGroup#GeneratedGroup',
//         },
//     ],
//     UI.LineItem : [
//         {
//             $Type : 'UI.DataField',
//             Label : 'Employee Name',
//             Value : NAME,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'Employee Email ID',
//             Value : EMAIL_ID,
//         },
//     ],
// );


// annotate service.Employees with {
//     DEPARTMENT @Common.ValueList : {
//         $Type : 'Common.ValueListType',
//         CollectionPath : 'Department',
//         Parameters : [
//             {
//                 $Type : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : DEPARTMENT_ID,
//                 ValueListProperty : 'ID',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'NAME',
//             },
//         ],
//     }
// };

