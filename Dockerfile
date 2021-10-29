FROM alpine:latest
LABEL maintainer="devops@mailprotector.net"
LABEL name="rspamd"

# install rspamd and pre-reqs
RUN echo '@community http://mirror.clarkson.edu/alpine/latest-stable/community/' >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache rspamd bash tini

COPY entrypoint.sh /entrypoint.sh
COPY conf/ /etc/rspamd

ENTRYPOINT ["/entrypoint.sh"]
CMD ["tini", "/usr/sbin/rspamd", "-i", "-f"]
EXPOSE 11331