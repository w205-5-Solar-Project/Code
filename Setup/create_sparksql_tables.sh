############################################################################
# W205 Section 5 Course Project
# Vincent Chu
# File name  : create_sparksql_tables.sh
# Description: sh script to 
# Date       : 11/24/2016
############################################################################

# Display current working directory
pwd

############################################################################
# Run SQL scripts to create raw data tables
############################################################################
spark-sql -f Load/load_weather_data.sql
spark-sql -f Load/load_setup_data.sql
spark-sql -f Load/load_solar_data.sql
spark-sql -f Load/load_consumer_data.sql

############################################################################
# Run SQL scripts to create transformed data tables
############################################################################
spark-sql -f Transform/create_county.sql  
spark-sql -f Transform/create_city.sql    
spark-sql -f Transform/create_percapita_income.sql
spark-sql -f Transform/create_household_income.sql
spark-sql -f Transform/create_usage.sql
spark-sql -f Transform/create_party_affiliation.sql
spark-sql -f Transform/create_dni.sql
spark-sql -f Transform/create_ghi.sql
spark-sql -f Transform/create_interconnection.sql
spark-sql -f Transform/create_interconnection_by_county.sql
spark-sql -f Transform/create_county_info.sql
spark-sql -f Transform/create_usage_percapita_info.sql
