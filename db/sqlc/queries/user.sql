-- name: CreateUser :exec
INSERT INTO users(id, first_name, last_name, email, password)
VALUES (DEFAULT, $1, $2, $3, $4);