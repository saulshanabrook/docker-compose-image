#!/usr/bin/env bash
set -e
set -o errexit
set -o nounset
set -o xtrace

function clean_up {
  docker rm -fv $(docker ps -a --format "{{.Names}}" | grep ${HOST})
}

trap clean_up EXIT

set -- /usr/local/bin/docker-entrypoint.sh
