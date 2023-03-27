create table if not exists friends_requests
(
    id               uuid PRIMARY KEY,
    user_id          uuid         NOT NULL,
    userSender_id    uuid         NOT NULL,
    userSender_name  VARCHAR(255) NOT NULL,
    userSender_email VARCHAR(255) NOT NULL
);

create table if not exists room_invites
(
    id                uuid PRIMARY KEY,
    user_id           uuid         NOT NULL,
    room_id           uuid         NOT NULL,
    userCreator_id    uuid         NOT NULL,
    userCreator_name  VARCHAR(255) NOT NULL,
    userCreator_email VARCHAR(255) NOT NULL,
    place             VARCHAR(255) NOT NULL,
    date              TIMESTAMP    NOT NULL
);