#!/bin/bash

#cd /opt/Axway-7.7.0/apigateway/posix/bin
sleep 30s
sudo /opt/Axway-7.7.0/apigateway/posix/bin/nodemanager -d
sudo /opt/Axway-7.7.0/apigateway/posix/bin/startinstance -n "QuickStart Server" -g "QuickStart Group" -d

