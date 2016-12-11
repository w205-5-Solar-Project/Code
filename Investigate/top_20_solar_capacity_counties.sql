----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: top_20_solar_capacity_counties.sql
-- Description: Returns the top 20 counties with highest installed solar PV 
--              capacity (KW)
-- Date       : 12/10/2016
----------------------------------------------------------------------------

-- Set output to include column headers

set hive.cli.print.header=true;

-- Get the top 20 counties with highest installed solar PV capacity (KW)

SELECT   interconn.county, 
         interconn.total_size_ac AS installed_capacity, 
         gen.annual_avg_solar_gen_kw
FROM     interconnection_by_county AS interconn LEFT JOIN solar_generation_by_county AS gen
ON       interconn.county = gen.county
ORDER BY interconn.total_size_ac DESC
LIMIT 20;