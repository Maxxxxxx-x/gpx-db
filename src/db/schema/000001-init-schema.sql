CREATE TABLE IF NOT EXISTS Records(
    Id UUID PRIMARY KEY,
    UserId TEXT NOT NULL REFERENCES Users(Id),
    FileId UUID NOT NULL REFERENCES GpxFiles(Id),
    TrailName TEXT NOT NULL,
    RecordedAt TIMESTAMPTZ,
    Duration float,
    Distance float,
    Ascent float,
    Descent float,
    FlagReason TEXT
    TrailData JSONB NOT NULL
);

CREATE TABLE IF NOT EXISTS GpxFiles(
    Id TEXT NOT NULL,
    FilePath TEXT NOT NULL,
    Checksum TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Users(
    Id TEXT PRIMARY KEY
);

CREATE INDEX IF NOT EXISTS records_userid ON Records(UserId);
CREATE INDEX IF NOT EXISTS records_fileid ON Records(FileId);
CREATE INDEX IF NOT EXISTS records_trailname ON Records(TrailName);
CREATE INDEX IF NOT EXISTS gpxfiles_gpxid ON GpxFiles(GpxId);
