FROM gitea/gitea:1.8.1

LABEL maintainer "Erwin Mueller <erwin.mueller@deventm.com>"

RUN set -x \
  && apk --no-cache add \
    wget \
    rsync \
    unzip

ENV DEBUG=false \
  WEB_ROOT="/var/www/html" \
  GITEA_SRC_DIR="/usr/src/gitea" \
  GITEA_VERSION="1.8.1" \
  GITEA_SHA="50337bacc069a8cb1d1eb78fa42de2f17a995212c7bccac735c3c3bdf57f8551" \
  SYNC_ENABLED="true" \
  SYNC_TIME_S="300" \
  PIWIK_JAVASCRIPT="" \
  GOOGLE_ANALYTICS_JAVASCRIPT=""

RUN set -x \
  && cd /tmp \
  && wget -nv -O gitea.zip https://github.com/go-gitea/gitea/archive/v${GITEA_VERSION}.zip \
  && unzip -q gitea.zip \
  && mkdir -p /usr/src \
  && mv gitea-${GITEA_VERSION} ${GITEA_SRC_DIR} \
  && rm gitea.zip \
  && mkdir -p /var/www/html

VOLUME ["/var/www/html"]

ADD rootfs/ /

RUN set -x \
  && chmod +x /*.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/bin/s6-svscan", "/etc/s6"]
