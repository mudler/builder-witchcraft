#!/bin/bash


if [ "${#}" -lt 1 ]; then
	echo "${0} <package> <package> ..." >&2 /dev/null
	echo "example: ${0} app-text/tree" >&2 /dev/null
	exit 1
fi

if [ ! -d "$PWD"/artifacts ]; then
  mkdir "$PWD"/artifacts
fi

docker pull mudler/builder-witchcraft:latest
docker run -i --rm -v "$PWD"/artifacts:/usr/portage/packages -u $(id -u) mudler/builder-witchcraft:latest 
witchcraft 
pack "${@}"
