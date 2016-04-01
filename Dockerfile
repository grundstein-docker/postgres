# grundstein/postgres dockerfile
# VERSION 0.0.1

FROM alpine:3.3

MAINTAINER Wizards & Witches <dev@wiznwit.com>
ENV REFRESHED_AT 2016-29-03

RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && apk update

RUN apk add curl "postgresql@edge>9.4" "postgresql-contrib@edge>9.4" \
    && mkdir /docker-entrypoint-initdb.d \
    && curl \
        -o /usr/local/bin/gosu \
        -sSL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64" \
    && chmod +x /usr/local/bin/gosu \
    && apk del curl \
    && rm -rf /var/cache/apk/*

ARG PORT
ARG PGDATA

VOLUME ${PGDATA}

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE ${PORT}

CMD ["postgres"]
