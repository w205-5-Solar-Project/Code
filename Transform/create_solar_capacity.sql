----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name  : create_solar_capacity.sql
-- Description: 
-- Date       : 11/13/2016
----------------------------------------------------------------------------
DROP TABLE solar_capacity;

CREATE TABLE solar_capacity AS
SELECT DISTINCT county,
SUM(size_dc) AS total_size_dc,
SUM(size_ac) AS total_size_ac
FROM interconnection
GROUP BY county
ORDER by total_size_ac DESC;