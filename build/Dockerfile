FROM ubuntu:18.04
MAINTAINER Chris Troutner <chris.troutner@gmail.com>

# Update the OS and install any OS packages needed.
RUN apt-get update
RUN apt-get install -y sudo git curl nano gnupg wget

# Install Node and NPM
RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install -y nodejs build-essential

# Build the Gatsby site for clearweb
WORKDIR /root
RUN git clone https://github.com/Permissionless-Software-Foundation/gatsby-ipfs-web-wallet
WORKDIR /root/gatsby-ipfs-web-wallet
RUN npm install
RUN npm run build
RUN cp -r public /root/clearweb

# Build the Gatsby site for IPFS
RUN rm -rf public
RUN npm run build:ipfs
RUN cp -r public /root/ipfs

COPY dummyapp.js dummyapp.js
CMD ["node", "dummyapp.js"]
