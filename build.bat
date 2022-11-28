@echo off

:: prepare jenkins home directory with config file (yaml)
if not exist jenkins_home_local mkdir jenkins_home_local
powershell "(Get-Content jenkins-controller-build\jenkins.yaml) -Replace 'IP_ADDRESS', '192.168.19.112' | Set-Content jenkins_home_local\jenkins.yaml"

:: build container image for jenkins controller 
docker build --no-cache -t jenkins/controller:local jenkins-controller-build

:: build container image for jenkins agent-template
docker build -t jenkins/agent:custom jenkins-agent-build

:: start software stack
docker-compose up -d