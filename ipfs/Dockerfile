FROM christroutner/ct-base-ubuntu-nodev14
MAINTAINER Chris Troutner <chris.troutner@gmail.com>

# Build the Gatsby site for clearweb
WORKDIR /root
RUN git clone https://github.com/christroutner/gatsby-ipfs-personal-blog
WORKDIR /root/gatsby-ipfs-personal-blog
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
EXPOSE 4001 5001 8080

# Create config file
RUN mkdir /root/config
VOLUME /root/config

WORKDIR /root
COPY startup-script.sh startup-script.sh
CMD ["./startup-script.sh"]
