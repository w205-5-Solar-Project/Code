----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: top_20_percapita_income_counties.sql
-- Description: Returns the top 20 counties with highest income per capita
-- Date       : 12/10/2016
----------------------------------------------------------------------------

-- Set output to include column headers

set hive.cli.print.header=true;

-- Get the top 20 counties with highest income per capita

SELECT   percapita_income.county_name AS county, 
         percapita_income.2014_income AS 2014_percapita_income, 
         gen.annual_avg_solar_gen_kw
FROM     percapita_income LEFT JOIN solar_generation_by_county AS gen
ON       percapita_income.county_name = gen.county
ORDER BY percapita_income.2014_income DESC
LIMIT 20;