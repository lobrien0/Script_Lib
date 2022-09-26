#!/bin/bash

docker run -d \
	--name jellyfin \
	--user $(id -u lobrien):$(id -g lobrien) \
	--volume jellyfin-config:/config \
	--volume jellyfin-cache:/cache \
	--mount type=bind,source=/media/jellyfin,target=/media \
	--restart=unless-stopped \
	-p 8096:8096 \
	jellyfin/jellyfin
