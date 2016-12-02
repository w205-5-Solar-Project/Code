----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: create_solar_summary_by_month.sql
-- Description: 
-- Date       : 12/01/2016
----------------------------------------------------------------------------

-- Sum of installed solar capacity, number of EVs, 
-- average solar irradiance, 
-- electricity usage and 
-- percapita income by county, 
-- ordered by installed solar capacity grouped by month

DROP TABLE solar_summary_by_month;

CREATE TABLE solar_summary_by_month AS
SELECT interconn.county,
ghi.january_avg_ghi_per_day, 
ghi.february_avg_ghi_per_day,
ghi.march_avg_ghi_per_day,
ghi.april_avg_ghi_per_day,
ghi.may_avg_ghi_per_day,
ghi.june_avg_ghi_per_day,
ghi.july_avg_ghi_per_day,
ghi.august_avg_ghi_per_day,
ghi.september_avg_ghi_per_day,
ghi.october_avg_ghi_per_day,
ghi.november_avg_ghi_per_day,
ghi.december_avg_ghi_per_day,
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
