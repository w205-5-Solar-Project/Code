############################################################################
# W205 Section 5 Course Project
# Vincent Chu
# File name  : README.txt
# Description: Instructions for running the project
# Github Link: 
# Date       : 11/27/2016
############################################################################

############################################################################
# Start-up and Installation
############################################################################
$ chmod a+rwx /data
$ wget https://s3.amazonaws.com/ucbdatasciencew205/setup_ucb_complete_plus_postgres.sh
$ chmod +x ./setup_ucb_complete_plus_postgres.sh
$ ./setup_ucb_complete_plus_postgres.sh <the device path from EC2>
# Change verification setting to false in hive-site.xml
$ cp /data/hadoop/hive/conf/hive-site.xml $SPARK_HOME/conf/.

$ /data/start_postgres.sh
$ pip install psycopg2
$ pip install -U scikit-learn
$ su - w205 

############################################################################
# Steps to run the Solar Course Project using git clone
############################################################################
$ cd /home/w205/
$ git clone https://github.com/w205-5-Solar-Project/Solar.git
$ cd Solar
$ bash Setup/run_project.sh