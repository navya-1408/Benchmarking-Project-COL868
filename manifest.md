# Benchmarking Environment Manifest

## System Information
- **OS:** Windows 11 Pro (64-bit)
- **CPU:** Intel Core i5 (4 cores, 2.4 GHz)
- **RAM:** 16 GB
- **Storage:** NVMe SSD

## Software Versions
- **PostgreSQL:** 15.6
- **Extensions:**
  - hstore (bundled)
  - jsonb (built-in)
- **Python:** 3.10.12
- **Pip:** 23.3.2

## Python Packages
- ipython-sql 0.5.0  
- psycopg2-binary 2.9.9  
- pandas 2.2.1  
- jupyter 1.0.0  

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
