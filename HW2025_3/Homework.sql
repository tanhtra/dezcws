SELECT COUNT(*) FROM `dezc2025-448113.yellow_taxi.yt_ext`;
SELECT COUNT(*) FROM `dezc2025-448113.yellow_taxi.yt_mat`;
-- 20332093

SELECT COUNT(DISTINCT PULocationID) FROM `dezc2025-448113.yellow_taxi.yt_ext`;
-- 0

SELECT COUNT(DISTINCT PULocationID) FROM `dezc2025-448113.yellow_taxi.yt_mat`;
-- 155.12

SELECT PULocationID FROM `dezc2025-448113.yellow_taxi.yt_mat`;
SELECT PULocationID, DOLocationID FROM `dezc2025-448113.yellow_taxi.yt_mat`;
-- 1

SELECT COUNT(*)
FROM `dezc2025-448113.yellow_taxi.yt_mat`
WHERE fare_amount = 0;
-- 8333

SELECT DISTINCT VendorID 
FROM `dezc2025-448113.yellow_taxi.yt_mat`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';

-- 2