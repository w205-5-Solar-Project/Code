----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Elizabeth Shulok
-- File name: solar_generation_by_county.sql
-- Description: 
-- Date       : 12/02/2016
----------------------------------------------------------------------------

-- Calculates the total solar generation based on total installed solar capacity (AC) x irradiance by county

DROP TABLE solar_generation_by_county;

CREATE TABLE solar_generation_by_county AS
SELECT interconn.county,
interconn.total_size_ac * ghi.annual_avg_ghi_per_day AS total_solar_generation 
FROM interconnection_by_county AS interconn 
JOIN ghi ON ghi.county = interconn.county
