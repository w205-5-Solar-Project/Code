----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: top_20_ev_counties.sql
-- Description: Returns the top 20 counties with highest number of EVs 
-- Date       : 12/10/2016
----------------------------------------------------------------------------

-- Set output to include column headers

set hive.cli.print.header=true;

-- Get the top 20 counties with highest number of EVs

SELECT   interconn.county, 
         interconn.total_ev_count AS ev_count, 
         gen.annual_avg_solar_gen_kw
FROM     interconnection_by_county AS interconn LEFT JOIN solar_generation_by_county AS gen
ON       interconn.county = gen.county
ORDER BY interconn.total_ev_count DESC
LIMIT 20;