sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/sap/bookstorelistview/test/integration/pages/BooksList.gen",
	"com/sap/bookstorelistview/test/integration/pages/BooksObjectPage.gen"
], function (JourneyRunner, BooksListGenerated, BooksObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/sap/bookstorelistview') + '/test/flp.html#app-preview',
        pages: {
			onTheBooksListGenerated: BooksListGenerated,
			onTheBooksObjectPageGenerated: BooksObjectPageGenerated
        },
        async: true
    });

    return runner;
});

