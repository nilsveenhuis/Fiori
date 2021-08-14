/* global QUnit */
QUnit.config.autostart = false;

sap.ui.getCore().attachInit(function () {
	"use strict";

	sap.ui.require([
		"ns/kreditlimitanfrage/test/unit/AllTests"
	], function () {
		QUnit.start();
	});
});
