/*

Process Data 

*/


-- Identify and Remove Null Values

select * 
from [Cyclistic bike-share].dbo.[Cyclistic bike-share combine]
where 
ride_id is NULL
OR rideable_type is NULL
OR started_at is NULL
OR end_at is NULL
OR start_station_name is NULL
OR end_station_name is NULL
OR member_casual is NULL;


DELETE from [Cyclistic bike-share].dbo.[Cyclistic bike-share combine]
where 
ride_id is NULL
OR rideable_type is NULL
OR started_at is NULL
OR end_at is NULL
OR start_station_name is NULL
OR end_station_name is NULL
OR member_casual is NULL;



-- Explore the data: the total and unique number of ride_id, and the mean, maximum, and minimum time duration

SELECT
  COUNT(ride_id) total_id,
  COUNT(DISTINCT ride_id) unique_id
FROM [Cyclistic bike-share].dbo.[Cyclistic bike-share combine]




-- Identify and Remove Duplicate Values

SELECT *,
COUNT(*) AS duplicatecount
FROM [Cyclistic bike-share].dbo.[Cyclistic bike-share combine]
GROUP BY 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual
HAVING COUNT(*) >1;























