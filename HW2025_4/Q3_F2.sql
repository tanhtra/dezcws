
WITH 
base AS (
  SELECT * FROM `dezc2025-448113.dbt_dezc.dim_fhv_trips`
), duration AS (
SELECT *,
  TIMESTAMP_DIFF(dropoff_datetime, pickup_datetime, SECOND) AS trip_duration
FROM base
), condensed AS (
  SELECT pu_year, pu_month, pulocationid, pickup_zone, dolocationid, dropoff_zone, trip_duration FROM duration
), p90 AS (
  SELECT DISTINCT pu_year, pu_month, pickup_zone, dropoff_zone,
  APPROX_QUANTILES(trip_duration, 100)[offset(90)] p90
FROM condensed
GROUP BY pu_year, pu_month, pickup_zone, dropoff_zone
ORDER BY pu_year, pu_month, pickup_zone, dropoff_zone
)

-- For the Trips that respectively started from Newark Airport, SoHo, and Yorkville East, in November 2019, what are dropoff_zones with the 2nd longest p90 trip_duration ?
SELECT *
FROM p90
WHERE pickup_zone IN ('Newark Airport', 'SoHo', 'Yorkville East')
AND pu_year = 2019
AND pu_month = 11
ORDER BY pickup_zone, p90 DESC