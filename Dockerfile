FROM jenkins/jenkins as Jenkins
RUN sudo apt update && \
sudo snap install docker && \
sudo groupadd docker && \
sudo usermod -aG docker jenkin

RUN chown jenkins /var/run/docker.sock