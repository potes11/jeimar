#Eliminar docker
sudo apt-get purge docker

#Instalar docker

#Actualizar paquete ubunto
sudo apt-get update

#Usar repositorio docker
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#Agregue la clave GPG oficial de Docker
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#Configurar el repositorio
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#Actualice el motor de docker
sudo apt-get update

##Si le presenta un error, Utilize
sudo sed -i 's|docker.com/linux/debian|docker.com/linux/ubuntu|g' /etc/apt/sources.list
sudo apt update

##si el error persiste Utilize
sudo sed -i 's/debian/ubuntu/g' /etc/apt/sources.list.d/docker.list
sudo apt update

#Instale las dependencias docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

##verifique que docker Engine este instalado correctamente
sudo service docker start
sudo docker run hello-world

##Agregar usuario a grupo docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 

#ejecute los siguiente comandos para comprobar los permisos
docker ps
docker run hello-world

##Para evitar errores en la ventana acoplable ejecute
sudo systemctl daemon-reload
sudo systemctl restart docker