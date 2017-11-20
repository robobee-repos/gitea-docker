FROM gitea/gitea:1.3.0-rc1

LABEL maintainer "Erwin Mueller <erwin.mueller@deventm.com>"

RUN set -x \
  && apk --no-cache add \
    wget \
    rsync \
    unzip

RUN set -x \
  && cd /tmp \
  && wget -nv -O gitea.zip https://github.com/go-gitea/gitea/archive/v1.3.0-rc1.zip \
  && unzip -q gitea.zip \
  && ls -l gitea-1.3.0-rc1 \
  && mkdir -p /var/www/html.dist \
  && rsync -r gitea-1.3.0-rc1/public/* /var/www/html.dist/ \
  && rm gitea.zip \
  && rm -rf gitea-1.3.0-rc1 \
  && chmod u=rX,g=rX,o=rX /var/www/html.dist

VOLUME ["/var/www/html"]

ADD rootfs/ /

RUN set -x \
  && chmod +x /*.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/bin/s6-svscan", "/etc/s6"]
