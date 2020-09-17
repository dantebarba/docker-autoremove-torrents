FROM python:3.8.5-slim

WORKDIR /app

RUN pip3 install autoremove-torrents

RUN touch autoremove-torrents.log

COPY config.example.yml config.yml

ENV OPTS ''

CMD autoremove-torrents "$OPTS" 





