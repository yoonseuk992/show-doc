#!/bin/bash

if [[ "$1" == "" ]]; then
  echo "Launching DB with empty data"
  TAG="base"
else
  TAG="$1"
fi

aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 549643135696.dkr.ecr.ap-northeast-2.amazonaws.com

docker pull 549643135696.dkr.ecr.ap-northeast-2.amazonaws.com/db/postgres:"$TAG"
docker run -d \
  --name docker_postgres \
  --publish 5432:5432 \
  549643135696.dkr.ecr.ap-northeast-2.amazonaws.com/db/postgres:"$TAG"
