const cds = require('@sap/cds');

module.exports = cds.service.impl(srv =>{

    srv.on('READ', 'Suppliers', async(req) =>{
        // connect to remote service
        const bp = await cds.connect.to('API_BUSINESS_PARTNER');
        console.log(`service - ${JSON.stringify(bp)}`);

        var ls_response = await bp.run(req.query);
        return ls_response;
    });
});