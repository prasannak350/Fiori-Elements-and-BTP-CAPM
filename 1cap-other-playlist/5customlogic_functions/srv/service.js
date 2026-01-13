const cds = require('@sap/cds');
const { INSERT } = require('@sap/cds/lib/ql/cds-ql');

module.exports=(srv) =>{
    const {Order} = srv.entities;
    srv.before("CREATE", Order, (req)=>{
        if(req.data.totalAmount <=0){
            req.error(400, "Total amount must be greater than 0");
        }
            req.data.status = "Pending";
    });
    srv.on("CREATE", Order, (req)=>{
        req.data.status = "Pending";
        return req.data;
    });

   //  when we see the data, status appears as "pending (Checked by system)"
    srv.after("READ", Order, (orders)=>{
        if(!Array.isArray(orders)) orders = [orders];
        orders.forEach((order)=>{
            order.status += " (Checked by system)";
        })
    });

    // functions
    // these will be visible along with entities in the run page
    srv.on('getStatus', async(req)=>{
        return{
            status: 'Process',
            Timestamp: new Date()
        }
    });

    srv.on('getOrders', async(req)=>{
        const { quantity } = req.data;

        // if (quantity <= 0) {
        //     req.error(400, 'Quantity must be greater than 0');
        // }

        // return await SELECT.from(Order).limit(quantity);

        const orders = await SELECT
        .from(Order)
        .limit(quantity)
        .orderBy({ ID: 'desc' });

        return `Fetched ${orders.length} orders successfully`;
    });


    // we can see the functions in the run page but we cant see the actions
    // to see them we have to give $metadata in the url path and then check in the run page
    // actions
    srv.on('PlaceBulkOrders', async(req) =>{
        const {quantity} = req.data;
        for(let i=0; i<quantity; i++){
            await cds.run(INSERT.into(Order).entries({totalAmount:50, status: "Pending"}));
        }
        return `${quantity} orders placed successfully`;
    });

    
    srv.on('CalculateDiscount', async(req) =>{
        const {total} = req.data;
        //  if value is greater than 100, give 10% percent discount or else 5%
        return total>100 ? total * 0.1 : total * 0.05;
    });
}