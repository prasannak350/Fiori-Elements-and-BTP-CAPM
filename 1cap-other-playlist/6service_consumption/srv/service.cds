// using {API_BUSINESS_PARTNER as s4} from './external/API_BUSINESS_PARTNER.csn';

// service BusinessService {
//     entity A_BusinessPartner as projection on s4.A_BusinessPartner{
//         key BusinessPartner, Customer, BusinessPartnerFullName, BusinessPartnerGrouping, BusinessPartnerUUID, OrganizationBPName1
//     }
// }

// code for another video

using {sap.ui.riskmanagement as db} from '../db/schema';
@path: 'service/risk'
service RiskService{
    entity Risks as projection on db.Risks;
    entity Mitigations as projection on db.Mitigations;
    entity Suppliers as projection on db.Suppliers;
}