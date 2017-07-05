FROM resin/rpi-raspbian

COPY registry /
COPY config.yml /etc/docker/registry/config.yml

RUN apt-get update -qq && \
    apt-get -qqy install ca-certificates && \ 
    apt-get autoremove -y && \
    apt-get clean && \
    rm --force --recursive /var/lib/apt/lists/* /tmp/* /var/tmp/* 

CMD ["/registry", "serve", "/etc/docker/registry/config.yml"]