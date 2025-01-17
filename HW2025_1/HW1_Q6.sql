SELECT
    d."Zone" AS DropOff,
    MAX(tip_amount) max_tip
FROM green_taxi_data g
    LEFT JOIN zones z
    ON g."PULocationID" = z."LocationID"
    LEFT JOIN zones d
    ON g."DOLocationID" = d."LocationID"
WHERE z."Zone" = 'East Harlem North'
GROUP BY 1
ORDER BY 2 DESC