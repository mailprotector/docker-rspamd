FROM alpine:latest
LABEL maintainer="docker@mailprotector.com"
LABEL name="rspamd"

# install rspamd and pre-reqs
RUN echo '@community http://mirror.clarkson.edu/alpine/latest-stable/community/' >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache rspamd rspamd-controller rspamd-proxy ca-certificates tini

RUN mkdir /run/rspamd
COPY conf/ /etc/rspamd

CMD ["tini", "/usr/sbin/rspamd", "-i", "-f"]
EXPOSE 11334