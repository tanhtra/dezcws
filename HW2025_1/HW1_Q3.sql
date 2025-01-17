select '1. Up to 1' AS Segments, COUNT(1)
from green_taxi_data
WHERE trip_distance <= 1

UNION ALL

select '2. In between 1 (exclusive) and 3 miles (inclusive)', COUNT(1)
from green_taxi_data
WHERE trip_distance > 1
    AND trip_distance <= 3

UNION ALL

select '3. In between 3 (exclusive) and 7 miles (inclusive)', COUNT(1)
from green_taxi_data
WHERE trip_distance > 3
    AND trip_distance <= 7

UNION ALL

select '4. In between 7 (exclusive) and 10 miles (inclusive)', COUNT(1)
from green_taxi_data
WHERE trip_distance > 7
    AND trip_distance <= 10

UNION ALL

select '5. Over 10 miles', COUNT(1)
from green_taxi_data
WHERE trip_distance > 10
ORDER BY 1