FROM python:3.8.5-alpine

WORKDIR /app

RUN apk add --no-cache --virtual .build-deps gcc musl-dev \
     && pip3 install autoremove-torrents \
     && apk del .build-deps gcc musl-dev

RUN touch autoremove-torrents.log

COPY config.example.yml config.yml

ENV OPTS ''

CMD autoremove-torrents "$OPTS" 





