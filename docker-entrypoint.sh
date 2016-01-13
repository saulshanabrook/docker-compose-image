#!/usr/bin/env bash
set -e
set -o errexit
set -o nounset
set -o xtrace

export COMPOSE_PROJECT_NAME="dind$RANDOM"

function clean_up {
  docker rm -fv $(docker ps -a --format "{{.Names}}" | grep $COMPOSE_PROJECT_NAME) || true
}

trap clean_up EXIT

export DOCKER_HOST='tcp://docker:2375'

"$@"
