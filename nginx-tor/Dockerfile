# This Docker container builds the Gatsby website, then publishes it through
# Nginx.

FROM christroutner/ct-base-ubuntu-nodev14 as builder
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

FROM nginx
EXPOSE 80
COPY --from=builder /root/$REPO_DIR/public /usr/share/nginx/html

#COPY dummyapp.js dummyapp.js
#CMD ["node", "dummyapp.js"]
