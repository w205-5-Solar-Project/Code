----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: create_ghi.sql
-- Description: 
-- Date       : 11/13/2016
----------------------------------------------------------------------------
DROP TABLE ghi;

CREATE TABLE ghi AS
SELECT DISTINCT 
UPPER(county) AS county_name,
cast(annual_average AS DOUBLE) AS annual_avg_dni_per_day,
cast(january_average AS DOUBLE) AS january_avg_dni_per_day,
cast(february_average AS DOUBLE) AS february_avg_dni_per_day,
cast(march_average AS DOUBLE) AS march_avg_dni_per_day,
cast(april_average AS DOUBLE) AS april_avg_dni_per_day,
cast(may_average AS DOUBLE) AS may_avg_dni_per_day,
cast(june_average AS DOUBLE) AS june_avg_dni_per_day,
cast(july_average AS DOUBLE) AS july_avg_dni_per_day,
cast(august_average AS DOUBLE) AS august_avg_dni_per_day,
cast(september_average AS DOUBLE) AS september_avg_dni_per_day,
cast(october_average AS DOUBLE) AS october_avg_dni_per_day,
cast(november_average AS DOUBLE) AS november_avg_dni_per_day,
cast(december_average AS DOUBLE) AS december_average
FROM ghi_raw
WHERE state = 'CA';