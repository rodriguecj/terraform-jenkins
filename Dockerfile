FROM jenkins/jenkins:2.401.2-jdk17

USER root
# Docker by Jenkins 
RUN apt-get update
# Installing column
RUN apt-get -y install bsdmainutils

# Installing JQ for Json
RUN apt install -y jq

# Installing Docker
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(cat /etc/os-release | grep VERSION_CODENAM | cut -d"=" -f2) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli

# RUN usermod -aG docker jenkins

# Installing AWS_CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&\
  unzip awscliv2.zip &&\
  /aws/install

USER jenkins

## Plugins
# Pluging - Blue Ocean
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"

# Pluging - generic-webhook-trigger
RUN jenkins-plugin-cli --plugins "generic-webhook-trigger:1.86.5"
RUN jenkins-plugin-cli --plugins "multibranch-scan-webhook-trigger:1.0.9"

# Pluging - pipeline-aws
RUN jenkins-plugin-cli --plugins "pipeline-aws:1.43"

## Nota:
# Se debe crear volumen con referencia al host: /var/run/docker.sock:/var/run/docker.sock