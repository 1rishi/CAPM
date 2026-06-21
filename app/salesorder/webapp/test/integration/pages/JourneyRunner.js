sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"salesorder/test/integration/pages/SalesOrderHeaderList",
	"salesorder/test/integration/pages/SalesOrderHeaderObjectPage",
	"salesorder/test/integration/pages/SalesOrderItemObjectPage"
], function (JourneyRunner, SalesOrderHeaderList, SalesOrderHeaderObjectPage, SalesOrderItemObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('salesorder') + '/test/flpSandbox.html#salesorder-tile',
        pages: {
			onTheSalesOrderHeaderList: SalesOrderHeaderList,
			onTheSalesOrderHeaderObjectPage: SalesOrderHeaderObjectPage,
			onTheSalesOrderItemObjectPage: SalesOrderItemObjectPage
        },
        async: true
    });

    return runner;
});

