#!/bin/bash
set -e

# remove pre-existing server.pid to fix rails restart issue
rm -f /pidgin/tmp/pids/server.pid

# execute the container's main process

exec "$@"