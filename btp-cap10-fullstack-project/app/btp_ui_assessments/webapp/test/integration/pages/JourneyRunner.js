sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"btpuiassessments/test/integration/pages/AssessmentsList",
	"btpuiassessments/test/integration/pages/AssessmentsObjectPage",
	"btpuiassessments/test/integration/pages/ObservationsObjectPage"
], function (JourneyRunner, AssessmentsList, AssessmentsObjectPage, ObservationsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('btpuiassessments') + '/test/flp.html#app-preview',
        pages: {
			onTheAssessmentsList: AssessmentsList,
			onTheAssessmentsObjectPage: AssessmentsObjectPage,
			onTheObservationsObjectPage: ObservationsObjectPage
        },
        async: true
    });

    return runner;
});

