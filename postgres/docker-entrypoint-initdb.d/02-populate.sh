#!/bin/bash

cas_file="/docker-entrypoint-initdb.d/cas_dump.pgdata"
coach_file="/docker-entrypoint-initdb.d/coach_dump.pgdata"
gcg_file="/docker-entrypoint-initdb.d/gcg_dump.pgdata"
ing_gcg_file="/docker-entrypoint-initdb.d/ing_gcg_dump.pgdata"
gla_file="/docker-entrypoint-initdb.d/gla_dump.pgdata"
sl_gla_file="/docker-entrypoint-initdb.d/sl_gla_dump.pgdata"

cas_dbname=mg_cas
coach_dbname=coach_db
gcg_dbname=gcg_platform
ing_gcg_dbname=ing_gcg_platform
gla_dbname=gla360
sl_gla_dbname=sl_gla360

echo "Restoring DB using $cas_file"
pg_restore -U admin --dbname=$cas_dbname --verbose --single-transaction < "$cas_file" || exit 1

echo "Restoring DB using $coach_file"
pg_restore -U admin --dbname=$coach_dbname --verbose --single-transaction < "$coach_file" || exit 1

echo "Restoring DB using $gcg_file"
pg_restore -U admin --dbname=$gcg_dbname --verbose --single-transaction < "$gcg_file" || exit 1

echo "Restoring DB using $ing_gcg_file"
pg_restore -U admin --dbname=$ing_gcg_dbname --verbose --single-transaction < "$ing_gcg_file" || exit 1

echo "Restoring DB using $gla_file"
pg_restore -U admin --dbname=$gla_dbname --verbose --single-transaction < "$gla_file" || exit 1

echo "Restoring DB using $gla_file"
pg_restore -U admin --dbname=$sl_gla_dbname --verbose --single-transaction < "$sl_gla_file" || exit 1
