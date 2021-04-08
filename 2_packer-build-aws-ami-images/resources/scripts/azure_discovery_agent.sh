#!/bin/bash

sleep 180
cd /home/azureuser/agents/azureagents
./azure_discovery_agent --envFile azure_da_env_vars.env
