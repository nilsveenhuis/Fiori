namespace odata_service_cam;

entity Zusammenfassung{
    key ZusammenfassungID  : String   @title : 'Kundennummer';
        Name    : String  @title : 'Name';
        Erstellungsdatum: String @title : 'Erstellungsdatum';
        Rating: String @title : 'Rating';
        Strasse: String @title : 'Straße';
        Hausnummer: String @title : 'Hausnummer';
        PLZ: String @title : 'PLZ';
        Ort:String @title : 'Ort';
        Vorname: String @title : 'Vorname';
        Nachname: String @title : 'Nachname';
        Befristung: String @title : 'Befristung';
        Hoehe: String @title : 'Höhe';
        Bemerkung: String @title : 'Bemerkung';
        Status: String @title : 'Status';


}

entity Kunde {
    key KundenID       : Integer               @title : 'KundenID';
        Name    : String  @title : 'Name';
        Erstellungsdatum: Date @title : 'Erstellungsdatum';
        Rating: String @title : 'Rating';
        Strasse: String @title : 'Straße';
        Hausnummer: String @title : 'Hausnummer';
        PLZ: String @title : 'PLZ';
        Ort:String @title : 'Ort';
        sapanwender: Association to many Kunde_SapAnwender on sapanwender.kunde=$self;
        kreditlimit: Association to Kreditlimit;

}
entity SapAnwender {
    key SapAnwenderID: Integer @title : 'SapAnwenderID';
        Vorname: String @title : 'Vorname';
        Nachname: String @title : 'Nachname';
        Rolle: String @title : 'Rolle';
        kunde: Association to many Kunde_SapAnwender on kunde.sapanwender=$self;
        kreditlimit: Association to many SapAnwender_Kreditlimit on kreditlimit.sapanwender=$self;

}
entity Kreditlimit {
    key KreditlimitID: Integer @title : 'KreditlimitID';
        Befristung: Date @title : 'Befristung';
        Hoehe: Decimal @title : 'Höhe';
        Bemerkung: String @title : 'Bemerkung';
        Status: String @title : 'Status';
        kunde: Association to Kunde;  
        sapanwender: Association to many SapAnwender_Kreditlimit on sapanwender.kreditlimit=$self;
}
entity Kunde_SapAnwender {
    kunde: Association to Kunde; 
    sapanwender: Association to SapAnwender;
}
entity SapAnwender_Kreditlimit{
    kreditlimit: Association to Kreditlimit;
    sapanwender: Association to SapAnwender; 
}

