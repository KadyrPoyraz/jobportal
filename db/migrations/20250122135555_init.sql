-- +goose Up
CREATE TABLE users
(
    id            BIGSERIAL     NOT NULL PRIMARY KEY,
    first_name      VARCHAR(255),
    last_name      VARCHAR(255),
    email         VARCHAR(255)        NOT NULL UNIQUE,
    password VARCHAR(255)
);

-- +goose Down
DROP TABLE users;