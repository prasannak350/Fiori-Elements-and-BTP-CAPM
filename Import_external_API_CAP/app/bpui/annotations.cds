using BPEmailAdresses as service from '../../srv/service-api';
annotate service.BPEmailAdresses with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'AddressID',
                Value : AddressID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Person',
                Value : Person,
            },
            {
                $Type : 'UI.DataField',
                Label : 'OrdinalNumber',
                Value : OrdinalNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'IsDefaultEmailAddress',
                Value : IsDefaultEmailAddress,
            },
            {
                $Type : 'UI.DataField',
                Label : 'EmailAddress',
                Value : EmailAddress,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SearchEmailAddress',
                Value : SearchEmailAddress,
            },
            {
                $Type : 'UI.DataField',
                Label : 'AddressCommunicationRemarkText',
                Value : AddressCommunicationRemarkText,
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
            Label : 'OrdinalNumber',
            Value : OrdinalNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Person',
            Value : Person,
        },
        {
            $Type : 'UI.DataField',
            Label : 'AddressID',
            Value : AddressID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'IsDefaultEmailAddress',
            Value : IsDefaultEmailAddress,
        },
        {
            $Type : 'UI.DataField',
            Label : 'EmailAddress',
            Value : EmailAddress,
        },
    ],
);

