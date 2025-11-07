\timing

-------------------------------------------------
-- 1️⃣ Complex Filtering and Casting
-------------------------------------------------
-- Countries with obesity > 20, undernourished < 5 and meat > 10 kcal
SELECT data->>'Country'
FROM jsonb_table
WHERE (data->>'Obesity') ~ '^[0-9.]+' AND (data->>'Undernourished') ~ '^[0-9.]+' 
  AND (data->>'Meat') ~ '^[0-9.]+' 
  AND (data->>'Obesity')::numeric > 20 
  AND (data->>'Undernourished')::numeric < 5
  AND (data->>'Meat')::numeric > 10;

SELECT data->'Country'
FROM hstore_table
WHERE (data->'Obesity') ~ '^[0-9.]+' AND (data->'Undernourished') ~ '^[0-9.]+' 
  AND (data->'Meat') ~ '^[0-9.]+' 
  AND (data->'Obesity')::numeric > 20 
  AND (data->'Undernourished')::numeric < 5
  AND (data->'Meat')::numeric > 10;

-------------------------------------------------
-- 2️⃣ Aggregation + Sorting
-------------------------------------------------
-- Top 10 countries by average meat + milk consumption
SELECT data->>'Country' AS country,
       ((data->>'Meat')::numeric + (data->>'Milk - Excluding Butter')::numeric) AS total_kcal
FROM jsonb_table
WHERE (data->>'Meat') ~ '^[0-9.]+' AND (data->>'Milk - Excluding Butter') ~ '^[0-9.]+'
ORDER BY total_kcal DESC
LIMIT 10;

SELECT data->'Country' AS country,
       ((data->'Meat')::numeric + (data->'Milk - Excluding Butter')::numeric) AS total_kcal
FROM hstore_table
WHERE (data->'Meat') ~ '^[0-9.]+' AND (data->'Milk - Excluding Butter') ~ '^[0-9.]+'
ORDER BY total_kcal DESC
LIMIT 10;

-------------------------------------------------
-- 3️⃣ JSONB Operators & Pattern Matching
-------------------------------------------------
-- Countries whose JSONB objects contain the key 'Sugar & Sweeteners'
SELECT COUNT(*) FROM jsonb_table WHERE data ? 'Sugar & Sweeteners';
SELECT COUNT(*) FROM hstore_table WHERE data ? 'Sugar & Sweeteners';

-- Countries with both 'Fruits - Excluding Wine' and 'Vegetables' keys > 15
SELECT COUNT(*) 
FROM jsonb_table 
WHERE (data->>'Fruits - Excluding Wine') ~ '^[0-9.]+' 
  AND (data->>'Vegetables') ~ '^[0-9.]+' 
  AND (data->>'Fruits - Excluding Wine')::numeric > 15
  AND (data->>'Vegetables')::numeric > 15;

-------------------------------------------------
-- 4️⃣ Aggregation Across Regions (simulate grouping)
-------------------------------------------------
-- Average “Vegetable Oils” consumption for top 20 populous countries
SELECT ROUND(AVG((data->>'Vegetable Oils')::numeric),2) AS avg_oil
FROM jsonb_table
WHERE (regexp_replace(data->>'Population','[^0-9eE+.-]','','g'))::numeric > 50000000;

SELECT ROUND(AVG((data->'Vegetable Oils')::numeric),2) AS avg_oil
FROM hstore_table
WHERE (regexp_replace(data->'Population','[^0-9eE+.-]','','g'))::numeric > 50000000;

-------------------------------------------------
-- 5️⃣ Update and Conditional Replace
-------------------------------------------------
-- Add a “RegionFlag” if population > 100 M and obesity > 25
UPDATE jsonb_table
SET data = jsonb_set(data, '{RegionFlag}', '"High-Risk"')
WHERE (regexp_replace(data->>'Population','[^0-9eE+.-]','','g'))::numeric > 100000000
  AND (data->>'Obesity') ~ '^[0-9.]+' AND (data->>'Obesity')::numeric > 25;

UPDATE hstore_table
SET data = data || hstore('RegionFlag','High-Risk')
WHERE (regexp_replace(data->'Population','[^0-9eE+.-]','','g'))::numeric > 100000000
  AND (data->'Obesity') ~ '^[0-9.]+' AND (data->'Obesity')::numeric > 25;

-------------------------------------------------
-- 6️⃣ Size + Index Scan
-------------------------------------------------
-- Check storage usage and verify index efficiency
SELECT 
  pg_total_relation_size('jsonb_table') AS jsonb_size,
  pg_indexes_size('jsonb_table') AS jsonb_index_size,
  pg_total_relation_size('hstore_table') AS hstore_size,
  pg_indexes_size('hstore_table') AS hstore_index_size;
