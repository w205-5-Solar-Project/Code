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