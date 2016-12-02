----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: create_solar_summary_by_year.sql
-- Description: 
-- Date       : 11/24/2016
-- Modified   : 12/01/2016-ES: Changed dni_raw.county in first JOIN statement
--				to ghi
--			       Changed 'SELECT interconn.annual_avg_dhi_per_day' to
--				       'SELECT ghi.annual_avg_ghi_per_day'
--					Added county name to the output table
----------------------------------------------------------------------------

-- Sum of installed solar capacity, number of EVs, 
-- average solar irradiance, 
-- electricity usage and 
-- percapita income by county, 
-- ordered by installed solar capacity grouped by year

DROP TABLE solar_summary_by_year;

CREATE TABLE solar_summary_by_year AS
SELECT interconn.county,
ghi.annual_avg_ghi_per_day, 
interconn.total_size_dc,
interconn.total_size_ac, 
interconn.total_ev_count,
interconn.avg_system_cost, 
usage.yr_2014_usage_percapita, 
percapita_income.2014_income, 
household_income.2014_income
FROM interconnection_by_county AS interconn 
JOIN ghi ON interconn.county = ghi.county
JOIN usage_info AS usage ON usage.county_name = interconn.county
JOIN percapita_income ON percapita_income.county_name = interconn.county
JOIN household_income ON household_income.county_name = interconn.county
