#!/bin/bash

# Author Data:
#
#	Author/Owner:	Docker inc.
#	Compiled by:	Luke O'Brien
#	Updated:	9/25/2022
#
#	Note:
#		The commands are pulled from Docker inc.'s website
#		and they are to credit for those.
#		All I have done is compile them into this script
#		To make it easier to install.
#
#	Description:
#		The following is written to install the Docker Engine
#		on an Ubuntu arm64 machine
#
#		Run as SuperUser


#Removes anything docker just incase it was installed
apt remove docker docker-engine docker.io containerd runc

#Update repository and download dependancies
apt update
apt install -y ca-certificates \
	curl \
	gnupg \
	lsb-release

#Directory Creation
mkdir -p /etc/apt/keyrings

#Download and Extract GnuPG Encryption Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#Adding Repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#Update Repository and download docker
apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

#Install Done
