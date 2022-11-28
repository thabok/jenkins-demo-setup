#!/bin/sh

apt install docker.io
apt install docker-compose
chmod 777 /var/run/docker.sock
groupadd docker
usermod -aG docker $USER
newgrp docker

echo 'Completed environment preparation'
