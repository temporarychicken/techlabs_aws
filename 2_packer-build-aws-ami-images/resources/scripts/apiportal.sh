#!/bin/bash

#sudo docker start 8cc75f6a1a45
sudo docker container run --name apiportal -p 32081:80 -e MYSQL_HOST=10.0.1.20 -e MYSQL_PORT=3306 -e MYSQL_DATABASE=test -e MYSQL_USER=apiportaluser -e MYSQL_PASSWORD=Space*117 -e APIMANAGER_HOST=10.0.1.20 -e APIMANAGER_PORT=8075 axway/apiportal:7.7.20210130
pwd
