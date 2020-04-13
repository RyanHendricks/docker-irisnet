# Docker-Irisnet

Dockerized Iris Node

---

[![MicroBadger Version](https://images.microbadger.com/badges/version/ryanhendricks/docker-irisnet.svg)](https://microbadger.com/images/ryanhendricks/docker-irisnet)
[![CircleCI (all branches)](https://img.shields.io/circleci/project/github/RyanHendricks/docker-irisnet.svg?label=build&logo=circleci&logoColor=white)](https://circleci.com/gh/RyanHendricks/docker-irisnet)
[![Docker Pulls](https://img.shields.io/docker/pulls/ryanhendricks/docker-irisnet.svg?logo=docker&logoColor=white)](https://hub.docker.com/r/ryanhendricks/docker-irisnet)

[![MicroBadger Version](https://images.microbadger.com/badges/version/ryanhendricks/docker-irisnet:v0.15.3.svg)](https://microbadger.com/images/ryanhendricks/docker-irisnet:v0.15.3)
[![MicroBadger Layers (latest)](https://img.shields.io/microbadger/layers/ryanhendricks/docker-irisnet/latest.svg?logo=docker&logoColor=white)](https://microbadger.com/images/ryanhendricks/docker-irisnet)


## Getting Started

- Customize the configuration within scripts/config.sh
- Change ENV variables in Dockerfile (if needed)

## Start Node

```bash
docker-compose up -d --build
```

## Notes

This setup is meant to provide a full node only and not recommended for running a validator node. Although with some additional configuration to the node and the server where it will be running it is entirely possible to do so.
