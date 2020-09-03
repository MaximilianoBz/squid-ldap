FROM ubuntu:focal
LABEL maintainer="mbaez@lunix.com.ar"

ENV SQUID_VERSION=4.10-1ubuntu1.2 \
    SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=squid

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y squid=${SQUID_VERSION}* ldap-utils ca-certificates \
 && rm -rf /var/lib/apt/lists/*

VOLUME ["/etc/squid"]

EXPOSE 3128/tcp

#Copy and run install script
#COPY ldap.config /opt/
#COPY squid-start.sh /opt/
#RUN chmod +x /opt/squid-start.sh
#ENTRYPOINT ["/opt/squid-start.sh"]
