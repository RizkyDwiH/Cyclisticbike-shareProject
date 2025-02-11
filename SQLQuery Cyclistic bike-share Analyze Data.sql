/*

Analyze Data 

*/


-- Calculate the total members and casual users.

SELECT member_casual,
COUNT(ride_id) AS total_user
from [Cyclistic bike-share].dbo.[Cyclistic bike-share combine]
group by member_casual



-- Rideable type by members and casual users

SELECT member_casual, rideable_type,
COUNT(ride_id) AS total_user
from [Cyclistic bike-share].dbo.[Cyclistic bike-share combine]
GROUP BY member_casual, rideable_type
ORDER BY COUNT(ride_id) DESC



-- Mostly used start station by member and casual users


SELECT 
    COUNT(*) AS jumlah_null
FROM [Cyclistic bike-share].dbo.[Cyclistic bike-share combine]
WHERE start_station_name IS NULL


SELECT 
    start_station_name, 
    COUNT(*) AS jumlah_data
FROM [Cyclistic bike-share].dbo.[Cyclistic bike-share combine]
GROUP BY start_station_name
ORDER BY jumlah_data DESC;



SELECT start_station_name, member_casual,
COUNT(ride_id) AS total_user
from [Cyclistic bike-share].dbo.[Cyclistic bike-share combine]
GROUP BY start_station_name, member_casual
ORDER BY COUNT(ride_id) DESC



SELECT 
    start_station_name,
    SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS total_member,
    SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS total_casual,
	COUNT(ride_id) AS total_user
FROM [Cyclistic bike-share].dbo.[Cyclistic bike-share combine]
WHERE start_station_name IS NOT NULL
GROUP BY start_station_name  
ORDER BY total_user DESC;



-- Mostly used end station by member and casual users

SELECT end_station_name, member_casual,
COUNT(ride_id) AS total_user
from [Cyclistic bike-share].dbo.[Cyclistic bike-share combine]
GROUP BY end_station_name, member_casual
ORDER BY COUNT(ride_id) DESC



SELECT 
    end_station_name,
    SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS total_member,
    SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS total_casual,
	COUNT(ride_id) AS total_user
FROM [Cyclistic bike-share].dbo.[Cyclistic bike-share combine]
WHERE end_station_name IS NOT NULL
GROUP BY end_station_name  
ORDER BY total_user DESC;



-- Compare length of use total member and casual by time 

-- By Minute

SELECT 
    member_casual,
    SUM(DATEDIFF(MINUTE, started_at, end_at)) AS total_duration_minutes
FROM [Cyclistic bike-share].dbo.[Cyclistic bike-share combine]
GROUP BY member_casual 


-- By Hour

SELECT 
    DATEPART(HOUR, started_at) AS ride_hour,
    member_casual,
    SUM(DATEDIFF(MINUTE, started_at, end_at)) AS total_duration_minutes
FROM [Cyclistic bike-share].dbo.[Cyclistic bike-share combine]
GROUP BY DATEPART(HOUR, started_at), member_casual
ORDER BY ride_hour, member_casual DESC


-- By Weekday

SELECT 
    DATENAME(WEEKDAY, started_at) AS ride_day,
    member_casual,
    SUM(DATEDIFF(MINUTE, started_at, end_at)) AS total_duration_minutes
FROM [Cyclistic bike-share].dbo.[Cyclistic bike-share combine]
GROUP BY DATENAME(WEEKDAY, started_at), member_casual
ORDER BY ride_day, member_casual DESC


-- By Month

SELECT 
    DATENAME(MONTH, started_at) AS ride_month,
    member_casual,
    SUM(DATEDIFF(MINUTE, started_at, end_at)) AS total_duration_minutes
FROM [Cyclistic bike-share].dbo.[Cyclistic bike-share combine]
GROUP BY DATENAME(MONTH, started_at), member_casual
ORDER BY ride_month, member_casual DESC






