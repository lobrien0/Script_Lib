#!/bin/bash

#Removes anything docker just incase it was installed
apt remove docker docker-engine docker.io containerd runc

#Update repository and download dependancies
apt update
apt install ca-certificates \
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
