----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: create_city.sql
-- Description: 
-- Date       : 11/6/2016
----------------------------------------------------------------------------
DROP TABLE city;

CREATE TABLE city AS
SELECT DISTINCT UPPER(name) AS name,
UPPER(type) AS type, 
UPPER(county_name) AS county_name, 
cast(sq_mi AS DOUBLE) AS sq_mi, 
cast(sq_km AS DOUBLE) AS sq_km
FROM city_raw;