namespace btp.fs;

using {cuid,managed} from '@sap/cds/common';

entity ASSESSMENTS: cuid, managed{
    DESCRIPTION: String(255);
    START_DATE: Date;
    END_DATE: Date;
    CATEGORY: String(50);

    Observations: Composition of many OBSERVATIONS on Observations.ASSESSMENTS = $self;
    // compose all observations where ASSESSMENTS_ID from observations entity is matching with primary key of entity Assessments
    // so we write it like Observations.ASSESSMENTS = $self
    ObservationsMaster: Association to many OBSERVATION_MASTER on ObservationsMaster.CATEGORY = CATEGORY;
    // we give associaton here because OBSERVATION_MASTER can exist even without Assessments entity
}

entity OBSERVATIONS: cuid, managed{
    DESCRIPTION: String(255);
    IS_CRITICAL: Boolean;

    ASSESSMENTS: Association to one ASSESSMENTS;
    // new column called ASSESSMENTS_ID will be created
}

// Composition and Association will be converted as Navigation in metadata service. 
// If the navigation mentioned is having a relationship called many, then it will be created as a collection


// some master data might be created before itself
// and it exists even without ASSESSMENTS
entity OBSERVATION_MASTER : cuid{
    CATEGORY: String(50);
    DESCRIPTION: String(255);
}