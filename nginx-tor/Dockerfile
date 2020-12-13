# This Docker container builds the Gatsby website, then publishes it through
# Nginx.

FROM christroutner/ct-base-ubuntu-nodev14 as builder
MAINTAINER Chris Troutner <chris.troutner@gmail.com>

# Build the Gatsby site for clearweb
WORKDIR /root
RUN git clone https://github.com/christroutner/gatsby-ipfs-personal-blog
WORKDIR /root/gatsby-ipfs-personal-blog
RUN npm install
RUN npm run build

# Build the Gatsby site for IPFS
#RUN rm -rf public
#RUN npm run build:ipfs
#RUN cp -r public /ipfs

FROM nginx
EXPOSE 80
COPY --from=builder /root/gatsby-ipfs-personal-blog/public /usr/share/nginx/html

#COPY dummyapp.js dummyapp.js
#CMD ["node", "dummyapp.js"]
