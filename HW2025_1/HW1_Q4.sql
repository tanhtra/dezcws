SELECT DATE(lpep_pickup_datetime) date,
       MAX(trip_distance) max_trip_distance
FROM green_taxi_data
GROUP BY 1
ORDER BY 2 DESC;
