FROM python:3.13-slim

ARG VERSION='1.5.5'

WORKDIR /app

RUN pip install autoremove-torrents==$VERSION

RUN apt-get update \
 && apt-get install -y --no-install-recommends cron \
 && rm -rf /var/lib/apt/lists/*

ADD cron.sh /usr/bin/cron.sh
RUN chmod +x /usr/bin/cron.sh

RUN touch /var/log/autoremove-torrents.log

COPY config.example.yml config.yml

ENV OPTS='-c /app/config.yml'
ENV CRON='*/5 * * * *'

ENTRYPOINT ["/bin/sh", "/usr/bin/cron.sh"]
