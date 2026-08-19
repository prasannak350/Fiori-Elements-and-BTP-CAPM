namespace btp.emp;

using { cuid,managed } from '@sap/cds/common';


entity EMPLOYEE_REGISTERY : cuid, managed {
    NAME : String(255);
    EMAIL_ID : String(255);
    PHONE      : String(20);
    DESIGNATION: String(100);
    SALARY     : Decimal(15,2);
    STATUS     : String(20);
    STATUS_CRITICALITY : Integer;
    DEPARTMENT : Association to one DEPARTMENT;
} 

entity DEPARTMENT : cuid{
    NAME : String(255);
    EMPLOYEES : Association to many EMPLOYEE_REGISTERY on EMPLOYEES.DEPARTMENT = $self;
}