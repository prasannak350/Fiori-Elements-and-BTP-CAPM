sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/sap/authorslistview/test/integration/pages/AuthorsList.gen",
	"com/sap/authorslistview/test/integration/pages/AuthorsObjectPage.gen"
], function (JourneyRunner, AuthorsListGenerated, AuthorsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/sap/authorslistview') + '/test/flp.html#app-preview',
        pages: {
			onTheAuthorsListGenerated: AuthorsListGenerated,
			onTheAuthorsObjectPageGenerated: AuthorsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

