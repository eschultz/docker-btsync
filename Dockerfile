FROM ubuntu:14.04
MAINTAINER Eric Schultz <eric@startuperic.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q
RUN apt-get install -qy curl

RUN curl -o /usr/bin/btsync.tar.gz http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz

ADD ./btsync.conf.default /etc/btsync/btsync.conf.default

ADD ./start.sh /start.sh
RUN chmod u+x /start.sh

VOLUME /config
VOLUME /data

# Web GUI
EXPOSE 8888
# Listening port
EXPOSE 55555

ENTRYPOINT ["/start.sh"]
