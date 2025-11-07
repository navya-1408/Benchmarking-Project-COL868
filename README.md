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
Update `dbname`, `user` and `password` accordingly wherever psycopg2.connect(...) or %sql postgresql://... appears.

## 3. Python environment
Install all required dependencies:
```bash
python -m pip install --upgrade pip
pip install ipython ipykernel jupyter ipython-sql psycopg2-binary pandas
```
## 4. Jupyter / IPython SQL Setup
The notebooks already include the required setup cells for:
- Loading the `ipython-sql` extension
- Connecting to PostgreSQL
- Running SQL queries and experiments directly
You can open the notebooks in VS Code or Jupyter Notebook and execute them sequentially.

## 5. Data Loading and Datasets
Dataset files are located in the datasets/ folder:
- `yelp_business.csv`
- `Food_Inspections.csv`
- `Food_Supply_kcal_Data.csv`
Each notebook contains scripts to load these datasets into: vanilla postgresql, hstore, jsonb tables respectively.

## 6. Running Experiments
Each notebook (e.g., `aggregate_queries.ipynb`)already includes:
- Data loading scripts
- Benchmark query execution
- Timing and result logging
Simply open and Run All Cells to reproduce results.

## 7. Reproducibility
System details and environment specifications are documented in the accompanying `manifest.md` file.
