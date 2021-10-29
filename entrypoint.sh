#!/bin/bash
set -m

REDIS_PORT=$(env | grep "REDIS_PORT" | awk -F "=" '{print $2}')
REDIS_WRITE=$(env | grep "REDIS_WRITE" | awk -F "=" '{print $2}')
REDIS_READ=$(env | grep "REDIS_READ" | awk -F "=" '{print $2}')
CLAMAV_HOST=$(env | grep "CLAMAV_HOST" | awk -F "=" '{print $2}')

if [ -z $REDIS_PORT ]
then
  REDIS_PORT="6379"
fi

if [ -z $REDIS_WRITE ]
then 
  REDIS_WRITE="redis"
fi

echo "entrypoint: setting redis write node - $REDIS_WRITE:$REDIS_PORT"
sed -i "s|REDIS_WRITE|$REDIS_WRITE:$REDIS_PORT|g" "/etc/rspamd/local.d/redis.conf"

if [ ! -z $REDIS_READ ]
then
  echo "entrypoint: setting redis read node - $REDIS_READ:$REDIS_PORT"
  echo "read_servers = "$REDIS_READ:$REDIS_PORT";" | cat >> "/etc/rspamd/local.d/redis.conf"
fi

if [ ! -z $CLAMAV_HOST ]
then
  echo "entrypoint: enabling clamav and setting host - $CLAMAV_HOST"
  cat /etc/rspamd/temp/clamav.conf >> /etc/rspamd/local.d/antivirus.conf
  sed -i "s|CLAMAV_HOST|$CLAMAV_HOST|g" "/etc/rspamd/local.d/antivirus.conf"
fi

LOGFILE="/var/log/rspamd/rspamd.log"

mkdir -p /var/log/rspamd
if [ ! -f $LOGFILE ]; then
    touch $LOGFILE
    chown rspamd:rspamd $LOGFILE
fi

exec tail -f $LOGFILE &
exec "$@"