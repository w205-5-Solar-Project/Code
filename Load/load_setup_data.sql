drop table counties;

create table counties
(name string,
population string)
row format delimited fields terminated by ','
stored as textfile
location '/user/w205/proj/counties_data';

drop table cities;

create table cities
(name string,
type string, 
county_name string, 
2010_population string, 
sq_mi string, 
sq_km string, 
incorporated string)
row format delimited fields terminated by ','
stored as textfile
location '/user/w205/proj/cities_data';