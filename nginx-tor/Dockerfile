FROM christroutner/ct-base-ubuntu-nodev14 as builder
MAINTAINER Chris Troutner <chris.troutner@gmail.com>

RUN mkdir /clearweb
RUN mkdir /ipfs

# Build the Gatsby site for clearweb
WORKDIR /root
RUN git clone https://github.com/Permissionless-Software-Foundation/gatsby-ipfs-web-wallet
WORKDIR /root/gatsby-ipfs-web-wallet
RUN npm install
RUN npm run build
RUN cp -r public /clearweb

# Build the Gatsby site for IPFS
#RUN rm -rf public
#RUN npm run build:ipfs
#RUN cp -r public /ipfs

FROM nginx
EXPOSE 80
COPY --from=builder /clearweb/public /usr/share/nginx/html

#COPY dummyapp.js dummyapp.js
#CMD ["node", "dummyapp.js"]
