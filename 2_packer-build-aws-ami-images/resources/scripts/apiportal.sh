#!/bin/bash

#sudo docker start 8cc75f6a1a45
sudo docker container run --name apiportal -p 32081:80 -e MYSQL_HOST=apimanager.techlab0001.axwaydemo.co.uk -e MYSQL_PORT=3306 -e MYSQL_DATABASE=apiportal -e MYSQL_USER=apiportaluser -e MYSQL_PASSWORD=Space*117 -e APIMANAGER_HOST=apimanager.techlab0001.axwaydemo.co.uk -e APIMANAGER_PORT=443 axway/apiportal:7.7.20210130
pwd
