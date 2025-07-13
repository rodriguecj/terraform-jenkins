FROM jenkins/jenkins:2.518-jdk17

USER root
# Installing column, JQ for Json
RUN apt-get update && apt-get -y install bsdmainutils jq

# Installing Docker
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg && \
  echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(cat /etc/os-release | grep VERSION_CODENAM | cut -d"=" -f2) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli

# Installing AWS_CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&\
  unzip awscliv2.zip &&\
  /aws/install

USER jenkins

## Plugins
# Blue Ocean, generic-webhook-trigger, pipeline-aws
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow" \
  && jenkins-plugin-cli --plugins "generic-webhook-trigger:1.86.5" \
  && jenkins-plugin-cli --plugins "multibranch-scan-webhook-trigger:1.0.9" \
  && jenkins-plugin-cli --plugins "pipeline-aws:1.43"

## Note:
# Should create a volume in a container with reference to the host:
# /var/run/docker.sock:/var/run/docker.sock