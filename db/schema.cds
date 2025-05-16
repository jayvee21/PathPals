namespace PathPals.db;
using {cuid, managed} from '@sap/cds/common.cds';

entity Cars : cuid {
    model: String;
    plateNumber: String;
    capacity: String;
}

entity Trips: cuid, managed{
    car: Association to Cars;
    startPoint: String;
    dropPoint: String;
    startTime: DateTime;
    endTime: DateTime;
    bookings: Composition of many Bookings on bookings.trip = $self;
    destinations: Composition of many Destinations on destinations.trip = $self;
}

entity Destinations: cuid, managed {
    trip: Association to Trips;
    name: String;
    arrivalTime: DateTime;
    departuretionTime: DateTime;
}

entity Passengers: cuid, managed{
    name: String;
    email: String;
    phoneNumber: String;
    bookings: Composition of many Bookings on bookings.passenger = $self;
}

entity Bookings: cuid, managed {
    trip: Association to Trips;
    passenger: Association to Passengers;
    bookingTime: DateTime;
    status: String;
}

type StatusCode : String(1) enum {
    Confirmed = 'C';
    Cancelled = 'X';
}