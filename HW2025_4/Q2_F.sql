
--Create a new model fct_taxi_trips_monthly_fare_p95.sql
--Filter out invalid entries (fare_amount > 0, trip_distance > 0, and payment_type_description in ('Cash', 'Credit Card'))
--Compute the continous percentile of fare_amount partitioning by service_type, year and and month

WITH filter AS (
SELECT *
FROM `dezc2025-448113.dbt_dezc.fct_taxi_trips_quarterly_revenue` 
WHERE 
  fare_amount > 0 
  AND trip_distance > 0
  AND lower(payment_type_description) in ('cash', 'credit card')
), agg AS (
SELECT 
  service_type,
  pu_year, 
  pu_month,
  fare_amount
FROM filter
ORDER BY service_type, pu_year,pu_month
)

select DISTINCT service_type, pu_year, pu_month,
  percentile_cont(fare_amount, 0.97) over(partition by service_type, pu_year, pu_month) p97,
  percentile_cont(fare_amount, 0.95) over(partition by service_type, pu_year, pu_month) p95,
  percentile_cont(fare_amount, 0.9) over(partition by service_type, pu_year, pu_month) p90
from filter
WHERE pu_year = 2020 AND pu_month = 4