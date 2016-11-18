# grundstein/postgres dockerfile
# VERSION 0.0.1

FROM alpine:3.4

MAINTAINER Wizards & Witches <dev@wiznwit.com>
ENV REFRESHED_AT 2016-18-11

RUN apk update \
    && apk add su-exec "postgresql" "postgresql-contrib" \
    && mkdir /docker-entrypoint-initdb.d \
    && rm -rf /var/cache/apk/*

VOLUME /home/data/postgresql

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["postgres"]
