using btp.demo as bd from '../db/data-model';

//to create service
service EmployeeService{
    // expose it as an entity whose name is Employee
    entity Employees as select from bd.EMPLOYEE_REGISTRY;
}

// @cds.persistence.exists -- creates a view

// @cds.persistence.skip -- creates a structure