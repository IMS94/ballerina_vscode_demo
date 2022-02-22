import ballerina/io;
import ballerina/http;

type Repo record {
    int id;
    string name;
};

type Actor record {
    int id;
    string login;
    string display_login;
};

type Event record {
    string id;
    string 'type;
    Actor actor;
    Repo repo;

    json payload;
};

type PullRequestEvent record {|
    string repository;
|};

service /events on new http:Listener(9090) {

    resource function get pull\-requests() returns PullRequestEvent[]|error {
        http:Client ghClient = check new ("https://api.github.com");
        Event[] response = check ghClient->get("/orgs/ballerina-platform/events");

        PullRequestEvent[] events = [];
        foreach Event item in response {
            if item.'type == "PullRequestEvent" {
                events.push({repository: item.repo.name});
            }
        }

        return events;
    }
}
