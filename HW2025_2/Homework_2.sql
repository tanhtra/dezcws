SELECT
    'Yellow Total 2020' AS Label,
    COUNT(1) AS total_count
FROM yellow_tripdata
WHERE yellow_tripdata.filename LIKE 'yellow_tripdata_2020-__.csv'

UNION ALL

SELECT
    'Green Total 2020' AS Label,
    COUNT(1) AS total_count
FROM green_tripdata
WHERE green_tripdata.filename LIKE 'green_tripdata_2020-__.csv'

UNION ALL

SELECT
    'Yellow Total March 2021' AS Label,
    COUNT(1) AS total_count
FROM yellow_tripdata
WHERE yellow_tripdata.filename = 'yellow_tripdata_2021-03.csv';