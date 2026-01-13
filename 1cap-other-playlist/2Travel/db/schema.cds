using{managed,cuid,localized} from '@sap/cds/common';
entity Customer{
    keyID: UUID;
    name: String;
    email: String;
}

entity Flight{
    keyID: UUID;
    airline: String(60);
    destination: String;
    departure: String;
}

entity Booking: managed{
    key ID: UUID;
    customer: Association to Customer;
    flight: Association to Flight;
    status: localized String;
    passengers: Composition of many Passenger on passengers.booking = $self;
}

entity Passenger{
    key ID: UUID;
    key booking: Association to Booking;
    name: String;
    email: String;
}