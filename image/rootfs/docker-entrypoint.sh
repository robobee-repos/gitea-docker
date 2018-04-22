#!/bin/bash
set -e

function attach_piwik_js() {
  if [[ -z "${PIWIK_JAVASCRIPT}" ]]; then
    return
  fi
  mkdir -p /data/gitea/templates/base
  cd /data/gitea/templates/base
  file="footer.tmpl"
  cp ${GITEA_SRC_DIR}/templates/base/${file} .
  tmp=$(mktemp)
  trap "{ rm -f $tmp; }" EXIT
  cat << EOF > $tmp
$PIWIK_JAVASCRIPT
EOF
  n=$(sed -n '/<\/body>/=' $file)
  n=$((n-1))
  sed -i "${n}r $tmp" $file
}

source /docker-entrypoint-utils.sh
set_debug
echo "Running as `id`"

sync_dir "/usr/src/gitea/public" "/var/www/html"

if [[ -d /custom-in ]]; then
  mkdir -p /data/gitea
fi
sync_dir "/custom-in" "/data/gitea" skip

attach_piwik_js

exec "$@"
