# docker-gatsby-webserver

The purpose of this repository is to create a series of Docker containers, orchestrated with Docker Compose, to deploy a Gatsby website and serve the website over clearnet (nginx), Tor, and IPFS.

The build and deployment is started by running the [build-images.sh](./config/build-images.sh) shells script. This script is intended to be executed by a webhook, triggered from GitHub, by pushing to the `master` branch of the Gatsby website repository.

This app is customized by creating and editing a `env-vars.sh` shells script in the `config` directory. This file is called by `build-images.sh`.
