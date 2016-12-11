----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: top_20_usage_counties.sql
-- Description: Returns the top 20 counties with highest electricity usage 
--              in the residential sector 
-- Date       : 12/10/2016
----------------------------------------------------------------------------

-- Set output to include column headers

set hive.cli.print.header=true;

-- Get the top 20 counties with highest electricity usage in the 
-- residential sector 

SELECT   usage.county_name AS county, 
         usage.yr_2014_usage_percapita AS 2014_res_usage_percapita, 
         gen.annual_avg_solar_gen_kw
FROM     usage_info AS usage LEFT JOIN solar_generation_by_county AS gen
ON       usage.county_name = gen.county
ORDER BY usage.yr_2014_usage_percapita DESC
LIMIT 20;