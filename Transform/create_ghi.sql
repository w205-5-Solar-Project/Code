----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: create_ghi.sql
-- Description: 
-- Date       : 11/13/2016
-- Modified   : 12/01/2016-ES: changed "dni" to "ghi" and added _per_day 
--                             to december field
--	            12/02/2016-ES: fixed last field name to match same pattern 
--                             as previous fields
--              12/05/2016-VC: added fields for annual and monthly average 
--                             maximums (for calculation of SPI in the 
--                             transform layer)
----------------------------------------------------------------------------
DROP TABLE ghi;

CREATE TABLE ghi AS
SELECT DISTINCT 
UPPER(county) AS county,
cast(annual_average AS DOUBLE) AS annual_avg_ghi_per_day,
cast(january_average AS DOUBLE) AS january_avg_ghi_per_day,
cast(february_average AS DOUBLE) AS february_avg_ghi_per_day,
cast(march_average AS DOUBLE) AS march_avg_ghi_per_day,
cast(april_average AS DOUBLE) AS april_avg_ghi_per_day,
cast(may_average AS DOUBLE) AS may_avg_ghi_per_day,
cast(june_average AS DOUBLE) AS june_avg_ghi_per_day,
cast(july_average AS DOUBLE) AS july_avg_ghi_per_day,
cast(august_average AS DOUBLE) AS august_avg_ghi_per_day,
cast(september_average AS DOUBLE) AS september_avg_ghi_per_day,
cast(october_average AS DOUBLE) AS october_avg_ghi_per_day,
cast(november_average AS DOUBLE) AS november_avg_ghi_per_day,
cast(december_average AS DOUBLE) AS december_avg_ghi_per_day, 
cast(annual_average_maximum AS DOUBLE) AS annual_max_avg_ghi_per_day,
cast(january_average_maximum AS DOUBLE) AS january_max_avg_ghi_per_day,
cast(february_average_maximum AS DOUBLE) AS february_max_avg_ghi_per_day,
cast(march_average_maximum AS DOUBLE) AS march_max_avg_ghi_per_day,
cast(april_average_maximum AS DOUBLE) AS april_max_avg_ghi_per_day,
cast(may_average_maximum AS DOUBLE) AS may_max_avg_ghi_per_day,
cast(june_average_maximum AS DOUBLE) AS june_max_avg_ghi_per_day,
cast(july_average_maximum AS DOUBLE) AS july_max_avg_ghi_per_day,
cast(august_average_maximum AS DOUBLE) AS august_max_avg_ghi_per_day,
cast(september_average_maximum AS DOUBLE) AS september_max_avg_ghi_per_day,
cast(october_average_maximum AS DOUBLE) AS october_max_avg_ghi_per_day,
cast(november_average_maximum AS DOUBLE) AS november_max_avg_ghi_per_day,
cast(december_average_maximum AS DOUBLE) AS december_max_avg_ghi_per_day
FROM ghi_raw
WHERE state = 'CA';