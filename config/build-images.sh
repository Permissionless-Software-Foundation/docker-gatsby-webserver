#!/bin/bash

# This script file is called to build the Docker containers.

# Load the environment variables that customize the build.
source env-vars.sh
echo "Building containers for this repository: "$GATSBY_REPO

# Re-build the Docker containers.
cd ..
docker-compose down
docker-compose build
#docker-compose build --no-cache

# Run the containers
docker-compose --project-name $DCNAME up -d 

# Cleanup orphaned images.
#./config/cleanup-images.sh

echo "Docker containers have been re-built and are now running"
