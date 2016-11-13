----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Elizabeth Shulok
-- File name   : create_usage_percapita_info.sql
-- Description : 
-- Date        : 11/12/2016
-- Modified    : 11/13/2016 - VC: fixed syntax error and field name 
--                            of usage table  
----------------------------------------------------------------------------
DROP TABLE usage_info;

CREATE TABLE usage_info AS
SELECT usage.county_name, 
usage.yr_2014, 
usage.yr_2014 / county.population AS usage_percapita
FROM usage JOIN county 
ON usage.name = county.name
ORDER BY usage_percapita DESC
