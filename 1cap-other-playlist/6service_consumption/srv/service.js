// const cds = require('@sap/cds');
// module.exports= cds.service.impl(async function (){
//     // send the request to remote service and read the data
//     const bp = await cds.connect.to('API_BUSINESS_PARTNER');
//     this.on('READ', 'A_BusinessPartner', async req=>{
//         // read the complete entity data
//         return bp.run(req.query);
//     } )
// })


// code for another video

// const cds = require('@sap/cds');
// module.exports= async function (srv) {
//     const remoteService = await cds.connect.to('API_BUSINESS_PARTNER');
//     srv.on('READ', 'Suppliers', async req=>{
//         // read the complete entity data
//         return remoteService.run(req.query);
//     } )
// }

// association between local service and remote service.  --- not working - getting error
const cds = require('@sap/cds');
const { SELECT } = require('@sap/cds/lib/ql/cds-ql');
module.exports= async function (srv) {
    const remoteService = await cds.connect.to('API_BUSINESS_PARTNER');
    srv.on('READ', 'Suppliers', async req=>{
        return await remoteService.run(req.query);
    });
    srv.on('READ', 'Risks', async req=>{
        // to run sql queries
        const risks = await cds.tx(req).run(SELECT.from('Risks'))
        if(!risks || risks.length === 0){
            console.warn("no risks found in database");
        }
        console.log("Fetched Risks:", risks);
        const suppliersData = await remoteService.run(SELECT.from('A_BusinessPartner'))
        if(!suppliersData || suppliersData.length === 0){
            console.warn("No Suppliers found from API");
        }
        console.log("Fetched Supplers:", suppliersData);
        return risks.map(risk =>{
            const supplier = suppliersData.find(s => s.BusinessPartner === risk.supplierID);
            // updating the data present in Suppliers entity to Risks entity by using associations
            return {
                ID: risk.ID,
                title: risk.title,
                impact: risk.impact,
                criticality: risk.criticality,
                supplierName: supplier? supplier.BusinessPartnerFullName : 'Unknown',
                isBlocked: supplier? supplier.BusinessPartnerIsBlocked : false

            }
        })
    })
}