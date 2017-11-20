#!/bin/bash
set -e

source /docker-entrypoint-utils.sh
set_debug
echo "Running as `id`"

sync_dir "/var/www/html.dist" "/var/www/html" skip

exec "$@"
