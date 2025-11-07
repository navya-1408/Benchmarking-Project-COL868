CREATE INDEX idx_jsonb_data ON jsonb_table USING GIN (data);
CREATE INDEX idx_hstore_data ON hstore_table USING GIN (data);
