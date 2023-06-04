FROM alpine:3.14

ARG BUILD_DATE
ARG VCS_REF

RUN	apk update --no-cache && \
    	apk upgrade --no-cache && \
	apk add --no-cache mariadb mariadb-client mariadb-server-utils pwgen tzdata && \
	rm -f /var/cache/apk/*

COPY files/run.sh /scripts/run.sh
RUN mkdir /docker-entrypoint-initdb.d && \
    mkdir /scripts/pre-exec.d && \
    mkdir /scripts/pre-init.d && \
    chmod -R 755 /scripts

EXPOSE 3306


ENTRYPOINT ["/scripts/run.sh"]


