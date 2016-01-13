#!/bin/sh
set -e
set -o errexit
set -o nounset

# HOST seems to be random when running this container, let's go with this
# as our project name

set -o xtrace
exec /usr/bin/docker-compose --project-name ${HOST} "$@"
