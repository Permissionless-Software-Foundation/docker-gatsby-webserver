#!/bin/bash

# This file should be copied to the config directory mounted by the Docker
# container at startup. Edit this file to customize the environment variables
# controlling the infrastructure that the BCH ABC full node depends on.

# Load the environment variables that customize the build.
source env-vars.sh
echo "Building containers for this repository: "$GATSBY_REPO

# Configured the IPFS node.
# ipfs config --json Addresses.Swarm '["/ip4/0.0.0.0/tcp/$IPFS_PORT"]'
echo "IPFS ADDR: "$IPFS_ADDR
ipfs config --json Addresses.Swarm "$IPFS_ADDR"
ipfs config --json Swarm.ConnMgr.HighWater 50
ipfs config --json Swarm.ConnMgr.LowWater 30

# Print out the node id to the Docker log.
ipfs id

# Launch the IPFS daemon and give it some time to start.
ipfs daemon &
sleep 30

# Add the compiled Gatsby site to IPFS.
ipfs add -r /root/$REPO_DIR/public > /root/push-hash/hashes.txt
#cat /root/config/hashes.txt

# Run the JS app to publish the hash to the blockchain.
cd /root/push-hash
npm start
