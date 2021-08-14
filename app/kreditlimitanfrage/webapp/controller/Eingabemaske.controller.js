sap.ui.define([
	"./BaseController",
	"sap/ui/model/json/JSONModel",
	"../model/formatter",
	"sap/ui/model/Filter",
	"sap/ui/model/FilterOperator"
], function (BaseController, JSONModel, formatter, Filter, FilterOperator) {
	"use strict";

	return BaseController.extend("ns.kreditlimitanfrage.controller.Eingabemaske", {

		formatter: formatter,

		/* =========================================================== */
		/* lifecycle methods                                           */
		/* =========================================================== */

		onInit : function () {
			this.getView().byId("input_name").setValue("Lindner Group KG");
			this.getView().byId("input_kundennr").setValue("3");
		},

        /**
         * Event Handler for sending the User Input to the CAM System
         */
        sendCAM : function() {
            var name = this.getView().byId("input_name").getValue();
			var kundennr = this.getView().byId("input_kundennr").getValue();
            var limithoehe = this.getView().byId("input_limithoehe").getValue();
            var befristung = this.getView().byId("picker_befristung").getValue();
            var bemerkung = this.getView().byId("area_bemerkung").getValue();
			var rating;
			var status;
			
			var kundennummerStart = kundennr.charAt(0);

			if(kundennr == "" || limithoehe == "" || befristung == "")
			{
				alert("Bitte füllen Sie alle Felder aus!");
			}
			else if(isNaN(kundennr))
			{
				alert("Bitte überprüfen Sie die Eingabe!");
			}
			else{
				// Limit voll genehmigt
				if( kundennummerStart == '0' || kundennummerStart == '1' || kundennummerStart == '2' )
				{
					status = "genehmigt";
					rating = "BB+"
				}
				// Limit zur Hälfte genehmigt
				else if( kundennummerStart == '3' || kundennummerStart == '4' || kundennummerStart == '5' )
				{
					status = "genehmigt";
					limithoehe = Long.parseLong(limithoehe) / 2;
					rating = "C-"
				}
				// Limit in Bearbeitung
				else if( kundennummerStart == '6' || kundennummerStart == '7' )
				{
					status = "in Bearbeitung";
					limithoehe = 0;
					rating = "B+"
				}
				// Limit abgelehnt
				else if( kundennummerStart == '8' || kundennummerStart == '9' )
				{
					status = "abgelehnt";
					limithoehe = 0;
					rating = "D"
				}
				// Limit voll genehmigt mit AA+
				else
				{
					Status = "genehmigt";
					Limit = Limit;
					rating = "AA+"
				} 

				var testJSON = JSON.stringify([rating, befristung, limithoehe, bemerkung, status, kundennr]);

				
				//Bestätigung
				alert("Anfrage erfolgreich an CAM gesendet!");

				// Senden an Worklist + Reload
				var oRouter=sap.ui.core.UIComponent.getRouterFor(this);             
				oRouter.navTo("worklist");
				location.reload();
			}
        },
       
		/**
		 * Event handler for navigating back.
		 * Navigate back in the browser history
		 * @public
		 */
		onNavBack : function() {
			// eslint-disable-next-line sap-no-history-manipulation
			history.go(-1);
		},

		/**
		 * Event handler for aborting.
		 * Navigate back to the start
		 * @public
		 */
		Abort : function() {
			var oRouter=sap.ui.core.UIComponent.getRouterFor(this);             
			oRouter.navTo("worklist");
			location.reload();
		},
	
		/* =========================================================== */
		/* internal methods                                            */
		/* =========================================================== */
	});
});