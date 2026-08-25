sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"bpui/test/integration/pages/BPEmailAdressesList.gen",
	"bpui/test/integration/pages/BPEmailAdressesObjectPage.gen"
], function (JourneyRunner, BPEmailAdressesListGenerated, BPEmailAdressesObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('bpui') + '/test/flpSandbox.html#bpui-tile',
        pages: {
			onTheBPEmailAdressesListGenerated: BPEmailAdressesListGenerated,
			onTheBPEmailAdressesObjectPageGenerated: BPEmailAdressesObjectPageGenerated
        },
        async: true
    });

    return runner;
});

