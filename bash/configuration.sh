#!/bin/bash
                    
# Download necesary dependenies
sudo apt update

echo "#######################"
echo "#######################"
touch "/home/ubuntu/prueba.txt"
echo "Test" >> /home/ubuntu/prueba.txt

cd /home/ubuntu/

# Install Docker from snap
sudo snap install docker

# Adding Docker group and setting permissions
sudo groupadd docker
echo "========================"
echo " ubuntu "
echo "========================"
sudo usermod -aG docker ubuntu

# Clonando el repositorio en la maquina Ec2
echo "Descargando el repositorio"
git clone https://github.com/rodriguecj/terraform-jenkins.git

cd terraform-jenkins

## Se crea el contenedor con un volumen al socket /var/run/docker.sock
##  -v /var/run/docker.sock:/var/run/docker.sock

# Descarga de Jenkins e instalacion