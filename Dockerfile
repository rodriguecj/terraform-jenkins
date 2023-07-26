FROM jenkins/jenkins:2.401.2-jdk17

USER root
# Docker by Jenkins 
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli

RUN usermod -aG docker jenkins

RUN chown jenkins /var/run/docker.sock

USER jenkins

## Nota:
# Se debe crear volumen con referencia al host: /var/run/docker.sock:/var/run/docker.sock
