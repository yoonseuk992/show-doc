FROM postgres:11
COPY ./docker-entrypoint-initdb.d/ docker-entrypoint-initdb.d
ENV PGDATA=/data
ENV POSTGRES_PASSWORD=password

