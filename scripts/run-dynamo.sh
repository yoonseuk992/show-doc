#!/usr/bin/env bash

docker pull amazon/dynamodb-local

docker rm -f dynamodb

docker run -d \
  --name dynamodb \
  --publish 9000:8000 \
  amazon/dynamodb-local
