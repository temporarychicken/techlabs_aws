#!/bin/bash

sleep 180
cd /home/azureuser/agents/apigeeagents/
./apigee_discovery_agent --envFile apigee_da_env_vars.env
