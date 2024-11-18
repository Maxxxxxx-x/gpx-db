-- name: GetGpxFiles :many
SELECT * FROM GpxFiles;

-- name: GetGpxFilesById :many
SELECT * FROM GpxFiles WHERE Id = $1 LIMIT 1;

-- name: GetGpxFilesByUserId :many
SELECT * FROM GpxFiles
INNER JOIN Records ON GpxFiles.Id = Records.FileId AND Records.UserId = $1;

-- name: InsertGpxFile :one
INSERT INTO GpxFiles (
    Id, FilePath, Checksum
) VALUES (
    $1, $2, $3
) RETURNING *;

-- name: DeleteGpxFileById :exec
DELETE FROM GpxFiles WHERE Id = $1;

-- name: DeleteGpxFiles :exec
DELETE FROM GpxFiles;
