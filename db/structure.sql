CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "shorters" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "code" varchar, "original_url" text, "purified_url" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE UNIQUE INDEX "index_shorters_on_code" ON "shorters" ("code");
CREATE TABLE IF NOT EXISTS "visitors" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "ip" varchar, "country" varchar, "shorter_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, CONSTRAINT "fk_rails_1f0c67630d"
FOREIGN KEY ("shorter_id")
  REFERENCES "shorters" ("id")
);
CREATE INDEX "index_visitors_on_shorter_id" ON "visitors" ("shorter_id");
INSERT INTO "schema_migrations" (version) VALUES
('20181208171006'),
('20181208171956');


