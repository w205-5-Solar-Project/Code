----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: create_county.sql
-- Description: 
-- Date       : 11/6/2016
----------------------------------------------------------------------------
DROP TABLE county;

CREATE TABLE county AS
SELECT DISTINCT UPPER(name) AS name,
cast(population AS LONG) AS population
FROM county_raw;