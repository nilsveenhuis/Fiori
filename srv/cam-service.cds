using { odata_service_cam as my } from '../db/schema';
service MyService {
    entity Kunde as projection on my.Kunde 
    entity SapAnwender as projection on my.SapAnwender
    entity Kreditlimit as projection on my.Kreditlimit
    entity Zusammenfassung as projection on my.Zusammenfassung
}

