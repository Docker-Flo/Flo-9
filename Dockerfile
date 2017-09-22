# ----------------------------------
# CorinthMC Core Dockerfile
# Environment: Java
# Version: 2.0.0
# ----------------------------------

#Refer to the Ubuntu Container
FROM ubuntu-upstart

#Author Information
MAINTAINER Fonix Hardcastle, <me@fonix.online>

#Install and update Alpine Dependencies for the CorinthMC Containers.
RUN apt upgrade -y \
    && sudo apt-get install software-properties-common python-software-properties -y \
    && sudo add-apt-repository ppa:webupd8team/java -y \
    && apt update -y \
    && apt add  curl ca-certificates openssl curl sudo git tar bash sqlite oracle-java9-installer -y \
    && adduser -D -h /home/container container \
    && echo "ALL            ALL = (ALL) NOPASSWD: ALL" > /etc/sudoers \
    && chown root:root /usr/bin \
    && chmod u+s /usr/bin/sudo

#User to Run the DockerFile as
USER container
ENV  USER container
ENV  HOME /home/container

#Set the work Directory
WORKDIR /home/container

#Copy Process of the EntryPoint File
COPY ./entrypoint.sh /entrypoint.sh

#Run the entryPoint File
CMD ["/bin/bash", "/entrypoint.sh"]
