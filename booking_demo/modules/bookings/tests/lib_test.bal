import ballerina/io;
import booking_demo.types;
import ballerina/uuid;
import ballerina/test;

// Before Suite Function

@test:BeforeSuite
function beforeSuiteFunc() {
    io:println("Setting up test!");
}

# Test add booking function
@test:Config {}
function testAddBooking() {
    types:AirPlane plane = {
        name: "B123",
        model: types:Boeing747
    };

    types:Flight flight = {
        plane: plane,
        origin: "Colombo",
        destination: "London",
        id: uuid:createType1AsString(),
        departure: {
            year: 2022,
            month: 2,
            day: 23,
            utcOffset: {hours: 0},
            hour: 23,
            minute: 0,
            second: 0
        }
    };

    types:Passenger passenger = {
        firstName: "John",
        lastName: "Doe",
        id: uuid:createType1AsString(),
        designation: "Mr"
    };

    types:Booking booking = {
        flight: flight,
        passenger: passenger
    };

    error? addResult = addBooking(booking);
    test:assertFalse(addResult is error);

    types:Booking[] bookings = findBookingsByFlight(flight);
    test:assertEquals(bookings.length(), 1);

    types:Booking actual = bookings[0];
    test:assertEquals(actual, booking);
}

// After Suite Function

@test:AfterSuite
function afterSuiteFunc() {
    io:println("Finalize test!");
}
