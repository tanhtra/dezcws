SELECT
    z."Zone",
    SUM(total_amount) total_sum
FROM green_taxi_data g
    LEFT JOIN zones z
    ON g."PULocationID" = z."LocationID"
WHERE g.lpep_pickup_datetime::DATE = '2019-10-18'
GROUP BY 1
ORDER BY 2 DESC;
