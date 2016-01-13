#!/bin/sh
set -e
set -o errexit
set -o nounset
set -o xtrace
exec /usr/bin/docker-compose --project-name $(cat /usr/docker-compose-project-name) "$@"
