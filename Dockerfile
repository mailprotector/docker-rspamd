FROM alpine:latest
LABEL maintainer="docker@mailprotector.com"
LABEL name="rspamd"

# install rspamd and pre-reqs
RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories && \
    apk update && \
    apk add --no-cache rspamd rspamd-controller rspamd-proxy ca-certificates tini

RUN mkdir /run/rspamd
COPY conf/ /etc/rspamd

CMD ["tini", "/usr/bin/rspamd", "-i", "-f"]
EXPOSE 11334