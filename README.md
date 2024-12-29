# Minecraft GTNH Server Docker

Simple container to run a Minecraft GregTech: New Horizons 2.7.1 Server

## Getting Started

These instructions will cover usage information and for the docker container 

### Prerequisities


In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Building the container

Run the following command to build the image from the Dockerfile

```shell
docker build -t minecraft-gtnh:1.0 .
```

#### Running the container

Use one of the following commands to run the container

```shell
docker compose up
```
or use the following to run the container detached in the background
```shell
docker compose up -d
```

All files in the data volume will be saved every 5 minutes. If you want to manually save those you can run following command to execute a savedata script in the container.
Use `docker ps` to find the container name

```shell
docker exec my-container-name ./savedata.sh
```

#### Volumes

* `data` - config files
* `logs` - server logs
* `worlds` - worlds directory