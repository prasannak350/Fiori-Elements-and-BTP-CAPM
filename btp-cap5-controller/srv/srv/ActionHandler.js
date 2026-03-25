// we give this "MarkAsObsolete" after module.exports, to make it public
module.exports.MarkAsObsolete = async function(req){
    // Get the data ->
        // Assessment Key,
        // Input Reason comment

    var sAssessmentId = req.params[0].ID;
    var sReasonComment = req.data.Reason;
    
    // Update the DB -> can be done 2 ways
        //  Option 1 - UPDATE sql with tx.run

        //  Option 2 - Create a Database procedure and call DB procedure with data to perform this operation
    // Initialze the transaction
    const tx = cds.tx(req);

    // Define a query to call the procedure
    const sQuery = "CALL ST_MARK_AS_OBSOLETE(IN_ASSESSMENTID => ?, IN_REASONCOMMENT => ?)";
    // Execute the procedure
    const lr_procedure_call = await tx.run(sQuery,[sAssessmentId,sReasonComment]);

}