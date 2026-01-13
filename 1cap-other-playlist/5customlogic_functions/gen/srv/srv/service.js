const cds = require('@sap/cds');

module.exports=(srv) =>{
    const {Order} = srv.entities;
    srv.before("CREATE", Order, (req)=>{
        if(req.data.totalAmount <=0){
            req.console.error(400, "Total amount must be greater than 0");
        }
        else{
            req.data.status = "Pending";
        }
    });
    srv.on("CREATE", Order, (req)=>{
        req.data.status = "Pending";
    });

   //  when we see the data, status appears as "pending (Checked by system)"
    srv.after("READ", Order, (orders)=>{
        if(!Array.isArray(orders)) orders = [orders];
        orders.forEach((order)=>{
            order.status += " (Checked by system)";
        })
    });
}