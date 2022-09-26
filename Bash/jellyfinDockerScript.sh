#!/bin/bash

# Author Data:
#
#	Author:		Luke O'Brien
#	Updated:	9/25/2022
#
#	Description:
#		Script will create persistant docker volumes to 
#		store jellyfin cache and config data on before 
#		downloading/starting jellyfin/jellyfin container

APP_USER=lobrien
MEDIA_LOCATION=/media/jelyfin


# Checks to see if the Jellyfin-config volume exsists
# If it doesn't then it'll create the volume
if [[ "$(docker volume ls)" == *"jellyfin-config"* ]]; then
	echo "Config Volume Exsists; Skipping creation"
else
#	docker volume create jellyfin-config
	echo "CREATING VOLUME"
fi


# Checks to see if the Jellyfin-Cache volume exsists
# If it doesn't then it'll create the volume
if [[ "$(docker volume ls)" == *"jellyfin-cache"* ]]; then
	echo "Cache Volume Exsists; Skipping creation"
else
#	docker volume create jellyfin-cache
	echo "CREATING VOLUME"
fi


# Will attempt to run the jellyfin/jellyfin docker image
# If image is not on host, then it'll try downloading it
docker run -d \
	--name jellyfin \
	--user $(id -u ${APP_USER}):$(id -g ${APP_USER}) \
	--volume jellyfin-config:/config/ \
	--volume jellyfin-cache:/cache/ \
	--mount type=bind,source=${MEDIA_LOCATION},target=/media \
	--restart=unless-stopped \
	-p 8096:8096 \
	jellyfin/jellyfin

# The above statement's options and their meanings
#
# --name jellyfin			Names the container jellyfin
# --user {UserID}:{GroupID}		Sets container ownership to APP_USER
# --volume jellyfin-config:/config/	Mounts host volume 'jellyfin-config' to /config/
# --volume jellyfin-cache/cache/	Mounts host volume 'jellyfin-cache' to /cache/
#
# --mount type=bind,source=/media/jellyfin,target=/media
#					Mounts locations of media stored in MEDIA_LOCATION 
#					to /media on container
#
# --restart=unless-stopped		Sets restart container on interuption unless manually stopped
# -p 8096:8096				Exposed port 8096 to host from port 8096 on container
#						<hostPort>:<containerPort>
#
# jellyfin/jellyfin			Image for docker container to use
