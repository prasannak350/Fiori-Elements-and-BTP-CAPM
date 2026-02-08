namespace btp.c;

// For Table ? - entity
// For view ? - entity + cds persistence exists

using { cuid } from '@sap/cds/common';

entity Assessments: cuid{
    AgendaId: String(30);
    Agenda: String(50) @mandatory;
    StartDate : Date @mandatory;
    EndDate : Date @mandatory;
    DueDate : Date @mandatory;
    DaysPlanned: Integer @assert.range:[7,21];

    // if we give virtual, fields will not be stored in database and it will be calculated by custom logic and it is only read only
    virtual OverallStatus : String(50);
    virtual OverallStatusCriticality: Integer;
    IsObsolete: Boolean;
    ReasonComment: String(50);
}




// Structure
@cds.persistence.skip
// do not create a persistence layer for this. we will give the data whenever requested
entity OUTPUT_DATA{
    key ID: String(36);
    COLUMN1: String(255);
    COLUMN2: String(255);
    COLUMN3: String(255);
} 

// Media entity
entity MediaFile: cuid{

    @Core.MediaType : mediaType
    content: LargeBinary;

    @Core.IsMediaType : true
    mediaType: String;

    @Core.ContentDisposition.Filename: fileName
    fileName: String;
}