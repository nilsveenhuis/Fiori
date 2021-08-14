using MyService from './cam-service';

annotate MyService.Kunde with {
	KundenID	@title: 'KundenID';
	Name      	@title: 'Name';
	Strasse     @title: 'Strasse';
	Hausnummer  @title: 'Hausnummer';
	Ort        	@title: 'Ort';
	PLZ      	@title: 'PLZ';
	Rating		@title: 'Rating';
}

annotate MyService.Kreditlimit with {
	ID @(
		UI.Hidden,
		Common: {
		Text: description
		}
	);
	KreditlimitID  @title: 'KreditlimitID';
	Befristung     @title: 'Befristung';
	Hoehe     	   @title: 'Hoehe';
	Bemerkung      @title: 'Bemerkung';
	Status		   @title: 'Status';
}

annotate MyService.Kunde with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Kunde',
			TypeNamePlural: 'Kunden',
			Title          : {
                $Type : 'UI.DataField',
                Value : kreditlimit.Hoehe
            },
			Description : {
				$Type: 'UI.DataField',
				Value: Name
			},
		},
		//Suchfeld
		//Spalten, die angezeigt werden sollen
		SelectionFields: [Name],
		LineItem: [
			{Value: KundenID},
			{Value:	Name},
			{Value:	Strasse},
			{Value:	Hausnummer},
			{Value:	Ort},
			{Value:	PLZ},
			{Value:	Rating}
			
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'Übersicht', Target: '@UI.FieldGroup#Main'}
		],
		FieldGroup#Main: {
			Data: [
				{Label: 'KreditlimitID', Value: kreditlimit.KreditlimitID},
				{Label: 'Status', Value: kreditlimit.Status},
				{Label: 'Befristung', Value: kreditlimit.Befristung},
				{Label: 'Kundenrating', Value: Rating}
			]
		}
	},
) {

};

annotate MyService.Kreditlimit with {
	miti @(
		Common: {
			//show text, not id for mitigation in the context of risks
			Text: miti.description  , TextArrangement: #TextOnly,
			ValueList: {
				Label: 'Mitigations',
				CollectionPath: 'Mitigations',
				Parameters: [
					{ $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: miti_ID,
						ValueListProperty: 'ID'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'description'
					}
				]
			}
		}
	);
}
