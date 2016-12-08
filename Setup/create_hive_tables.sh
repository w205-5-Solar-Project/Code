############################################################################
# W205 Section 5 Course Project
# Vincent Chu
# File name  : create_hive_tables.sh
# Description: sh script to 
# Date       : 12/07/2016
############################################################################

# Display current working directory
pwd

############################################################################
# Run SQL scripts to create raw data tables
############################################################################
hive -f Load/load_weather_data.sql
hive -f Load/load_setup_data.sql
hive -f Load/load_solar_data.sql
hive -f Load/load_consumer_data.sql

############################################################################
# Run SQL scripts to create transformed data tables
############################################################################
hive -f Transform/create_county.sql  
hive -f Transform/create_city.sql    
hive -f Transform/create_percapita_income.sql
hive -f Transform/create_household_income.sql
hive -f Transform/create_usage.sql
hive -f Transform/create_party_affiliation.sql
hive -f Transform/create_dni.sql
hive -f Transform/create_ghi.sql
hive -f Transform/create_interconnection.sql
hive -f Transform/create_interconnection_by_county.sql
hive -f Transform/create_county_info.sql
hive -f Transform/create_usage_percapita_info.sql
hive -f Transform/create_solar_summary_by_year.sql
hive -f Transform/create_solar_summary_by_month.sql
