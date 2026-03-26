using btp.bp as bp from '../db/data-model';

service ConsumptionService{
    entity Orders as select from bp.ORDERS;

    entity Suppliers as select from bp.Suppliers;
}