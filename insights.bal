import ballerina/log;
import ballerina/http;
import ballerina/io;

public function main() returns error? {
    io:println("Hello World!");
    error e = error("message");
    log:printDebug("This is a debug message", e, key1 = "k1");

    http:Client cl = check new(url = "https://google.com/?q=sample");
}
