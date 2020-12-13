#!/bin/bash

# This file should be copied to the config directory mounted by the Docker
# container at startup. Edit this file to customize the environment variables
# controlling the infrastructure that the BCH ABC full node depends on.

# Launch the IPFS daemon and give it some time to start.
ipfs daemon &
sleep 30

# Add the compiled Gatsby site to IPFS.
ipfs add -r /root/gatsby-ipfs-personal-blog/public > /root/config/hashes.txt
cat /root/config/hashes.txt
