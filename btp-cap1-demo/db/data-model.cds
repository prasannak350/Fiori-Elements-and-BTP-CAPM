namespace btp.demo;

// to create any table
entity EMPLOYEE_REGISTRY {              // table will be visible as BTP_DEMO_EMPLOYEE_REGISTRY
    key ID       : String(30);
        NAME     : String(50);
        EMAIL_ID : String(255);
}
