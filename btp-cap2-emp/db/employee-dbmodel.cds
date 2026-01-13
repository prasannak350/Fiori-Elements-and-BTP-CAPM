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