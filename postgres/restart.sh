#!/bin/bash

docker rm docker_postgres -f

BASEDIR=$(dirname "$0")
source "$BASEDIR"/run.sh "$1"

