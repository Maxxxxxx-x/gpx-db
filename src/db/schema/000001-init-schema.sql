CREATE TABLE IF NOT EXISTS Records(
    Id UUID PRIMARY KEY,
    UserId TEXT NOT NULL,
    FileId UUID NOT NULL REFERENCES GpxFiles(Id),
    TrailName TEXT NOT NULL,
    RecordedAt TIMESTAMPTZ,
    Duration float,
    Distance float,
    Ascent float,
    Descent float
);

CREATE TABLE IF NOT EXISTS TrailData(
    Id UUID PRIMARY KEY,
    RecordId UUID NOT NULL REFERENCES Records(Id),
    TrailData JSONB NOT NULL
);

CREATE TABLE IF NOT EXISTS GpxFiles(
    Id UUID PRIMARY KEY,
    GpxId TEXT NOT NULL,
    FilePath TEXT NOT NULL,
    Checksum TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Users(
    UserId TEXT PRIMARY KEY
);

CREATE INDEX IF NOT EXISTS records_userid ON Records(UserId);
CREATE INDEX IF NOT EXISTS records_fileid ON Records(FileId);
CREATE INDEX IF NOT EXISTS records_trailname ON Records(TrailName);
CREATE INDEX IF NOT EXISTS traildata_recordid ON TrailData(RecordId);
CREATE INDEX IF NOT EXISTS gpxfiles_gpxid ON GpxFiles(GpxId);
