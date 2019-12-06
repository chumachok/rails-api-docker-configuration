#!/bin/bash
set -e
rm -f /blog/tmp/pids/server.pid
# execute CMD in the Dockerfile
exec "$@"