#!/bin/bash

# Load the environment variables that customize the build.
source env-vars.sh

cd ..
docker-compose --project-name $DCNAME down
