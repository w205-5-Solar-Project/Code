############################################################################
## W205 Section 5 Course Project
## Vincent Chu
## File name: load_setup_data.py
## Description: 
## Date       : 11/5/2016
############################################################################

from pyspark import SparkContext
from pyspark.sql import SQLContext
from pyspark.sql.types import *

sc = SparkContext("local", "weblog app")
sqlContext = SQLContext(sc)

###################################################################
# Create temp table for Counties 
###################################################################

lines = sc.textFile("/user/w205/proj/counties_data/ca_counties.csv")

parts = lines.map(lambda l: l.split(','))
counties = parts.map(lambda p: (p[0], p[1]))

schemaString = 'name population'
fields = [StructField(field_name, StringType(), True) for field_name in schemaString.split()]
schema = StructType(fields)

schemaCountiesData = sqlContext.createDataFrame(counties, schema)
schemaCountiesData.registerTempTable('county_tmp')

results = sqlContext.sql('SELECT * FROM county_tmp')
results.show()

###################################################################
# Create temp table for Cities 
###################################################################

lines = sc.textFile("/user/w205/proj/cities_data/ca_cities.csv")

parts = lines.map(lambda l: l.split(','))
cities = parts.map(lambda p: (p[0], p[1], p[2], p[3], p[4], p[5], p[6]))

schemaString = 'name type county_name 2010_population sq_mi sq_km incorporated_date'
fields = [StructField(field_name, StringType(), True) for field_name in schemaString.split()]
schema = StructType(fields)

schemaCitiesData = sqlContext.createDataFrame(cities, schema)
schemaCitiesData.registerTempTable('city_tmp')

results = sqlContext.sql('SELECT * FROM city_tmp')
results.show()