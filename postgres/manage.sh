#!/bin/bash

if [[ "$1" == "" ]]; then
  echo "Type a command: [run, psql, delete, build, restart]"
  exit 0
fi
BASEDIR=$(dirname "$0")
CMD=$1

sh "$BASEDIR"/"$CMD".sh "$2"

