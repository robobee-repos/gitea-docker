#!/bin/bash
set -e

function attach_piwik_js() {
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

function attach_google_analytics_js() {
  mkdir -p /data/gitea/templates/custom
  cd /data/gitea/templates/custom
  file="body_outer_pre.tmpl"
  cat << EOF > ${file}
$GOOGLE_ANALYTICS_JAVASCRIPT
EOF
}

source /docker-entrypoint-utils.sh
set_debug
echo "Running as `id`"

if is_sync_enabled && check_update_time ${WEB_ROOT}; then
  sync_dir "/usr/src/gitea/public" ${WEB_ROOT}
  update_update_time ${WEB_ROOT}
fi

if [[ -d /custom-in ]]; then
  mkdir -p /data/gitea
  sync_dir "/custom-in" "/data/gitea" skip
fi

if [[ -n "${PIWIK_JAVASCRIPT}" ]]; then
  attach_piwik_js
fi

if [[ -n "${GOOGLE_ANALYTICS_JAVASCRIPT}" ]]; then
  attach_google_analytics_js
fi

cd ${WEB_ROOT}
/usr/bin/entrypoint "$@"
