# grundstein/postgres dockerfile
# VERSION 0.0.1

FROM alpine:3.4

MAINTAINER Wizards & Witches <dev@wiznwit.com>
ENV REFRESHED_AT 2016-29-10

RUN apk update \
    && apk add su-exec "postgresql" "postgresql-contrib" \
    && mkdir /docker-entrypoint-initdb.d \
    && rm -rf /var/cache/apk/*


ARG PORT
ARG PGDATA

VOLUME ${PGDATA}

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE ${PORT}

CMD ["postgres"]
