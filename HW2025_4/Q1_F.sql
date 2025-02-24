WITH aggregated AS (
SELECT
  service_type,
  pu_year_quarter,
  SUM(total_amount) AS total_amount
FROM `dezc2025-448113.dbt_dezc.fct_taxi_trips_quarterly_revenue` 
WHERE pu_year in (2019, 2020)
GROUP BY service_type, pu_year_quarter
ORDER BY service_type, pu_year_quarter
), cumulative AS (
  SELECT *,
  SUM(total_amount) OVER (
    PARTITION BY service_type
    ORDER BY pu_year_quarter
    ROWS UNBOUNDED PRECEDING
  ) AS cumulative_total
FROM aggregated
ORDER BY service_type, pu_year_quarter
), lag AS (
  SELECT *,
    LAG(cumulative_total) OVER(PARTITION BY service_type ORDER BY pu_year_quarter) AS prev_cumulative_total
  FROM cumulative
  ORDER BY service_type, pu_year_quarter
)

SELECT 
  service_type, pu_year_quarter, total_amount,
  ROUND(cumulative_total / prev_cumulative_total - 1, 3) AS ratio
FROM lag
ORDER BY service_type, pu_year_quarter

