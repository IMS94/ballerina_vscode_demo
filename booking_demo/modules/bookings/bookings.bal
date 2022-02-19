import booking_demo.types;

types:Booking[] bookings = [];

# Add the provided booking
#
# + booking - Booking
public function addBooking(types:Booking toBeAdded) returns error? {
    types:Booking[] existing = from var booking in bookings
        where booking.flight.id == toBeAdded.flight.id
        where booking.passenger.id == toBeAdded.flight.id
        select booking;

    if existing.length() > 0 {
        return error("Booking already exists", booking = toBeAdded);
    }
    bookings.push(toBeAdded);
}

# Find all bookings made for a flight
#
# + flight - Flight
# + return - Bookings made for the provided flight
public function findBookingsByFlight(types:Flight flight) returns types:Booking[] {
    return from var booking in bookings
        where booking.flight.id == flight.id
        select booking;
}

# Find all bookings made by a given passenger
#
# + passenger - Passenger
# + return - Bookings made by the provided passenger
public function findBookingsByPassenger(types:Passenger passenger) returns types:Booking[] {
    return from var booking in bookings
        where booking.passenger.id == passenger.id
        select booking;
}

# Remove the provided booking
#
# + booking - Booking
# + return - true if booking was removed successfully. false if the booking was invalid.
public function removeBooking(types:Booking booking) returns boolean {
    int? index = bookings.indexOf(booking);
    if index is int {
        types:Booking remove = bookings.remove(index);
        return true;
    }

    return false;
}
