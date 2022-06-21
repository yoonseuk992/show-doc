#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER admin WITH PASSWORD 'password';
    CREATE DATABASE mg_cas;
    CREATE DATABASE coach_db;
    CREATE DATABASE gcg_platform;
    CREATE DATABASE ing_gcg_platform;
    CREATE DATABASE gla360;
    CREATE DATABASE sl_gla360;
    ALTER USER admin WITH SUPERUSER CREATEDB CREATEROLE LOGIN;
EOSQL
