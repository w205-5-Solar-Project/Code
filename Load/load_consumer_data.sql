----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Elizabeth Shulok
-- File name: load_consumer_data.sql
-- Description: 
-- Date       : 11/6/2016
----------------------------------------------------------------------------
drop table usage_raw;

create external table usage_raw
(name string,
sector string,
yr_2015 string,
yr_2014 string,
yr_2013 string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
location '/user/w205/proj/usage_data';

drop table income_raw;

create external table income_raw
(geo_id1 string,
geo_id2 string, 
county_name string, 
2014_income string, 
error_margin string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
location '/user/w205/proj/income_data';