FROM python:3.8.5-slim

WORKDIR /app

RUN apt-get update \
&& apt-get install gcc cron -y -q \
&& pip3 install autoremove-torrents \
&& apt-get purge gcc -y \
&& apt-get clean

ADD cron.sh /usr/bin/cron.sh
RUN chmod +x /usr/bin/cron.sh

ADD ./crontab /etc/cron.d/cron-jobs
RUN chmod 0644 /etc/cron.d/cron-jobs

RUN touch /var/log/autoremove-torrents.log

RUN touch /var/log/cron.log

COPY config.example.yml config.yml

ENV OPTS ''

ENTRYPOINT ["/bin/sh", "/usr/bin/cron.sh"]





