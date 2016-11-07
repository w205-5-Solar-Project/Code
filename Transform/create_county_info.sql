----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: create_county_info.sql
-- Description: 
-- Date       : 11/6/2016
----------------------------------------------------------------------------
DROP TABLE county_info;

CREATE TABLE county_info AS
SELECT county.name, 
county.population, 
county_size.total_sq_mi, 
county_size.total_sq_km,
county.population / county_size.total_sq_mi AS poulation_per_sq_mi,
county.population / county_size.total_sq_km AS poulation_per_sq_km
FROM (SELECT county_name, 
       SUM(sq_mi) AS total_sq_mi, 
       SUM(sq_km) AS total_sq_km
FROM city 
GROUP BY county_name) AS county_size
INNER JOIN county 
ON county_size.county_name = county.name
ORDER BY county.population / county_size.total_sq_mi DESC