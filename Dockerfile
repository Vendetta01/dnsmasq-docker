FROM confd:latest
LABEL local.podewitz.dnsmasq-docker.maintainer="nils.podewitz@googlemail.com"

RUN apk --no-cache add dnsmasq bash supervisor

RUN rm /etc/dnsmasq.conf

COPY etc/ etc/
COPY scripts/* /usr/bin/

EXPOSE 53/tcp 53/udp

#run!
ENTRYPOINT ["docker_entrypoint.sh"]

