FROM debian:10.5
LABEL maintainer="mbaez@lunix.com.ar"

ENV SQUID_VERSION=4.6-1+deb10u4 \
    SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=proxy

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y squid=${SQUID_VERSION}* ldap-utils ca-certificates squid-langpack squid-purge\
 && rm -rf /var/lib/apt/lists/*

VOLUME ["/etc/squid"]

EXPOSE 3128/tcp

#Copy and run install script
COPY entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh
ENTRYPOINT ["/opt/entrypoint.sh"]

