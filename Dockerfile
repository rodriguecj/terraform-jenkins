FROM jenkins/jenkins:2.401.2-jdk17

USER root
# Docker by Jenkins 
RUN apt-get update
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(cat /etc/os-release | grep VERSION_CODENAM | cut -d"=" -f2) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli

#RUN usermod -aG docker jenkins

USER jenkins

## Nota:
# Se debe crear volumen con referencia al host: /var/run/docker.sock:/var/run/docker.sock