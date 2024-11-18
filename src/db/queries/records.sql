-- name: GetRecords :many
SELECT * FROM Records;

-- name: GetRecordsByUserId :many
SELECT * FROM Records WHERE UserId = $1;

-- name: GetRecordsByFileId :many
SELECT * FROM Records WHERE FileId = $1 LIMIT 1;

-- name: GetRecordsByTrailName :many
SELECT * FROM Records WHERE TrailName = $1;

-- name: InsertRecord :one
INSERT INTO Records (
    Id, UserId, FileId, TrailName, RecordedAt, Duration, Distance, Ascent, Descent, TrailData
) VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8, $9, $10
) RETURNING *;

-- name: FlagRecord :one
UPDATE Records SET FlagReason = $2 WHERE Id = $1 RETURNING *;

-- name: DeleteRecordById :exec
DELETE FROM Records WHERE Id = $1;

-- name: DeleteRecordsByUserId :exec
DELETE FROM Records WHERE UserId = $1;

