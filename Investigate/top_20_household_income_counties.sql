----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: top_20_household_income_counties.sql
-- Description: Returns the top 20 counties with highest household income 
-- Date       : 12/10/2016
----------------------------------------------------------------------------

-- Set output to include column headers

set hive.cli.print.header=true;

-- Get the top 20 counties with highest household income  

SELECT   household_income.county_name AS county, 
         household_income.2014_income AS 2014_household_income, 
         gen.annual_avg_solar_gen_kw
FROM     household_income LEFT JOIN solar_generation_by_county AS gen
ON       household_income.county_name = gen.county
ORDER BY household_income.2014_income DESC
LIMIT 20;