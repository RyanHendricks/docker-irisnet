FROM golang:1.15-alpine AS build-env

ENV PACKAGES curl make git libc-dev bash gcc linux-headers eudev-dev
ENV VERSION=v1.0.1

# Set up dependencies
RUN apk add --no-cache $PACKAGES

# Set working directory for the build
WORKDIR /go/src/github.com/irisnet/

# Add source files
RUN git clone --recursive https://www.github.com/irisnet/irishub
WORKDIR /go/src/github.com/irisnet/irishub
RUN git checkout $VERSION

# Build
RUN make build
RUN make install

# Final image
FROM alpine:edge

ENV IRIS_HOME=/.iris

# Install runtime dependencies
RUN apk add --no-cache --update ca-certificates py3-setuptools supervisor wget lz4 unzip

# Create + enter a temp directory for copying binaries
WORKDIR /tmp/bin

# Copy over binaries from the build-env
COPY --from=build-env /go/bin/iris /tmp/bin
RUN install -m 0755 -o root -g root -t /usr/local/bin iris

WORKDIR $IRIS_HOME
RUN rm -r /tmp/bin

# Add supervisor configuration files
RUN mkdir -p /etc/supervisor/conf.d/
COPY /supervisor/supervisord.conf /etc/supervisor/supervisord.conf 
COPY /supervisor/conf.d/* /etc/supervisor/conf.d/

EXPOSE 26656 26657 26658
EXPOSE 1317

COPY ./scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod u+x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

STOPSIGNAL SIGINT