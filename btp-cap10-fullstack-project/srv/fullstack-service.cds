using btp.fs as fs from '../db/data-model';

@requires: 'authenticated-user'  // it asks for credentials to view the page
service FullStackService{

    @odata.draft.enabled
    entity Assessments as select from fs.ASSESSMENTS;

    entity Observations as select from fs.OBSERVATIONS;

    entity MasterObservations as select from fs.OBSERVATION_MASTER;
}

annotate FullStackService.Assessments with @(
    UI : {
        // this line of code builds my list report/ table
        LineItem  : [
            {
                $Type: 'UI.DataField',
                Value: DESCRIPTION
            },
            {
                $Type: 'UI.DataField',
                Value: START_DATE
            },
            {
                $Type: 'UI.DataField',
                Value: END_DATE
            },
            {
                $Type: 'UI.DataField',
                Value: createdBy
            },
            {
                $Type: 'UI.DataField',
                Value: createdAt
            }
        ],

        // Field group
        FieldGroup #BasicData : {
            $Type : 'UI.FieldGroupType',
            Data :[
                {
                    $Type: 'UI.DataField',
                    Value: DESCRIPTION
                },
                {
                    $Type: 'UI.DataField',
                    Value: START_DATE
                },
                {
                    $Type: 'UI.DataField',
                    Value: END_DATE
                },
                {
                    $Type: 'UI.DataField',
                    Value: createdBy
                },
                {
                    $Type: 'UI.DataField',
                    Value: createdAt
                },
                {
                    $Type: 'UI.DataField',
                    Value: modifiedBy
                },
                {
                    $Type: 'UI.DataField',
                    Value: modifiedAt
                }
            ]
        },

        // Facets
        Facets  : [
            {
                $Type: 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#BasicData',
                Label: 'Assessments Data',
                ID: 'idBasicData'
            },
            {
                $Type: 'UI.ReferenceFacet',
                Target: 'Observations/@UI.LineItem',
                Label: 'Observations',
                ID: 'idObsData'
            }
        ],
    }
){
    ID @UI : { Hidden };
    DESCRIPTION @title : 'Purpose';
    START_DATE @title : 'Start Date';
    END_DATE @title : 'End Date';
}

annotate FullStackService.Observations with @(
    UI: {
        LineItem  : [
            {
                $Type: 'UI.DataField',
                Value: DESCRIPTION
            },
            {
                $Type: 'UI.DataField',
                Value: IS_CRITICAL
            },
            {
                $Type: 'UI.DataField',
                Value: createdBy
            },
            {
                $Type: 'UI.DataField',
                Value: createdAt
            }
        ],
        // field group
        FieldGroup #BasicDataObs : {
            $Type : 'UI.FieldGroupType',
            Data :[
                {
                    $Type: 'UI.DataField',
                    Value: DESCRIPTION
                },
                {
                    $Type: 'UI.DataField',
                    Value: IS_CRITICAL
                }
            ]
        },

        // facets
        Facets  : [
            {
                $Type: 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#BasicDataObs',
                Label: 'Basic Data',
                ID: 'idBasicDataObs'
            }
        ],
    }
){
    ID @UI.Hidden;
    DESCRIPTION @title : 'Observation';
    IS_CRITICAL @title : 'Is Critical?';
}