![https://gitlab.com/appealtoheavenllc/docker-irisnet](https://gitlab.com/appealtoheavenllc/docker-irisnet/badges/master/pipeline.svg)

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