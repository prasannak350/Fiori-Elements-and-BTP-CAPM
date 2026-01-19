namespace emp.app;
using { cuid,managed } from '@sap/cds/common';


entity EMPLOYEE : cuid,managed{
    // key ID: String(36);
    NAME: String(255) @title : 'Name'; // Annotations
    EMAIL_ID: String(255);
    DEPARTMENT: String(30);
}

entity DEPARTMENT : cuid{
    NAME: String(255);
}

// connecting the synonym
@cds.persistence.exists
// we give it to say that it already exists in the system and system wont create this entity when we build the project
entity CENTRALEMPLOYEES : cuid,managed{
    NAME: String(255);
    EMAIL_ID: String(255);
    DEPARTMENT: String(30);
}