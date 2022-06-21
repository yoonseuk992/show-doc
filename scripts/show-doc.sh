#!/usr/bin/env bash

BASEDIR=$(dirname "$0")


if [[ "$1" == "" ]]; then
  echo "Type in the doc name to read doc."
  echo -e "\033[1;31mShow Choices are: \033[0m"
  cd "${BASEDIR}"/../doc && ls
  exit 0
fi

# shellcheck disable=SC2164
cd "${BASEDIR}"/../doc
echo -en "\033[1;36m"
cat "$1"
echo -en "\033[0m"
