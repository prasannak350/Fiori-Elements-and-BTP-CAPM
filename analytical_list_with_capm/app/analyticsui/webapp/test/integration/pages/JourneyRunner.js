sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/sap/analyticsui/test/integration/pages/SalesAnalyticsList.gen",
	"com/sap/analyticsui/test/integration/pages/SalesAnalyticsObjectPage.gen"
], function (JourneyRunner, SalesAnalyticsListGenerated, SalesAnalyticsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/sap/analyticsui') + '/test/flp.html#app-preview',
        pages: {
			onTheSalesAnalyticsListGenerated: SalesAnalyticsListGenerated,
			onTheSalesAnalyticsObjectPageGenerated: SalesAnalyticsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

