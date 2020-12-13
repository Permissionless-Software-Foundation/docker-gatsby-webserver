# This Docker container builds the Gatsby site and adds it to an IPFS node.
# It then publishes the IPFS hash for the site to the BCH blockchain.
# It stays up so that the IPFS node can continue serving the content to the
# IPFS network.

FROM christroutner/ct-base-ubuntu-nodev14
MAINTAINER Chris Troutner <chris.troutner@gmail.com>

# Set environment variables for building, passed in from Docker Compose.
ARG GATSBY_REPO
ENV GATSBY_REPO $GATSBY_REPO
ARG REPO_DIR
ENV REPO_DIR $REPO_DIR

# Build the Gatsby site for clearweb
WORKDIR /root
RUN echo "Building for repo: "$GATSBY_REPO
RUN git clone $GATSBY_REPO
WORKDIR /root/$REPO_DIR
RUN npm install
RUN npm run build

# Build the push-hash app for writing the IPFS hash to the blockchain.
WORKDIR /root
COPY push-hash push-hash
WORKDIR /root/push-hash
RUN npm install

# Install IPFS
WORKDIR /root
RUN wget https://dist.ipfs.io/go-ipfs/v0.6.0/go-ipfs_v0.6.0_linux-amd64.tar.gz
RUN tar -xvf go-ipfs_v0.6.0_linux-amd64.tar.gz
RUN rm go-ipfs_v0.6.0_linux-amd64.tar.gz
WORKDIR go-ipfs
RUN ./install.sh
RUN ipfs init

# Normal IPFS port. This must be exposed.
EXPOSE 4001
# IPFS API. Generally doesn't need to be exposed.
# EXPOSE 5001
# Gateway. Does not need to be exposed.
# EXPOSE 8080

# Create config file
RUN mkdir /root/config
VOLUME /root/config

WORKDIR /root
COPY startup-script.sh startup-script.sh
CMD ["./startup-script.sh"]
