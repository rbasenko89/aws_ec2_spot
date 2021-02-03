#!/bin/bash

sudo systemctl start docker
sudo yum install -y unzip
#wget https://sparkdatasource.s3.us-east-2.amazonaws.com/SparkDataSource.zip
wget https://sparkdatasource.s3.us-east-2.amazonaws.com/SparkDataSource301.zip
unzip SparkDataSource301.zip
#unzip SparkDataSource.zip
cd SparkDataSource
docker image build --tag sparkdata:1.0 .
docker container create -e port=10000 -p 10000:10000 --name sparksqlcontainer sparkdata:1.0
docker start sparksqlcontainer
