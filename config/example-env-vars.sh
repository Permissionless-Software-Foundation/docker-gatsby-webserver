#!/bin/bash

# This file sets the environment variables used to build and run the Docker
# containers.

# Repository information on the Gatsby site that is being published.
export GATSBY_REPO=https://github.com/christroutner/gatsby-ipfs-personal-blog
export REPO_DIR=gatsby-ipfs-personal-blog

# Port for serving clearweb via NGINX
export NGINX_PORT=3122

# Port and IPFS multiaddr for serving over IPFS.
export IPFS_PORT=3222
export IPFS_ADDR="[\"ip4/0.0.0.0/tcp/$IPFS_PORT\", \"/ip6/::/tcp/$IPFS_PORT\"]"

# BCH wallet info for writing the IPFS hash to the blockchain.
export BCHADDR=bitcoincash:qqd94dhzzpszm6q0eemlh6xpl22v4upayy9w4706mu
export WIF=L4PDYJ3zde3VANr9ZrKaVUqrkvBvg7514E2tibUiiVLXtvT85YUs
