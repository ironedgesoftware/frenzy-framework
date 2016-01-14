#!/usr/bin/env bash

CONTAINER_NAME=frenzy;

docker ps -a --filter "name=${CONTAINER_NAME}" | grep frenzy >> /dev/null;

if [ $? -eq "0" ] ; then
    docker start frenzy && docker exec -ti frenzy bash;
else
    docker run --name frenzy -it -p 1234:80 -v "$PWD":/frenzy php:7-apache /frenzy/bin/dev/docker_helpers/initialize.sh;
fi