----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: top_20_irradiance_counties.sql
-- Description: Returns the top 20 counties with highest daily average 
--              Global Horizontal Irradiance (GHI)
-- Date       : 12/10/2016
----------------------------------------------------------------------------

-- Set output to include column headers

set hive.cli.print.header=true;

-- Get the top 20 counties with highest daily average GHI

SELECT   ghi.county, 
         ghi.annual_avg_ghi_per_day AS irradiance_per_day, 
         spi.annual_spi, 
         gen.annual_avg_solar_gen_kw
FROM ghi LEFT JOIN spi ON ghi.county = spi.county
         LEFT JOIN solar_generation_by_county AS gen ON ghi.county = gen.county
ORDER BY ghi.annual_avg_ghi_per_day DESC
LIMIT 20;