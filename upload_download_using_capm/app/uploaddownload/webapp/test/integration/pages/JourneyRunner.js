sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/sap/uploaddownload/test/integration/pages/DocumentsList.gen",
	"com/sap/uploaddownload/test/integration/pages/DocumentsObjectPage.gen"
], function (JourneyRunner, DocumentsListGenerated, DocumentsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/sap/uploaddownload') + '/test/flp.html#app-preview',
        pages: {
			onTheDocumentsListGenerated: DocumentsListGenerated,
			onTheDocumentsObjectPageGenerated: DocumentsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

