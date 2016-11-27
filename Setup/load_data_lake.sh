###########################################################################
# W205 Section 5 Course Project
# Vincent Chu
# File name  : load_data_lake.sh
# Description: sh script to wget, unzip and load raw data files to
#              HDFS Data Lake
# Date       : 11/13/2016
# Modified   : 11/22/2016-ES: Changed household_income to percapita_income
#		              Added code to load party_affiliation                
#              11/27/2016-VC: Modified script to avoid moving files around 
#                             and just work with the directory structure
#                             inherited the Github repository.  Also added 
#                             logic to load raw data for household income 
#                             and distinguished it from per capita income.
############################################################################
############################################################################
# Setting up directories in local
############################################################################

# Display current directory in local
pwd

# Create a subdirectory under data to hold the zip files from wget
rm -rf Data/zip
mkdir Data/zip

# Create a subdirectory under data to hold clean setup data
rm -rf Data/setup
mkdir Data/setup

# Create a subdirectory under data to hold clean consumer data
rm -rf Data/consumer
mkdir Data/consumer

# Create a subdirectory under data to hold clean solar installation data
rm -rf Data/solar
mkdir Data/solar

# Create a subdirectory under data to hold clean weather data
rm -rf Data/weather
mkdir Data/weather

# Change directory to zip in local
cd Data/zip

# get the zip file with interconnection data
wget http://www.californiadgstats.ca.gov/download/interconnection_nem_pv_projects/NEM_CurrentlyInterconnectedDataset_2016-08-30.zip

# Unzip the contents of NEM_CurrentlyInterconnectedDataset_2016-08-30.zip
unzip NEM_CurrentlyInterconnectedDataset_2016-08-30.zip

# Change back to project directory in local
cd ../..

############################################################################
# Setting up directory for this project in hdfs
############################################################################

# Recursively remove the proj directory in HDFS, if it exists
hdfs dfs -rm -r /user/w205/proj

# Create a new directory in HDFS for this project
hdfs dfs -mkdir /user/w205/proj

############################################################################
# Load raw data file for cities
############################################################################

# Make a copy of "ca_cities.csv", remove the header row and place it in 
# the setup subdirectory
tail -n +2 Data/ca_cities.csv > Data/setup/ca_cities.csv

# Create a new subdirectory under /user/w205/proj for ca_cities.csv in HDFS
hdfs dfs -mkdir /user/w205/proj/cities_data

# Load the ca_cities.csv file to HDFS under /user/w205/proj/cities_data
hdfs dfs -put Data/setup/ca_cities.csv /user/w205/proj/cities_data

############################################################################
# Load raw data file for counties
############################################################################

# Make a copy of "ca_counties.csv", remove the header row and place it in 
# the setup subdirectory
tail -n +2 Data/ca_counties.csv > Data/setup/ca_counties.csv

# Create a new subdirectory under /user/w205/proj for ca_counties.csv in HDFS
hdfs dfs -mkdir /user/w205/proj/counties_data

# Load the ca_counties.csv file to HDFS under /user/w205/proj/counties_data
hdfs dfs -put Data/setup/ca_counties.csv /user/w205/proj/counties_data

############################################################################
# Load raw data file for usage
############################################################################

# Make a copy of "electricity_usage.csv", remove the header row and place it in 
# the consumer subdirectory
tail -n +2 Data/electricity_usage.csv > Data/consumer/electricity_usage.csv

# Create a new subdirectory under /user/w205/proj for electricity_usage.csv in HDFS
hdfs dfs -mkdir /user/w205/proj/usage_data

# Load the ca_counties.csv file to HDFS under /user/w205/proj/counties_data
hdfs dfs -put Data/consumer/electricity_usage.csv /user/w205/proj/usage_data

############################################################################
# Load raw data file for per capita income
############################################################################

# Make a copy of "percapita_income.csv", remove the header row and place it in 
# the consumer subdirectory
tail -n +3 Data/percapita_income.csv > Data/consumer/percapita_income.csv

# Create a new subdirectory under /user/w205/proj for percapita_income.csv in HDFS
hdfs dfs -mkdir /user/w205/proj/percapita_income_data

# Load the percapita_income.csv file to HDFS under /user/w205/proj/percapita_income_data
hdfs dfs -put Data/consumer/percapita_income.csv /user/w205/proj/percapita_income_data

############################################################################
# Load raw data file for household income
############################################################################

# Make a copy of "household_income.csv", remove the header row and place it in 
# the consumer subdirectory
tail -n +3 Data/household_income.csv > Data/consumer/household_income.csv

# Create a new subdirectory under /user/w205/proj for household_income.csv in HDFS
hdfs dfs -mkdir /user/w205/proj/household_income_data

# Load the household_income.csv file to HDFS under /user/w205/proj/household_income_data
hdfs dfs -put Data/consumer/household_income.csv /user/w205/proj/household_income_data

############################################################################
# Load raw data file for party affiliation
############################################################################

# Make a copy of "party_affiliation.csv", remove the header row and place it in 
# the consumer subdirectory
tail -n +2 Data/party_affiliation.csv > Data/consumer/party_affiliation.csv

# Create a new subdirectory under /user/w205/proj for party_affiliation.csv in HDFS
hdfs dfs -mkdir /user/w205/proj/party_data

# Load the party_affiliation.csv file to HDFS under /user/w205/proj/party_data
hdfs dfs -put Data/consumer/party_affiliation.csv /user/w205/proj/party_data


############################################################################
# Load raw data file for interconnection
############################################################################

# Make a copy of "NEM_CurrentlyInterconnectedDataset_2016-08-30.csv", remove 
# the header row and place it in the solar subdirectory
tail -n +2 Data/zip/NEM_CurrentlyInterconnectedDataset_2016-08-30.csv > Data/solar/interconnection.csv

# Create a new subdirectory under /user/w205/proj for interconnection.csv in HDFS
hdfs dfs -mkdir /user/w205/proj/interconn_data

# Load the interconnection.csv file to HDFS under /user/w205/proj/interconn_data
hdfs dfs -put Data/solar/interconnection.csv /user/w205/proj/interconn_data

############################################################################
# Load raw data file for irradience DNI
############################################################################

# Make a copy of "dni_by_county.csv", remove the header row and place it in 
# the weather subdirectory
tail -n +2 Data/dni_by_county.csv > Data/weather/dni_by_county.csv

# Create a new subdirectory under /user/w205/proj for dni_by_county.csv in HDFS
hdfs dfs -mkdir /user/w205/proj/dni_data

# Load the dni_by_county.csv file to HDFS under /user/w205/proj/dni_data
hdfs dfs -put Data/weather/dni_by_county.csv /user/w205/proj/dni_data

############################################################################
# Load raw data file for irradience GHI
############################################################################

# Make a copy of "ghi_by_county.csv", remove the header row and place it in 
# the weather subdirectory
tail -n +2 Data/ghi_by_county.csv > Data/weather/ghi_by_county.csv

# Create a new subdirectory under /user/w205/proj for ghi_by_county.csv in HDFS
hdfs dfs -mkdir /user/w205/proj/ghi_data

# Load the ghi_by_county.csv file to HDFS under /user/w205/proj/ghi_data
hdfs dfs -put Data/weather/ghi_by_county.csv /user/w205/proj/ghi_data
