namespace sap.ui.riskmanagement;
using {managed} from '@sap/cds/common';

entity Risks: managed{
    key ID: UUID @(Core.Computed: true);
    title: String(100);
    prio: String(5);
    descr: String;
    miti: Association to Mitigations;
    impact: Integer;
    criticality: Integer;
    supplierID: String;
}

entity Mitigations : managed {
    key ID: UUID @(Core.Computed: true);
    descripton: String;
    owner: String;
    timeline: String;
    risks: Association to many Risks on risks.miti = $self;

}


// defining one more entity to call the external service and associate it to "Risks" entity

using {API_BUSINESS_PARTNER as s4} from '../srv/external/API_BUSINESS_PARTNER';
entity Suppliers as projection on s4.A_BusinessPartner{
    key BusinessPartner as ID,
    BusinessPartnerFullName as fullName,
    BusinessPartnerIsBlocked as isBlocked
}