sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"btpuiemployee/test/integration/pages/EmployeesList.gen",
	"btpuiemployee/test/integration/pages/EmployeesObjectPage.gen"
], function (JourneyRunner, EmployeesListGenerated, EmployeesObjectPageGenerated) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('btpuiemployee') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesListGenerated: EmployeesListGenerated,
			onTheEmployeesObjectPageGenerated: EmployeesObjectPageGenerated
        },
        async: true
    });

    return runner;
});

