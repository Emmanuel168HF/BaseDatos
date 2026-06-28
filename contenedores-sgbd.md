# Contenedores de Sistemas Gestores de Base de Datos

![ImagenDocker](./Image/imagen1.png)

## Comandos Docker con Descripción

| Comando | Descripción |
| :--- | :--- |
| **docker --version** | _Verifica la versión de Docker_ |
| **docker pull nombre_imagen** | _Descarga una imagen de Docker Hub_ [DockerHub](https://hub.docker.com/) |
| **docker images** | _Visualiza las imágenes_ |
| **docker run** | _Crea un contenedor_ |
| **docker ps** | _Visualiza los contenedores activos_ |
| **docker stop** | _Detiene un contenedor_ |
| **docker start** | _Inicia un contenedor detenido_ |
| **docker rm** | _Elimina un contenedor_ |

## Comandos de Contenedores de SGBD

```bash
docker pull docker/getting-started

### contenedore de tutorial de docker

docker run -d -p 80:80 docker/getting-started

### visualizar contenedores activos

docker ps

### descargar imagen de mariadb

docker pull mariadb

### crear contenedor de mariadb

docker run --name mariadb-container -e MARIADB_ROOT_PASSWORD=1234 -p 3306:3306 -d mariadb

### descargar imagen de postgresql

docker pull postgres

### crear contenedor de postgresql

docker run --name postgres-container -e POSTGRES_PASSWORD=1234 -p 5432:5432 -d postgres

### descargar imagen de mysql

docker pull mysql

### crear contenedor de mysql

docker run --name mysql-container -e MYSQL_ROOT_PASSWORD=1234 -p 3307:3306 -d mysql

### visualizar imagenes descargadas

docker images

### detener contenedor

docker stop mariadb-container

### iniciar contenedor

docker start mariadb-container

### eliminar contenedor

docker rm mariadb-container