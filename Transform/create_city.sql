----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: create_city.sql
-- Description: 
-- Date       : 11/6/2016
----------------------------------------------------------------------------
DROP TABLE city;

CREATE TABLE city AS
SELECT DISTINCT UPPER(name),
type, 
UPPER(county_name), 
cast(sq_mi AS DOUBLE), 
cast(sq_km AS DOUBLE)
FROM city_raw;