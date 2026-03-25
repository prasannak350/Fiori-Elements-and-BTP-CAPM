const cds = require('@sap/cds');
// to connect the action handler file
const lo_actionHandler = require('./ActionHandler');

module.exports = cds.service.impl(srv => {

    // Implementing the action handler
    // we can implement it here or create a new file.js and do it there and connect it here
    srv.on('MarkAsObsolete', lo_actionHandler.MarkAsObsolete);

    // Event handlers
    srv.on('READ', 'OutputData', async(req, next)=>{

        // Trigger a select query on DB table via controller

        // step 1 - connect to the DB table
        const {Assessments} = cds.entities('btp.c');

        // step 2 - Initialize the transaction
        const tx = cds.tx(req);

        // select the data
        // to resolve the promise which is needed to execute the next statement, we will give await and for this to work we have to mention async for the function above
        const aAssessments = await tx.run(
            SELECT .from(Assessments)
        );

        var aJSONOutput = [];
        aAssessments.forEach(item=>{
            aJSONOutput.push({
                "ID": item.ID,
                "COLUMN1": item.AgendaId,
                "COLUMN2": item.Agenda,
                "COLUMN3": "Dummy data"
            });
        });

        return aJSONOutput;
        // if(1 == 1){
        //     console.log("On Handler");
        //     return [];
        // }
        // else{
        //     return next(); // default execution path will continue
        // }
    })

    srv.before('READ', 'OutputData', (req)=>{
        console.log("Before Handler");
    })

    srv.after('READ', 'OutputData', (data, req)=>{
        console.log("After Handler");
    })

    //  custom validations

    srv.before('CREATE', 'Assessments', (req)=>{
        if(req.data.StartDate > req.data.EndDate){
            req.error({
                code: 501,
                message: "End date cannot be earlier than start date",
                target: 'in/EndDate'
            });
        }
        if(req.data.DueDate < req.data.StartDate){
            req.error({
                code: 501,
                message: "Due date cannot be earlier than start date",
                target: 'in/DueDate'
            });
        }

        // now add the correct ID to my agenda
        req.data.AgendaId = 'AGENDA_01';
    })

    // custom handler READ - after to get the virtual fields info
    srv.after('READ', 'Assessments', (data, req)=>{
        console.log(data);

        // Manipulate the data
        data.forEach(item=>{
            let ls_status_info = _CalculateStatus(item);
            item.OverallStatus = ls_status_info.OverallStatus;
            item.OverallStatusCriticality = ls_status_info.OverallStatusCriticality;
        })
    })

})

function _CalculateStatus(data){
    if(!data.StartDate || !data.EndDate || !data.DueDate){
        return{"OverallStatus" : "In Preparation", "OverallStatusCriticality" : 0};
    }
    else{
        let lv_today = new Date();                  lv_today.setHours(0,0,0,0);   // no need of hours, mins, seconds, milli seconds. so set them to zero
        let lv_dueDate = new Date(data.DueDate);    lv_dueDate.setHours(0,0,0,0);
        return(lv_dueDate < lv_today) ? {"OverallStatus" : "OverDue", "OverallStatusCriticality" : 1} : {"OverallStatus" : "On Track", "OverallStatusCriticality" : 3};
    }
}