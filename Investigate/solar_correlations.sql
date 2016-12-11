----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: solar_correlations.sql
-- Description: Calculate the Pearson's Correlation Value between 
--              estimated solar generation in KW and other potential 
--              factors for solar adoption
--              
--              
-- Date       : 12/10/2016
----------------------------------------------------------------------------

-- Set output to include column headers

set hive.cli.print.header=true;

-- Calculate the Pearson's Correlation Value between annual_avg_solar_gen_kw
-- and other potential factors for solar adoption

SELECT corr(annual_avg_solar_gen_kw, annual_spi) AS solar_gen_irr_corr, 
corr(annual_avg_solar_gen_kw, installed_capacity) AS solar_gen_solar_cap_corr, 
corr(annual_avg_solar_gen_kw, ev_count) AS solar_gen_ev_corr, 
corr(annual_avg_solar_gen_kw, 2014_res_usage_percapita) AS solar_gen_res_usage_corr, 
corr(annual_avg_solar_gen_kw, 2014_percapita_income) AS solar_gen_pc_income_corr, 
corr(annual_avg_solar_gen_kw, 2014_household_income) AS solar_gen_hh_income_corr
FROM
(SELECT  gen.county, 
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
LEFT JOIN solar_summary_by_year AS solar_sum ON gen.county = solar_sum.county) as solar