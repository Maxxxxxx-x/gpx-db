-- name: GetTrailData :many
SELECT * FROM TrailData;

-- name: GetTrailDataById :one
SELECT * FROM TrailData WHERE Id = $1 LIMIT 1;

-- name: GetTrailDataByRecordId :one
SELECT * FROM TrailData WHERE RecordId = $1 LIMIT 1;

-- name: InsertTrailData :one
INSERT INTO TrailData (
    Id, RecordId, TrailData
) VALUES (
    $1, $2, $3
) RETURNING *;

-- name: DeleteTrailDataById :exec
DELETE FROM TrailData WHERE Id = $1;

-- name: DeleteTrailDatas :exec
DELETE FROM TrailData
