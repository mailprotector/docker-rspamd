#!/bin/sh

# LOGFILE="/var/log/rspamd/rspamd.log"

# mkdir -p /var/log/rspamd
# if [ ! -f $LOGFILE ]; then
#     touch $LOGFILE
#     chown rspamd:rspamd $LOGFILE
# fi

# exec tail -f $LOGFILE &
exec "$@"