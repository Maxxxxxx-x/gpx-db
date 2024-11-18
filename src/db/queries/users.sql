-- name: GetUsers :many
SELECT * FROM Users;

-- name: GetUserById :one
SELECT * FROM Users WHERE Id = $1 LIMIT 1;

-- name: InsertUser :one
INSERT INTO Users (
    Id
) VALUES (
    $1
) RETURNING *;

-- name: DeleteUserById :exec
DELETE FROM Users WHERE Id = $1;

-- name: DeleteUsers :exec

DELETE FROM Users;
