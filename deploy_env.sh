#!/bin/bash

apt-get update
apt-get install -y net-tools vim htop mc openssh-server git make sudo
echo -e "127.0.0.1\trjada.42.fr" | tee -a /etc/hosts > /dev/null
echo -e "127.0.0.1\twww.rjada.42.fr" | tee -a /etc/hosts > /dev/null
apt-get install -y ca-certificates curl gnupg lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
usermod -aG sudo rjada
usermod -aG docker rjada