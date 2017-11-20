FROM gitea/gitea:1.3.0-rc1
LABEL maintainer "Erwin Mueller <erwin.mueller@deventm.com>"

ADD rootfs/ /

RUN set -x \
  && chmod +x /*.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/bin/s6-svscan", "/etc/s6"]
