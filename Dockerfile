FROM ubuntu:16.04

ENV IRISHOME=/.iris
ENV CHAIN_ID=irishub
ENV MONIKER=appealtoheaven
ENV VERSION=0.13.0-rc0
ENV NETWORK=mainnet

# Install prerequisites
RUN apt-get update && apt-get upgrade -y && apt-get install unzip wget -y

# Download binaries
RUN mkdir /tmp/iris
WORKDIR /tmp/iris
RUN wget https://github.com/irisnet/irishub/releases/download/v"$VERSION"/irishub_"$VERSION"_"$NETWORK"_linux_amd64.zip
RUN unzip irishub_"$VERSION"_"$NETWORK"_linux_amd64.zip
RUN install -m 0755 -o root -g root -t /usr/local/bin `find . -maxdepth 1 -executable -type f`
RUN mkdir $IRISHOME
WORKDIR $IRISHOME
RUN rm -r /tmp/iris

COPY scripts/config.sh $IRISHOME
RUN chmod u+x config.sh
RUN sh config.sh

EXPOSE 26658
EXPOSE 6060
EXPOSE 26657
EXPOSE 26656

ADD ./scripts/start_iris.sh /usr/local/bin/start_iris.sh
RUN chmod u+x /usr/local/bin/start_iris.sh
CMD [ "/usr/local/bin/start_iris.sh" ]

