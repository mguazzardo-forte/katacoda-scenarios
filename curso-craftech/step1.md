Veremos en este ejemplo, la iniciación a docker.

En primer momento, vamos a ver que este corriendo el docker engine. `docker ps`{{EXECUTE}}

Nos vamos a clonar el repo del curso

`git clone https://github.com/mguazzardo/curso-basico-devops-marzo-2021`{{EXECUTE}}

Vamos a crear nuestro primer Container

`docker build -t name appflask .`{{EXECUTE}}

Vamos lanzar el contenedor 

`docker run -d --name appcurso appflask`{{EXECUTE}}

vamos a ver que este corriendo 

`docker ps`{{EXECUTE}}


`exit`{{EXECUTE}}
