FROM golang:alpine AS build-env

# Modified from original cosmos-sdk Dockerfile

ENV PACKAGES curl make git libc-dev bash gcc linux-headers eudev-dev
ENV CHAIN_ID=irishub
ENV VERSION=v0.13.1
ENV NETWORK=mainnet

# Set up dependencies
RUN apk add --no-cache $PACKAGES

# Set working directory for the build
WORKDIR /go/src/github.com/irisnet/

# Add source files
RUN git clone --recursive https://www.github.com/irisnet/irishub
WORKDIR /go/src/github.com/irisnet/irishub
RUN git checkout $VERSION

# Install minimum necessary dependencies, build Cosmos SDK, remove packages
RUN make

# # Final image
FROM alpine:edge

ENV IRIS_HOME=/.iris

# Install ca-certificates
RUN apk add --update ca-certificates

RUN mkdir -p /tmp/bin

WORKDIR /tmp/bin

# Copy over binaries from the build-env
COPY --from=build-env /go/bin/iris /tmp/bin
COPY --from=build-env /go/bin/iriscli /tmp/bin
RUN install -m 0755 -o root -g root -t /usr/local/bin `find . -maxdepth 1 -executable -type f`

RUN rm -r /tmp/bin

WORKDIR $IRIS_HOME

EXPOSE 26656 26657 26658
EXPOSE 1317

ADD ./scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod u+x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

STOPSIGNAL SIGINT





















# FROM ubuntu:16.04

# ENV IRISHOME=/.iris
# ENV CHAIN_ID=irishub
# ENV VERSION=0.13.1
# ENV NETWORK=mainnet

# # Install prerequisites
# RUN apt-get update && apt-get upgrade -y && apt-get install unzip wget -y

# # Download binaries
# RUN mkdir /tmp/iris
# WORKDIR /tmp/iris
# RUN wget https://github.com/irisnet/irishub/releases/download/v"$VERSION"/irishub_"$VERSION"_"$NETWORK"_linux_amd64.zip
# RUN unzip irishub_"$VERSION"_"$NETWORK"_linux_amd64.zip
# RUN install -m 0755 -o root -g root -t /usr/local/bin `find . -maxdepth 1 -executable -type f`
# RUN mkdir $IRISHOME
# WORKDIR $IRISHOME
# RUN rm -r /tmp/iris

# COPY /scripts/config.sh $IRISHOME/entrypoint.sh
# RUN chmod u+x entrypoint.sh
# # RUN sh config.sh
# # RUN rm $IRISHOME/config.sh

# EXPOSE 26656
# EXPOSE 26657
# EXPOSE 26658
# EXPOSE 6060

# STOPSIGNAL SIGINT

# ENTRYPOINT [ "entrypoint.sh" ]
# ADD ./scripts/start_iris.sh /usr/local/bin/start_iris.sh
# RUN chmod u+x /usr/local/bin/start_iris.sh
# CMD [ "/usr/local/bin/start_iris.sh" ]
