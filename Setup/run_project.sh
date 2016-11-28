############################################################################
# W205 Section 5 Exercise 2 Final Submission
# Vincent Chu
# File name  : run_project.sh
# Description: sh script to 
# Date       : 11/24/2016
############################################################################

pwd

echo $PATH
export PATH=$PATH:/home/w205/spark15/bin

bash Setup/load_data_lake.sh
bash Setup/create_sparksql_tables.sh
