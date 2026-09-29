# dbt Pipeline on BigQuery — staging → intermediate → marts

> Le Wagon Data Analytics bootcamp (2026) · sample e-commerce dataset (jaffle_shop)

## Goal
Build an analytics-ready data model with **dbt** on **Google BigQuery**, following the standard three-layer architecture used in modern data teams.

## What I built
- **Sources**: configured and documented raw sources
- **Staging layer**: one model per source table (cleaning, renaming, type casting)
- **Intermediate layer**: `int_orders_with_payments` — joins orders with payments and aggregates totals at order level
- **Marts layer**: business-ready models such as `dim_customers` (customer dimension with aggregated metrics) for dashboards and analysts
- **Data quality**: dbt tests and documentation

## Project structure
```
jaffle_shop_dbt/
  models/
    staging/
    intermediate/
    marts/
```

## Stack
dbt · SQL · Google BigQuery · Git
