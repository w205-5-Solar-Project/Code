############################################################################
# W205 Section 5 Exercise 2 Final Submission
# Vincent Chu
# File name  : run_project.sh
# Description: sh script to 
# Date       : 11/24/2016
############################################################################

echo $PATH
export PATH=$PATH:/home/w205/spark15/bin

cd /home/w205/
git clone https://github.com/w205-5-Solar-Project/Solar.git

bash /home/w205/Solar/Setup/load_data_lake.sh
bash /home/w205/Solar/Setup/create_sparksql_tables.sh