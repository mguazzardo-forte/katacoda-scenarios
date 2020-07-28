Veremos en este ejemplo, como generar una imagen desde dockerfile.

En primer momento, vamos a ver que este corriendo el docker engine.
`docker ps`{{EXECUTE}}

Ahora vamos a listar los volumenes existentes

`docker volume ls`{{EXECUTE}}

Vamos a crear un volumen llamado ubuntu

`docker volume create ubuntu`{{EXECUTE}}

Vamos a volver a listar los volumenes

`docker volume ls`{{EXECUTE}}

Vamos a correr el contenedor, con el nuevo volumen

`docker run -dit --name ubuntu01 -v ubuntu:/datos ubuntu:latest`{{EXECUTE}}

vamos a entrar en el contenedor

`docker exec -it ubuntu01 bash`{{EXECUTE}} 

Vamos a hacer un ls

`ls -ld /datos`{{EXECUTE}}

Vamos a crear un archivo dentro de la carpeta datos

`touch /datos/texto.txt`{{EXECUTE}}

Vamos a chequear que exista

`ls /datos`{{EXECUTE}}

Vamos a salir del contenedor 


`exit`{{EXECUTE}}

Vamos a ver el nuevo volumen creado, y su contenido en el sistema host

`ls /var/lib/docker/volumes/ubuntu/_data/`{{EXECUTE}}

Vamos a crear un nuevo contenedor montando el mismo volumen

`docker run -dit --name ubuntu02 -v ubuntu:/datos ubuntu:latest`{{EXECUTE}}

Vamos a entrar en el container

`docker exec -it ubuntu02 bash`{{EXECUTE}}

Vamos a listar la raiz, para ver si se creo la carpeta datos

`ls /datos`{{EXECUTE}}

Podemos ver que tenemos los mismos archivos que teniamos en el volumen que habiamos usado en el primer contenedor

Ahora vamos a borrar el primer contenedor, para eso antes que nada debemos salir del contenedor

`exit`{{EXECUTE}}

`docker rm -fv ubuntu01`{{EXECUTE}}

Ahora vamos a borrar el segundo contenedor

`docker rm -fv ubuntu02`{{EXECUTE}}

Ahora vamos a borrar el volumen

`docker volume rm ubuntu`{{EXECUTE}}

Con esto finalizamos el ejercicio
Muchas gracias!







Muchas gracias!











