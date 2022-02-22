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
    string user;
|};

service /ballerina on new http:Listener(9090) {

    resource function get pull\-requests() returns PullRequestEvent[]|error? {
        http:Client ghClient = check new ("https://api.github.com");
        json events = check ghClient->get("/orgs/ballerina-platform/events");
        return;
    }
}
