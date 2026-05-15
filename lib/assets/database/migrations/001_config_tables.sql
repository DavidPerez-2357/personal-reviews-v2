
CREATE TABLE database_seeds(
  id INTEGER PRIMARY KEY,
  executed_at INTEGER NOT NULL
);

CREATE TABLE database_migrations(
  id INTEGER PRIMARY KEY,
  from_version INTEGER NOT NULL,
  to_version INTEGER NOT NULL,
  executed_at INTEGER NOT NULL
);