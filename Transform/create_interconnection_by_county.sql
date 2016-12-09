----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name  : create_interconnection_by_county.sql
-- Description: 
-- Date       : 11/13/2016
-- Modified   : 12/07/2016-ES: removed DISTINCT after select
----------------------------------------------------------------------------
DROP TABLE interconnection_by_county;

CREATE TABLE interconnection_by_county AS
SELECT county,
SUM(size_dc) AS total_size_dc,
SUM(size_ac) AS total_size_ac, 
SUM(ev_count) AS total_ev_count,
AVG(total_system_cost) AS avg_system_cost
FROM interconnection
GROUP BY county
ORDER by county;