#!/bin/bash

# This file sets the environment variables used to build and run the Docker
# containers.

# Docker container name prefix
export DCNAME=uncen-pub

# Repository information on the Gatsby site that is being published.
export GATSBY_REPO=https://github.com/Permissionless-Software-Foundation/gatsby-ipfs-template
export REPO_DIR=gatsby-ipfs-template

# Port for serving clearweb via NGINX
export NGINX_PORT=3123

# Port and IPFS multiaddr for serving over IPFS.
export IPFS_PORT=3124
export IPFS_ADDR="[\"/ip4/0.0.0.0/tcp/$IPFS_PORT\", \"/ip6/::/tcp/$IPFS_PORT\"]"

# BCH wallet info for writing the IPFS hash to the blockchain.
export BCHADDR=bitcoincash:qqd94dhzzpszm6q0eemlh6xpl22v4upayy9w4706mu
export WIF=L4PDYJ3zde3VANr9ZrKaVUqrkvBvg7514E2tibUiiVLXtvT85YUs
