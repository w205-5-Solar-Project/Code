----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Vincent Chu
-- File name: load_setup_data.sql
-- Description: 
-- Date       : 11/5/2016
----------------------------------------------------------------------------
drop table county_raw;

create external table county_raw
(name string,
population string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
location '/user/w205/proj/counties_data';

drop table city_raw;

create external table city_raw
(name string,
type string, 
county_name string, 
2010_population string, 
sq_mi string, 
sq_km string, 
incorporated string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
location '/user/w205/proj/cities_data';