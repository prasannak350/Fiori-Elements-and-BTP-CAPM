using btp.c as b from '../db/data-model';

service MyControllerService @(impl: './controller-service2.js'){

    @odata.draft.enabled
    entity Assessments as select from b.Assessments
    // actions
    actions {
        action MarkAsObsolete(
            Reason : String(50)
        )
    };


    @readonly
    entity OutputData as select from b.OUTPUT_DATA;

    entity MediaFile as select from b.MediaFile;
}

annotate MyControllerService.Assessments with @(
   UI:{
    LineItem  : [
        {
            $Type: 'UI.DataField',
            Value: AgendaId
        },
        {
            $Type: 'UI.DataField',
            Value: Agenda
        },
        {
            $Type: 'UI.DataField',
            Value: StartDate
        },
        {
            $Type: 'UI.DataField',
            Value: EndDate
        },
        {
            $Type: 'UI.DataField',
            Value: DueDate
        },
        {
            $Type: 'UI.DataField',
            Value: DaysPlanned
        },
        {
            $Type: 'UI.DataField',
            Value: OverallStatus,
            Criticality: OverallStatusCriticality
        },
        {
            $Type: 'UI.DataField',
            Value: IsObsolete
        },
        {
            $Type: 'UI.DataField',
            Value: ReasonComment
        },

        // It will be created like an action on the top of the table
        {
            $Type: 'UI.DataFieldForAction',
            Action: 'MyControllerService.MarkAsObsolete',
            Label: 'Mark As Obsolete'
        }
    ],

    //  Field Group
    FieldGroup #BasicData : {
        $Type : 'UI.FieldGroupType',
        Data :[
            {
                $Type: 'UI.DataField',
                Value: Agenda
            },
            {
                $Type: 'UI.DataField',
                Value: StartDate
            },
            {
                $Type: 'UI.DataField',
                Value: EndDate
            },
            {
                $Type: 'UI.DataField',
                Value: DueDate
            },
            {
                $Type: 'UI.DataField',
                Value: DaysPlanned
            },
            {
                $Type: 'UI.DataField',
                Value: OverallStatus,
                Criticality: OverallStatusCriticality
            }
        ],
    },

    // Facets

        Facets:[
            {
                $Type: 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#BasicData',
                Label: 'Basic Data',
                ID: 'idBasicData'
                
            }
        ]
   }
){
    AgendaId @title: 'Agenda ID';
    Agenda @title : 'Agenda';
    StartDate @title : 'Start Date';
    EndDate @title : 'End Date';
    DueDate @title : 'Due Date';
    DaysPlanned @title : 'Days Planned';
    IsObsolete @title: 'Obsolete?';
    ReasonComment @title : 'Reason Comment';

};
