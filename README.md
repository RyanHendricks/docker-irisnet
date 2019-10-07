![https://gitlab.com/appealtoheavenllc/docker-irisnet](https://gitlab.com/appealtoheavenllc/docker-irisnet/badges/master/pipeline.svg)

[![MicroBadger Version](https://images.microbadger.com/badges/version/ryanhendricks/docker-irisnet:v0.15.3.svg)](https://microbadger.com/images/ryanhendricks/docker-irisnet:v0.15.3)
[![CircleCI (all branches)](https://img.shields.io/circleci/project/github/RyanHendricks/docker-irisnet/tree/master.svg?label=build&logo=circleci&logoColor=white)](https://circleci.com/gh/RyanHendricks/docker-irisnet/tree/master)
[![Docker Pulls](https://img.shields.io/docker/pulls/ryanhendricks/docker-irisnet.svg?logo=docker&logoColor=white)](https://hub.docker.com/r/ryanhendricks/docker-irisnet)
`

[![CircleCI](https://circleci.com/gh/RyanHendricks/docker-irisnet/tree/master.svg?style=svg&circle-token=5a11bae20d4346a49ee28e97d89c186f711a407c)](https://circleci.com/gh/RyanHendricks/docker-irisnet/tree/master)


[![MicroBadger Layers (latest)](https://img.shields.io/microbadger/layers/ryanhendricks/docker-irisnet/latest.svg?logo=docker&logoColor=white)](https://microbadger.com/images/ryanhendricks/docker-irisnet)
[![MicroBadger Image-Size (latest)](https://img.shields.io/microbadger/image-size/ryanhendricks/docker-irisnet:latest.svg?logo=docker&logoColor=white)](https://microbadger.com/images/ryanhendricks/docker-irisnet)

[![Codacy grade](https://img.shields.io/codacy/grade/c35da045d95b4f07b09948d19bacaa47.svg?logo=codacy)](https://www.codacy.com?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=RyanHendricks/docker-irisnet&amp;utm_campaign=Badge_Grade)

# Docker IrisNet

## Getting Started

- Customize the configuration within scripts/config.sh
- Change ENV variables in Dockerfile (if needed)

## Start Node

```bash
docker-compose up -d --build
```

## Notes

This setup is meant to provide a full node only and not recommended for running a validator node. Although with some additional configuration to the node and the server where it will be running it is entirely possible to do so.
