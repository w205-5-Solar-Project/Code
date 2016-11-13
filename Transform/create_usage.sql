----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Elizabeth Shulok
-- File name: create_usage.sql
-- Description:
-- Date       : 11/6/2016
----------------------------------------------------------------------------
DROP TABLE usage;

CREATE TABLE usage AS
SELECT DISTINCT UPPER(name) AS county_name,
UPPER(sector) AS sector,
cast(yr_2015 AS DOUBLE) AS yr_2015,
cast(yr_2014 AS DOUBLE) AS yr_2014,
cast(yr_2013 AS DOUBLE) AS yr_2013
FROM usage_raw;
