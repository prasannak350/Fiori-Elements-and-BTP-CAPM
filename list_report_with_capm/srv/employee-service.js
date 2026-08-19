const cds = require("@sap/cds");

// Implement the action button - Promote
module.exports = cds.service.impl(function () {

    this.on('PromoteEmployee', 'Employees', async (req) => {

        const employee = req.params[0];
        console.log("Employee promoted :", employee.ID);

        req.info("Employee promoted successfully");

    });

});