-- name: GetRecords :many
SELECT * FROM Records;

-- name: GetRecordById :one
SELECT * FROM Records WHERE Id = $1 LIMIT 1;

-- name: GetRecordsByUserId :many
SELECT * FROM Records WHERE UserId = $1;

-- name: GetRecordsByFileId :one
SELECT * FROM Records WHERE FileId = $1 LIMIT 1;

-- name: GetRecordByDistance :many
SELECT * FROM Records WHERE Distance = $1;

-- name: GetRecordByDuration :many
SELECT * FROM Records WHERE Duration = $1;

-- name: InsertRecord :one
INSERT INTO Records (
    Id, UserId, FileId, TrailName, RecordedAt, Duration, Distance, Ascent, Descent
) VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8, $9
) RETURNING *;

-- name: DeleteRecord :exec
DELETE FROM Records WHERE Id = $1;

-- name: RemoveAllRecords :exec
DELETE FROM Records;
