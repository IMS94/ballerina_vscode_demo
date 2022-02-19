import ballerina/uuid;
import booking_demo.bookings;
import ballerina/io;
import booking_demo.types;

public function main() returns error? {
    types:Passenger passenger1 = {
        firstName: "John",
        lastName: "Doe",
        id: uuid:createType1AsString(),
        designation: "Mr"
    };

    types:AirPlane plane1 = {
        name: "AB1",
        model: "Airbus A350"
    };

    types:AirPlane plane2 = {
        name: "B1",
        model: "Boeing 747"
    };

    types:Flight flightToLondon = {
        origin: "Colombo",
        destination: "London",
        id: uuid:createType1AsString(),
        departure: {
            year: 2022,
            month: 2,
            day: 22,
            hour: 10,
            minute: 0,
            second: 0
        },
        plane: plane1
    };

    types:Flight flightToBerlin = {
        origin: "Colombo",
        destination: "Berlin",
        id: uuid:createType1AsString(),
        departure: {
            year: 2022,
            month: 2,
            day: 22,
            hour: 11,
            minute: 0,
            second: 0
        },
        plane: plane2
    };

    types:Booking passenger1Booking1 = {
        flight: flightToBerlin,
        passenger: passenger1
    };
    check bookings:addBooking(passenger1Booking1);

    types:Booking passenger1Booking2 = {
        flight: flightToLondon,
        passenger: passenger1
    };
    check bookings:addBooking(passenger1Booking2);

    types:Booking[] flightsToBerlin = bookings:findBookingsByFlight(flightToBerlin);
    io:println("Flights to berlin", flightsToBerlin);
}
