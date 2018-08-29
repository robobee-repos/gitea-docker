FROM gitea/gitea:1.5.0

LABEL maintainer "Erwin Mueller <erwin.mueller@deventm.com>"

RUN set -x \
  && apk --no-cache add \
    wget \
    rsync \
    unzip

ENV DEBUG=false \
  WEB_ROOT="/var/www/html" \
  GITEA_SRC_DIR="/usr/src/gitea" \
  GITEA_VERSION="1.5.0" \
  GITEA_SHA="d9be2564f6b504c0b9f58bc69d875e8536517c21f9641ff7a17d33e1d31d96e0" \
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
