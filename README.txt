############################################################################
# W205 Section 5 Course Project
# Vincent Chu
# File name  : README.txt
# Description: Instructions for running the project
# Github Link: 
# Date       : 11/27/2016
# Modified   : 12/10/2016:VC: Added steps regarding to redirecting spark-sql
#              to point to the same metastore behind hive and also setting 
#              up Tableau with hive.
############################################################################

############################################################################
## 1) EC2 start-up
############################################################################

i) Start an AWS EC2 instance using the "UCB W205 Spring 2016" AMI

ii) Modify security rules by opening the following TCP ports on 0.0.0.0/0
- 22
- 4040
- 7180
- 8080
- 8088
- 50070
- 10000
 
(Port 10000 is important for this project as Tableau will connect to this port with 
the Cloudera ODBC Driver for Apache Hive)

ii) Create a EBS volume of 200 GB, attach it to the instance started in step i) above

iii) Connect to the EC2 instance using ssh: ssh -i "<key file name>" root@<EC2 host path>

iv) Use fdisk -l to find the disk path of the EBS volume created in step ii) above.  Note
down this path for step vi).

v) Set the /data directory as readable, writable and executable by all users, since 
/data is where the disk will be mounted.

$ chmod a+rwx /data

vi) Get and run the set up script to set up hadoop, postgres, hive, spark, etc.:

$ wget https://s3.amazonaws.com/ucbdatasciencew205/setup_ucb_complete_plus_postgres.sh
$ chmod +x ./setup_ucb_complete_plus_postgres.sh
$ ./setup_ucb_complete_plus_postgres.sh <the disk path noted down from step iv) above>


############################################################################
# 2) Redirect spark-sql to point to the same metastore as hive
############################################################################

i) While still being the root user, change the value of the hive.metastore.schema.verification 
to false in the /data/hadoop/hive/conf/hive-site.xml file.  Below shows the part of the 
hive-site.xml file where value of the <value> tag needs to be set to false.

<property>
<name>hive.metastore.schema.verification</name>
<value>false</value>
</property>

* You can also just copy the "hive-site.xml" file from the Setup/ folder of the Solar repository 
to overwrite the same file in the /data/hadoop/hive/conf directory in your EC2 instance.

ii) Change to the w205 user

$ su - w205 

iii) Copy the hive-site.xml to the $SPARK_HOME/conf directory:

$ cp /data/hadoop/hive/conf/hive-site.xml $SPARK_HOME/conf/.

* You can copy the "hive-site.xml" file from the Setup/ folder of the Solar repository 
to $SPARK_HOME/conf.

*** After these steps, hive and spark-sql will be pointing to and working on the same
backend data metastore.  Please note that after the steps above, spark-sql must be invoked 
with the --driver-class-path flag to specify the postgresql-jdbc.jar file to be included
since the backend data metastore was set to be a postgres database by the 
setup_ucb_complete_plus_postgres.sh script run in step 1.vi) above.  Otherwise, an error 
will be thrown since spark-sql cannot connect to the postgres database behind hive.

spark-sql --driver-class-path /usr/share/java/postgresql-jdbc.jar

############################################################################
# 3) Steps to run the Solar Course Project using git clone
############################################################################

i) Change Directory to home directory for the w205 user:

$ cd /home/w205/

ii) Get all the files for this project by git clone:

$ git clone https://github.com/w205-5-Solar-Project/Solar.git

iii) Execute the run_project.sh script to kick off the 
load_data_lake.sh and create_sparksql_tables.sh scripts:

$ cd Solar
$ bash Setup/run_project.sh

############################################################################
# 4) Steps to set up and run our Tableau workbook
############################################################################

i) Start hiveserver2 from the EC2 instance:

$ hive --service hiveserver2

ii) Make sure port 10000 is opened on the Ec2 instance (should have been doen in step 1.ii).

iii) Install the Cloudera ODBC Driver for Apache Hive.

iv) Configure the Cloudera ODBC Driver by going to the "ODBC Data Source Administrator" 
window via Control Panel.  Use the following settings:

Host: <EC2 host path>
Port: 10000
Database: default
HiveServer Type: HiveServer2

v) When opening the "SolarProject.twb" Tableau workbook from the "Investigate" folder of 
our repository, please change the Host to the full path of your EC2 instance.