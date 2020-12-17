# docker-gatsby-webserver

The purpose of this repository is to create a series of Docker containers, orchestrated with Docker Compose, to deploy a Gatsby website and serve the website over clearnet (nginx), Tor, and IPFS, simultaneously.

The network syndication can be customized any way. e.g. It's possible to turn off clearnet and IPFS syndication, and just serve the website over Tor. Any combination is possible.

The build and deployment is started by running the [build-images.sh](./config/build-images.sh) shell script. This script is intended to be executed by a webhook, triggered from GitHub, by pushing to the `master` branch of the Gatsby website repository.

This app is customized by creating and editing a `env-vars.sh` shells script in the `config` directory. This file is called by `build-images.sh`.

## Installation
First, install Docker:
```
sudo apt-get install -y software-properties-common
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -aG docker ${USER}
```

*Note: You'll need to log out and back in after installing Docker.*

Second, install Docker Compose:
```
sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

Third, copy the [example-env-vars.sh](./config/example-env-vars.sh) shell script to a new file `env-vars.sh`, and customize the values in the file.

## Usage
This repository is now ready to be deployed by a webhook. The webhook should trigger execution of the `build-images.sh` script. That will build and deploy the containers, which will download and build the Gatsby site. [webhook-cli](https://www.npmjs.com/package/webhook-cli) works well, and has [examples for GitHub](https://github.com/sigoden/webhook/wiki/Hook-Examples#incoming-github-webhook).

This back end web server is intended to be paired with [this front end Gatsby Template](https://github.com/Permissionless-Software-Foundation/gatsby-ipfs-template). A live version of that template can be found at [UncensorablePublishing.com](https://uncensorablepublishing.com).

Not all containers need to run, and not all ports need to be exposed. For example, you could refrain from exposing the NGINX port 80 to the world, and just serve the website over Tor and IPFS.

If censorship is a concern, other people can pin the IPFS hash to help syndicate your website. The IPFS is automatically written to the BCH blockchain using the [memo.cash protocol](https://memo.cash/protocol), which can allows it to be searched and easily syndicated.
