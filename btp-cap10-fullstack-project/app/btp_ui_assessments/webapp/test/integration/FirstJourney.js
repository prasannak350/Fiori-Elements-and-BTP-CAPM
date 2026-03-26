sap.ui.define([
    "sap/ui/test/opaQunit",
    "./pages/JourneyRunner"
], function (opaTest, runner) {
    "use strict";

    function journey() {
        QUnit.module("First journey");

        opaTest("Start application", function (Given, When, Then) {
            Given.iStartMyApp();

            Then.onTheAssessmentsList.iSeeThisPage();
            Then.onTheAssessmentsList.onTable().iCheckColumns(5, {"DESCRIPTION":{"header":"Purpose"},"START_DATE":{"header":"Start Date"},"END_DATE":{"header":"End Date"},"createdBy":{"header":"{i18n>CreatedBy}"},"createdAt":{"header":"{i18n>CreatedAt}"}});

        });


        opaTest("Navigate to ObjectPage", function (Given, When, Then) {
            // Note: this test will fail if the ListReport page doesn't show any data
            
            When.onTheAssessmentsList.onFilterBar().iExecuteSearch();
            
            Then.onTheAssessmentsList.onTable().iCheckRows();

            When.onTheAssessmentsList.onTable().iPressRow(0);
            Then.onTheAssessmentsObjectPage.iSeeThisPage();

        });

        opaTest("Teardown", function (Given, When, Then) { 
            // Cleanup
            Given.iTearDownMyApp();
        });
    }

    runner.run([journey]);
});