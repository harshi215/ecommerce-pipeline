# E-commerce Data Pipeline

An end-to-end data pipeline built on the Brazilian E-commerce dataset from Olist (Kaggle). The project loads raw order data into PostgreSQL, models it as a star schema, and uses SQL analysis to answer business questions.

## Goals

- Practice advanced SQL, including window functions
- Model data with a star schema (fact and dimension tables)
- Orchestrate loads with Airflow, containerize with Docker
- Compare warehouse options and process data with PySpark
- Build transformations and data quality checks with dbt

## Tech stack

Python, pandas, PostgreSQL, SQL, DuckDB (planned), Airflow (planned), Docker (planned), Redshift (planned), PySpark (planned), dbt (planned)

## Project structure

```
ecommerce-pipeline/
├── data/raw/          # Original Olist CSV files (not committed)
├── docs/              # Learning log and notes
├── scripts/           # Python scripts (download, check, load)
├── sql/analysis/      # SQL analysis queries
├── requirements.txt
└── README.md
```


## Setup

1. Clone the repo and create a virtual environment: `python -m venv .venv`
2. Install dependencies: `pip install -r requirements.txt`
3. Download the dataset: `python scripts/download_data.py`
4. Create a `.env` file with your PostgreSQL settings (not committed)
5. Load the data: `python scripts/load_to_postgres.py`

## Status

- [x] Day 0: Project setup and data check
- [x] Day 1: Window functions, database loading
- [ ] Day 2: Advanced SQL and star schema
