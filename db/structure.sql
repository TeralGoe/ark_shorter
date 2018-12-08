CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "shorters" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "code" varchar, "original_url" text, "purified_url" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE UNIQUE INDEX "index_shorters_on_code" ON "shorters" ("code");
INSERT INTO "schema_migrations" (version) VALUES
('20181208171006');


