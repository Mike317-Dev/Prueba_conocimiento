Imágenes en DockerHub

MariaDB

https://hub.docker.com/repository/docker/miguelgalvis317/mariadb

docker push miguelgalvis317/mariadb:v1

Apache

https://hub.docker.com/repository/docker/miguelgalvis317/miguel_apache

docker push miguelgalvis317/miguel_apache:v1

Instalar docker y docker-compose

clonar el repositorio  https://github.com/Mike317-Dev/Prueba_conocimiento.git

git clone https://github.com/Mike317-Dev/Prueba_conocimiento.git

ingresar a la carpeta clonada en la cual estan los archivos necesarios para el despliegue
docker-compose up -d

para ingresar al vhost se debe agregar al archivo host del equipo cliente:
127.0.0.1 example.com

si se desea construir desde cero, usar el archivo docker-construccion.yaml
