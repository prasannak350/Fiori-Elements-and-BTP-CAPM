const cds = require("@sap/cds");

// Implement the action button - Mark Restocked
module.exports = cds.service.impl(async function () {
    const { Products } = this.entities;

    this.on("markRestocked", async (req) => {
        console.log(req.params);
        const ID = req.params[0].ID;
        await UPDATE(Products)
            .set({
                stock: 100,
                status_code: "A",
                statusCriticality: 3
            })
            .where({ ID });
        return;

    });

});