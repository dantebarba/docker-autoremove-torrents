FROM python:3.8.5-slim

WORKDIR /app

RUN apt-get update \
&& apt-get install gcc cron -y -q \
&& pip3 install autoremove-torrents \
&& apt-get purge gcc -y \
&& apt-get clean

ADD cron.sh /usr/bin/cron.sh
RUN chmod +x /usr/bin/cron.sh

RUN touch /var/log/autoremove-torrents.log

COPY config.example.yml config.yml

ENV OPTS '-c /app/config.yml'
ENV CRON '*/5 * * * *'

ENTRYPOINT ["/bin/sh", "/usr/bin/cron.sh"]