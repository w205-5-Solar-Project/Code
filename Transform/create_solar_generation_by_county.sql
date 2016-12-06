----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Elizabeth Shulok
-- File name: create_solar_generation_by_county.sql
-- Description: 
-- Date       : 12/02/2016
-- Modified   : 12/06/2016-VC: Modified logic to calculate actual 
--                             solar generation based on Solar Potential 
--                             Index (SPI)
----------------------------------------------------------------------------

-- Calculates the total solar generation based on total installed solar capacity (AC) x SPI

DROP TABLE solar_generation_by_county;

CREATE TABLE solar_generation_by_county AS
SELECT interconn.county,
interconn.total_size_ac * spi.annual_spi AS annual_avg_solar_gen_kw,
interconn.total_size_ac * spi.january_spi AS jan_avg_solar_gen_kw,   
interconn.total_size_ac * spi.february_spi AS feb_avg_solar_gen_kw, 
interconn.total_size_ac * spi.march_spi AS mar_avg_solar_gen_kw, 
interconn.total_size_ac * spi.april_spi AS apr_avg_solar_gen_kw, 
interconn.total_size_ac * spi.may_spi AS may_avg_solar_gen_kw, 
interconn.total_size_ac * spi.june_spi AS jun_avg_solar_gen_kw, 
interconn.total_size_ac * spi.july_spi AS jul_avg_solar_gen_kw,   
interconn.total_size_ac * spi.august_spi AS aug_avg_solar_gen_kw, 
interconn.total_size_ac * spi.september_spi AS sep_avg_solar_gen_kw, 
interconn.total_size_ac * spi.october_spi AS oct_avg_solar_gen_kw, 
interconn.total_size_ac * spi.november_spi AS nov_avg_solar_gen_kw, 
interconn.total_size_ac * spi.december_spi AS dec_avg_solar_gen_kw
FROM interconnection_by_county AS interconn 
JOIN spi
ON spi.county = interconn.county