FROM jenkins/agent

ARG user=jenkins

ENV DOCKERVERSION=20.10.12

LABEL Description="This image is derived from jenkins/agent openjdk11. \
      It includes docker static binary"

USER root
ADD https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz .
RUN tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 \
                 -C /usr/local/bin docker/docker \
  && rm docker-${DOCKERVERSION}.tgz

WORKDIR /home/${user}

USER ${user}