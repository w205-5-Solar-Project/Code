drop table county;

create external table county
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

drop table city;

create external table city
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