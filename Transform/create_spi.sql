----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: create_spi.sql
-- Description: Create a table with SPI (Solar Potential Index) based on
--              the overall maximum monthly average ghi
-- Date       : 12/05/2016
----------------------------------------------------------------------------

-- Calculates SPI (Solar Potential Index) by county based on the overall maximum monthly average ghi.
-- monthly SPI = average monthly ghi / maximum potential ghi
-- annual SPI = average annual ghi / maximum potential ghi

DROP TABLE spi;

CREATE TABLE spi AS
SELECT DISTINCT ghi.county,
ghi.annual_avg_ghi_per_day/max_potential_avg_ghi.max_potential_avg_ghi_per_day AS annual_spi,
ghi.january_avg_ghi_per_day/max_potential_avg_ghi.max_potential_avg_ghi_per_day AS january_spi,
ghi.february_avg_ghi_per_day/max_potential_avg_ghi.max_potential_avg_ghi_per_day AS february_spi,
ghi.march_avg_ghi_per_day/max_potential_avg_ghi.max_potential_avg_ghi_per_day AS march_spi,
ghi.april_avg_ghi_per_day/max_potential_avg_ghi.max_potential_avg_ghi_per_day AS april_spi,
ghi.may_avg_ghi_per_day/max_potential_avg_ghi.max_potential_avg_ghi_per_day AS may_spi,
ghi.june_avg_ghi_per_day/max_potential_avg_ghi.max_potential_avg_ghi_per_day AS june_spi,
ghi.july_avg_ghi_per_day/max_potential_avg_ghi.max_potential_avg_ghi_per_day AS july_spi,
ghi.august_avg_ghi_per_day/max_potential_avg_ghi.max_potential_avg_ghi_per_day AS august_spi,
ghi.september_avg_ghi_per_day/max_potential_avg_ghi.max_potential_avg_ghi_per_day AS september_spi,
ghi.october_avg_ghi_per_day/max_potential_avg_ghi.max_potential_avg_ghi_per_day AS october_spi,
ghi.november_avg_ghi_per_day/max_potential_avg_ghi.max_potential_avg_ghi_per_day AS november_spi,
ghi.december_avg_ghi_per_day/max_potential_avg_ghi.max_potential_avg_ghi_per_day AS december_spi
FROM 
(SELECT county, MAX(max_avg_ghi_per_day) as max_potential_avg_ghi_per_day
FROM
(SELECT county, january_max_avg_ghi_per_day as max_avg_ghi_per_day FROM ghi
UNION ALL
SELECT county, february_max_avg_ghi_per_day as max_avg_ghi_per_day FROM ghi
UNION ALL
SELECT county, march_max_avg_ghi_per_day as max_avg_ghi_per_day FROM ghi
UNION ALL
SELECT county, april_max_avg_ghi_per_day as max_avg_ghi_per_day FROM ghi
UNION ALL
SELECT county, may_max_avg_ghi_per_day as max_avg_ghi_per_day FROM ghi
UNION ALL
SELECT county, june_max_avg_ghi_per_day as max_avg_ghi_per_day FROM ghi
UNION ALL
SELECT county, july_max_avg_ghi_per_day as max_avg_ghi_per_day FROM ghi
UNION ALL
SELECT county, august_max_avg_ghi_per_day as max_avg_ghi_per_day FROM ghi
UNION ALL
SELECT county, september_max_avg_ghi_per_day as max_avg_ghi_per_day FROM ghi
UNION ALL
SELECT county, october_max_avg_ghi_per_day as max_avg_ghi_per_day FROM ghi
UNION ALL
SELECT county, november_max_avg_ghi_per_day as max_avg_ghi_per_day FROM ghi
UNION ALL
SELECT county, december_max_avg_ghi_per_day as max_avg_ghi_per_day FROM ghi) max_avg_ghi
GROUP BY county) max_potential_avg_ghi
JOIN ghi ON max_potential_avg_ghi.county = ghi.county