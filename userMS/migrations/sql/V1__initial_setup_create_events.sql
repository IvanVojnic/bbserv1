create table if not exists users
(
    id           uuid PRIMARY KEY,
    email        VARCHAR(255) NOT NULL UNIQUE,
    name         VARCHAR(255) NOT NULL UNIQUE,
    password     VARCHAR(255) NOT NULL,
    refreshtoken VARCHAR(255),
    isDeleted    BOOLEAN      NOT NULL
);

create table if not exists friends
(
    id           uuid PRIMARY KEY,
    userSender   uuid NOT NULL,
    userReceiver uuid NOT NULL,
    status       INT  NOT NULL,
    FOREIGN KEY (userSender) REFERENCES users (id)
        ON DELETE CASCADE,
    FOREIGN KEY (userReceiver) REFERENCES users (id)
        ON DELETE CASCADE
);

create table if not exists categories
(
    id              uuid PRIMARY KEY,
    user_creator_id uuid         NOT NULL,
    name            VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_creator_id) REFERENCES users (id)
        ON DELETE CASCADE
);

create table if not exists categories_users
(
    id          uuid PRIMARY KEY,
    category_id uuid NOT NULL,
    user_id     uuid NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories (id)
        ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users (id)
        ON DELETE CASCADE
);

create table if not exists tokens_users
(
    id uuid PRIMARY KEY,
    user_id uuid NOT NULL,
    device_token VARCHAR(255) NOT NULL,
    registration_token VARCHAR(255) UNIQUE,
    FOREIGN KEY (user_id) REFERENCES users (id)
        ON DELETE CASCADE
)