----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Elizabeth Shulok
-- File name: create_income.sql
-- Description: 
-- Date       : 11/6/2016
----------------------------------------------------------------------------
DROP TABLE income;

CREATE TABLE income AS
SELECT DISTINCT UPPER(county_name) AS name,
cast(2014_income AS BIGINT) AS 2014_income
FROM income_raw;