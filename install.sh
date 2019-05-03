#!/bin/bash

sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo apt install cockpit -y
sudo systemctl enable cockpit.socket
sudo systemctl start cockpit.socket
curl https://get.acme.sh | sh
chmod +x ./.cube/gc/gc.sh
cd ./.cube/gc/
./gc.sh
