import ballerina/time;

public enum Model {
    A350,
    Boeing747
}

public type AirPlane record {|
    Model model;
    string name;
|};

public type Flight record {|
    string id;
    time:Date departure;
    string origin;
    string destination;
    AirPlane plane;
|};

public type Booking record {
    Flight flight;
    Passenger passenger;
};

public type Passenger record {
    string id;
    string designation;
    string firstName;
    string lastName;
};
