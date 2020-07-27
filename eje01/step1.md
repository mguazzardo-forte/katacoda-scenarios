Veremos en este ejemplo, la iniciación a docker.

En primer momento, vamos a ver que este corriendo el docker engine.
`docker ps`{{EXECUTE}}

Ahora vamos a bajar la imagen de ubuntu 18.04 lts

`docker pull ubuntu:18.04`{{EXECUTE}}

Ahora lo que vamos a ver que imágenes tenemos en el caché local

`docker images`{{EXECUTE}}

Lo que vamos a hacer ahora, es ver la versión de docker que está corriendo

`docker -v`{{EXECUTE}}

En el próximo paso, veremos como correr un docker de apache
