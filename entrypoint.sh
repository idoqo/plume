#!/bin/bash
set -e

# remove pre-existing server.pid to fix rails restart issue
if [[ "$@" == *"rails s"* ]]; then
  if [ -f /plume/tmp/pids/server.pid ]; then
    rm -f /plume/tmp/pids/server.pid
  fi
fi

# execute the container's main process

exec "$@"