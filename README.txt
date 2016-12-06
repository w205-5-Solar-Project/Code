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
# Steps for setting up backend data store for spark-sql
# (so that both HIVE and SPARK-SQL will point to the same metastore)
############################################################################

1) Change the value of the hive.metastore.schema.verification to false in 
the /data/hadoop/hive/conf/hive-site.xml file (see below):

<property>
<name>hive.metastore.schema.verification</name>
<value>false</value>
</property>

2) Copy the hive-site.xml  to the $SPARK_HOME/conf directory:

cp /data/hadoop/hive/conf/hive-site.xml $SPARK_HOME/conf/.

############################################################################
# Steps to run the Solar Course Project using git clone
############################################################################
$ cd /home/w205/
$ git clone https://github.com/w205-5-Solar-Project/Solar.git
$ cd Solar
$ bash Setup/run_project.sh
