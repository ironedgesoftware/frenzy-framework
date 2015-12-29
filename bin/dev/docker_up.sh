#!/usr/bin/env bash

docker run -it -p 1234:80 -v "$PWD":/frenzy php:7-apache /frenzy/bin/dev/docker_helpers/initialize.sh