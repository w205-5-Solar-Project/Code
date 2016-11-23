############################################################################
# W205 Section 5 Course Project
# Vincent Chu
# File name  : load_data_lake.sh
# Description: sh script to unzip source file load selected raw data files 
#              to HDFS Data Lake
# Date       : 11/13/2016
############################################################################
############################################################################
# Setting up directories in local
############################################################################

# Display current directory in local
pwd

# Recursively remove the project directory in local, if it exists
rm -rf project_test
# Re-create the project directory, which will hold the zip file with flat data files 
mkdir project_test
# Change directory to project
cd project_test

# Re-create the data directory, which will hold the zip file with flat data files 
mkdir data
# Re-create the subdirectories to store csv files for consumer, setup, solar and 
# weather data
mkdir data/zip
mkdir data/consumer
mkdir data/setup  
mkdir data/solar  
mkdir data/weather

# Change directory to zip in local
cd data/zip

# get the zip file with flat data files for setup, consumer and irradiance data from GitHub
wget https://github.com/w205-5-Solar-Project/Data/archive/master.zip

# Unzip the contents of master.zip
unzip master.zip

# get the zip file with interconnection data
wget http://www.californiadgstats.ca.gov/download/interconnection_nem_pv_projects/NEM_CurrentlyInterconnectedDataset_2016-08-30.zip

# Unzip the contents of NEM_CurrentlyInterconnectedDataset_2016-08-30.zip
unzip NEM_CurrentlyInterconnectedDataset_2016-08-30.zip

# Change back to project directory in local
cd ../..

############################################################################
# Setting up directories in hdfs
############################################################################

# Recursively remove the proj_test directory in HDFS, if it exists
hdfs dfs -rm -r /user/w205/proj_test

# Create a new directory in HDFS for this project
hdfs dfs -mkdir /user/w205/proj_test

############################################################################
# Load raw data file for cities
############################################################################

# Make a copy of "ca_cities.csv", remove the header row and place it in 
# the setup subdirectory
tail -n +2 data/zip/Data-master/ca_cities.csv > data/setup/ca_cities.csv

# Create a new subdirectory under /user/w205/proj_test for ca_cities.csv in HDFS
hdfs dfs -mkdir /user/w205/proj_test/cities_data

# Load the ca_cities.csv file to HDFS under /user/w205/proj_test/cities_data
hdfs dfs -put data/setup/ca_cities.csv /user/w205/proj_test/cities_data

############################################################################
# Load raw data file for counties
############################################################################

# Make a copy of "ca_counties.csv", remove the header row and place it in 
# the setup subdirectory
tail -n +2 data/zip/Data-master/ca_counties.csv > data/setup/ca_counties.csv

# Create a new subdirectory under /user/w205/proj_test for ca_counties.csv in HDFS
hdfs dfs -mkdir /user/w205/proj_test/counties_data

# Load the ca_counties.csv file to HDFS under /user/w205/proj_test/counties_data
hdfs dfs -put data/setup/ca_counties.csv /user/w205/proj_test/counties_data

############################################################################
# Load raw data file for usage
############################################################################

# Make a copy of "electricity_usage.csv", remove the header row and place it in 
# the consumer subdirectory
tail -n +2 data/zip/Data-master/electricity_usage.csv > data/consumer/electricity_usage.csv

# Create a new subdirectory under /user/w205/proj_test for electricity_usage.csv in HDFS
hdfs dfs -mkdir /user/w205/proj_test/usage_data

# Load the ca_counties.csv file to HDFS under /user/w205/proj_test/counties_data
hdfs dfs -put data/consumer/electricity_usage.csv /user/w205/proj_test/usage_data

############################################################################
# Load raw data file for income
############################################################################

# Make a copy of "household_income.csv", remove the header row and place it in 
# the consumer subdirectory
tail -n +3 data/zip/Data-master/household_income.csv > data/consumer/household_income.csv

# Create a new subdirectory under /user/w205/proj_test for household_income.csv in HDFS
hdfs dfs -mkdir /user/w205/proj_test/income_data

# Load the household_income.csv file to HDFS under /user/w205/proj_test/income_data
hdfs dfs -put data/consumer/household_income.csv /user/w205/proj_test/income_data

############################################################################
# Load raw data file for interconnection
############################################################################

# Make a copy of "NEM_CurrentlyInterconnectedDataset_2016-08-30.csv", remove 
# the header row and place it in the solar subdirectory
tail -n +2 data/zip/NEM_CurrentlyInterconnectedDataset_2016-08-30.csv > data/solar/interconnection.csv

# Create a new subdirectory under /user/w205/proj_test for interconnection.csv in HDFS
hdfs dfs -mkdir /user/w205/proj_test/interconn_data

# Load the household_income.csv file to HDFS under /user/w205/proj_test/interconn_data
hdfs dfs -put data/solar/interconnection.csv /user/w205/proj_test/interconn_data

############################################################################
# Load raw data file for irradience DNI
############################################################################

# Make a copy of "dni_by_county.csv", remove the header row and place it in 
# the weather subdirectory
tail -n +2 data/zip/Data-master/dni_by_county.csv > data/weather/dni_by_county.csv

# Create a new subdirectory under /user/w205/proj_test for dni_by_county.csv in HDFS
hdfs dfs -mkdir /user/w205/proj_test/dni_data

# Load the dni_by_county.csv file to HDFS under /user/w205/proj_test/dni_data
hdfs dfs -put data/weather/dni_by_county.csv /user/w205/proj_test/dni_data

############################################################################
# Load raw data file for irradience GHI
############################################################################

# Make a copy of "ghi_by_county.csv", remove the header row and place it in 
# the weather subdirectory
tail -n +2 data/zip/Data-master/ghi_by_county.csv > data/weather/ghi_by_county.csv

# Create a new subdirectory under /user/w205/proj_test for ghi_by_county.csv in HDFS
hdfs dfs -mkdir /user/w205/proj_test/ghi_data

# Load the ghi_by_county.csv file to HDFS under /user/w205/proj_test/ghi_data
hdfs dfs -put data/weather/ghi_by_county.csv /user/w205/proj_test/ghi_data