#!/bin/bash

sudo docker run --env-file /home/azureuser/agents/azureagents/azure_ta_env_vars.env -v /home/azureuser/agents/azureagents/:/keys \
        axway.jfrog.io/ampc-public-docker-release/agent/azure-traceability-agent:latest
pwd
