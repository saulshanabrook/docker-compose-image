#!/usr/bin/env bash
set -e
set -o errexit
set -o nounset
set -o xtrace

echo "dind$RANDOM" > /usr/docker-compose-project-name

function clean_up {
  docker rm -fv $(docker ps -a --format "{{.Names}}" | grep $(cat /usr/docker-compose-project-name)) || true
  sleep 30m
}

trap clean_up EXIT

export DOCKER_HOST='tcp://docker:2375'

"$@"
