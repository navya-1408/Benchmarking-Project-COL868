# Benchmarking PostgreSQL: hstore vs jsonb vs vanilla

Reproducible setup and commands to load datasets and run aggregation/update benchmarks.

## 1. Prerequisites
**PostgreSQL** ≥ 15 (local installation)
**Python** ≥ 3.9 with `pip`
(Optional) **Jupyter Notebook / VS Code**

## 2. PostgreSQL Setup

Create and configure your PostgreSQL database.

```bash
# Open psql (Windows)
psql -U postgres

-- Inside psql
CREATE DATABASE mydb;
\c mydb

-- Optional: set a password (if not set)
ALTER USER postgres WITH PASSWORD 'xxxxx';

-- Enable hstore extension
CREATE EXTENSION IF NOT EXISTS hstore;
```
Update `dbname`, `password` accordingly wherever psycopg2.connect(...) or %sql postgresql://... appears.

## 3. Python environment
```bash
python -m pip install --upgrade pip
pip install ipython ipykernel jupyter ipython-sql psycopg2-binary pandas
```

