from pyspark import SparkContext
from pyspark.sql import SQLContext
from pyspark.sql.types import *

sc = SparkContext("local", "weblog app")
sqlContext = SQLContext(sc)

lines = sc.textFile("/user/w205/proj/counties_data/ca_counties.csv")

parts = lines.map(lambda l: l.split(','))
counties = parts.map(lambda p: (p[0], p[1]))

schemaString = 'name population'
fields = [StructField(field_name, StringType(), True) for field_name in schemaString.split()]
schema = StructType(fields)

schemaCountiesData = sqlContext.createDataFrame(counties, schema)
schemaCountiesData.registerTempTable('counties')

results = sqlContext.sql('SELECT * FROM counties')
results.show()