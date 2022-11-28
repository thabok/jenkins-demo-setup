#!/bin/sh

# prepare jenkins home directory with config file (yaml)
mkdir -p jenkins_home_local

# replace the placeholder with the actual IP address and save to jenkins_home_local
IP_ADDRESS=$(ifconfig en0 | grep 'inet .*' | cut -d' ' -f2)
sed "s/IP_ADDRESS/${IP_ADDRESS}/g" jenkins-controller-build/jenkins.yaml > jenkins_home_local/jenkins.yaml

# build container image for jenkins controller 
docker build -t jenkins/controller:local jenkins-controller-build # --no-cache

# build container image for jenkins agent-template
docker build -t jenkins/agent:custom jenkins-agent-build

# (re)start software stack
docker-compose down
docker-compose up -d

echo Jenkins is now running on http://${IP_ADDRESS}:8081