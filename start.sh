#!/bin/bash

if [ ! -f "/config/btsync.conf" ]; then
  cp /etc/btsync/btsync.conf.default /config/btsync.conf
fi

if [ ! -d "/data/.sync" ]; then
  mkdir /data/.sync
fi

if [ -f "/var/run/btsync/btsync.pid" ]; then
	rm /var/run/btsync/btsync.pid
fi

/usr/bin/btsync --nodaemon --config /config/btsync.conf $@
