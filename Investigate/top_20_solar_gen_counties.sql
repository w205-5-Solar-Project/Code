----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: top_20_solar_gen_counties.sql
-- Description: Returns the top 20 counties with highest amount of estimated 
--              solar generation in KW, along with all potential factors
-- Date       : 12/10/2016
----------------------------------------------------------------------------

-- Set output to include column headers

set hive.cli.print.header=true;

-- Get the top 20 counties with the highest solar generatio

SELECT   gen.county, 
         gen.annual_avg_solar_gen_kw, 
         spi.annual_spi, 
         solar_sum.annual_avg_ghi_per_day, 
         solar_sum.total_size_ac AS installed_capacity, 
         solar_sum.total_ev_count AS ev_count,
         solar_sum.yr_2014_usage_percapita AS 2014_res_usage_percapita, 
         solar_sum.2014_percapita_income, 
         solar_sum.2014_household_income
FROM     solar_generation_by_county AS gen 
LEFT JOIN spi ON gen.county = spi.county
LEFT JOIN solar_summary_by_year AS solar_sum ON gen.county = solar_sum.county
ORDER BY annual_avg_solar_gen_kw DESC
LIMIT 20;