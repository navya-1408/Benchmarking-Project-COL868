CREATE EXTENSION IF NOT EXISTS hstore;

DROP TABLE IF EXISTS jsonb_table, hstore_table;

CREATE TABLE jsonb_table (
    id SERIAL PRIMARY KEY,
    data JSONB
);

CREATE TABLE hstore_table (
    id SERIAL PRIMARY KEY,
    data HSTORE
);
