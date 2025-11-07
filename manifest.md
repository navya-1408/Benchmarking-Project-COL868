# Benchmarking Environment Manifest

## System Information
- **OS:** Windows 11 (64-bit)
- **CPU:** Intel Core i5 (10 cores, 1.3 GHz)
- **RAM:** 16 GB

## Software Versions
- **PostgreSQL:** 15.10
- **Extensions:**
  - hstore (bundled)
  - jsonb (built-in)
- **Python:** 3.11.9
- **Pip:** 25.2

## Python Packages
- ipython-sql 0.5.0  
- psycopg2-binary 2.9.10  
- pandas 2.3.0  

## Dataset Information
- **Yelp Business Dataset:** 150,346 records (subset of Yelp Business Dataset)
- **Food Inspections Dataset:** 299237 records (Chicago Department of Public Health)
- **Food Supply kcal Dataset:** FAO data (publicly available)

## Experiment Setup
- All experiments executed on local PostgreSQL instance
- Benchmarks repeated 5 iterations per query
- Dataset files stored in `/datasets/`
- Scripts used:
  - `Aggregate_Queries.ipynb`
  - `Update__plots.ipynb`
  - `hstore_prelim.ipynb`

## Reproducibility
All steps (install, data load, and query execution) can be reproduced using:
- Commands in `README.md`
- Dataset samples provided in `/datasets/`
