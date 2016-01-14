#!/usr/bin/env bash
set -e
set -o errexit
set -o nounset
set -o xtrace

export COMPOSE_PROJECT_NAME="dind$(cat /proc/sys/kernel/random/uuid  | sed 's/-//g')"

function clean_up {
  sleep 1h
  docker rm -fv $(docker ps -a --format "{{.Names}}" | grep $COMPOSE_PROJECT_NAME) || true
}

trap clean_up EXIT

export DOCKER_HOST='tcp://docker:2375'

"$@"
