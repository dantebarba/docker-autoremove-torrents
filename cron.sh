#!/usr/bin/env bash

if [ -z "$CRON" ]
  then
    echo "INFO: No CRON setting found. Running autoremove once."
    /usr/local/bin/autoremove-torrents $OPTS
  else
    # Setup cron schedule
    echo "$CRON /usr/local/bin/autoremove-torrents $OPTS >> /var/log/autoremove-torrents.log 2>&1" > /tmp/crontab.tmp
    crontab /tmp/crontab.tmp
    crontab -l
    rm /tmp/crontab.tmp
    # Start cron
    echo "INFO: Starting cron ..."
    touch /var/log/crond.log
    cron -f &
    echo "INFO: cron started"
    tail -F /var/log/crond.log /var/log/autoremove-torrents.log
  fi
fi