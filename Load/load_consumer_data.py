############################################################################
## W205 Section 5 Course Project
## Elizabeth Shulok
## File name: load_usage_data.py
## Description: 
## Date       : 11/6/2016
############################################################################

from pyspark import SparkContext
from pyspark.sql import SQLContext
from pyspark.sql.types import *

sc = SparkContext("local", "weblog app")
sqlContext = SQLContext(sc)

###################################################################
# Create temp table for Electricity Usage 
###################################################################

lines = sc.textFile("/user/w205/proj/usage_data/electricity_usage.csv")

parts = lines.map(lambda l: l.split(','))
usages = parts.map(lambda p: (p[0], p[1], p[2], p[3], p[4]))

schemaString = 'name sector yr_2015 yr_2014 yr_2013'
fields = [StructField(field_name, StringType(), True) for field_name in schemaString.split()]
schema = StructType(fields)

schemaUsageData = sqlContext.createDataFrame(usages, schema)
schemaUsageData.registerTempTable('usage_tmp')

results = sqlContext.sql('SELECT * FROM usage_tmp')
results.show()

###################################################################
# Create temp table for Household Income 
###################################################################

lines = sc.textFile("/user/w205/proj/income_data/household_income.csv")

parts = lines.map(lambda l: l.split(','))
incomes = parts.map(lambda p: (p[0], p[1], p[2], p[3], p[4]))

schemaString = 'geo_id1 geo_id2 county_name 2014_income error_margin'
fields = [StructField(field_name, StringType(), True) for field_name in schemaString.split()]
schema = StructType(fields)

schemaIncomeData = sqlContext.createDataFrame(incomes, schema)
schemaIncomeData.registerTempTable('income_tmp')

results = sqlContext.sql('SELECT * FROM income_tmp')
results.show()