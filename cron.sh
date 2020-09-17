#!/usr/bin/env bash

if [ -z "$CRON" ]
  then
    echo "INFO: No CRON setting found. Running autoremove once."
    /usr/bin/autoremove-torrents $OPTS
  else
    # Setup cron schedule
    crontab -d
    echo "$CRON /usr/bin/autoremove-torrents $OPTS >> /var/log/autoremove-torrents.log 2>&1" > /tmp/crontab.tmp
    crontab /tmp/crontab.tmp
    rm /tmp/crontab.tmp

    # Start cron
    echo "INFO: Starting crond ..."
    touch /var/log/crond.log
    crond -b -l 0 -L /var/log/crond.log
    echo "INFO: crond started"
    tail -F /var/log/crond.log /var/log/autoremove-torrents.log
  fi
fi