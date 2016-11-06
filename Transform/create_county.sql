----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: create_county.sql
-- Description: 
-- Date       : 11/6/2016
----------------------------------------------------------------------------
DROP TABLE county;

CREATE TABLE county AS
SELECT DISTINCT UPPER(name),
cast(population AS LONG)
FROM county_raw;