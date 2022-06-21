#!/bin/bash

if [[ "$1" == "" ]]; then
  echo "Building with base tag"
  TAG="base"
else
  TAG="$1"
fi

BASEDIR=$(dirname "$0")

# make pg dump files
docker exec docker_postgres pg_dump -U postgres --format custom mg_cas > "${BASEDIR}/docker-entrypoint-initdb.d/cas_dump.pgdata"
docker exec docker_postgres pg_dump -U postgres --format custom coach_db > "${BASEDIR}/docker-entrypoint-initdb.d/coach_dump.pgdata"
docker exec docker_postgres pg_dump -U postgres --format custom gcg_platform > "${BASEDIR}/docker-entrypoint-initdb.d/gcg_dump.pgdata"
docker exec docker_postgres pg_dump -U postgres --format custom ing_gcg_platform > "${BASEDIR}/docker-entrypoint-initdb.d/ing_gcg_dump.pgdata"
docker exec docker_postgres pg_dump -U postgres --format custom gla360 > "${BASEDIR}/docker-entrypoint-initdb.d/gla_dump.pgdata"
docker exec docker_postgres pg_dump -U postgres --format custom sl_gla360 > "${BASEDIR}/docker-entrypoint-initdb.d/sl_gla_dump.pgdata"


docker pull postgres
docker image build -t docker_postgres:"$TAG" "$BASEDIR"
aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 549643135696.dkr.ecr.ap-northeast-2.amazonaws.com
docker tag docker_postgres:"$TAG" 549643135696.dkr.ecr.ap-northeast-2.amazonaws.com/db/postgres:"$TAG"
docker push 549643135696.dkr.ecr.ap-northeast-2.amazonaws.com/db/postgres:"$TAG"
#docker container run --rm -it --name docker_postgres docker_postgres
#mkdir -p "/var/lib/postgresql/data" && cp -r ./docker-entrypoint-initdb.d /var/lib/postgresql/data/

#docker run -d \
#  --name docker_postgres \
#  -e POSTGRES_PASSWORD=password \
#  -v local_dbdata:/var/lib/postgresql/data \
#  -p 54320:5432 postgres:11
