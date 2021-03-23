Veremos en este ejemplo, la iniciación a docker.

En primer momento, vamos a ver que este corriendo el docker engine. `docker ps`{{EXECUTE}}

Nos vamos a clonar el repo del curso

`git clone https://github.com/craftech-academy/curso-basico-devops-marzo-2021 -b curso2`{{EXECUTE}}

nos posicionamos en el directorio correcto

`cd curso-basico-devops-marzo-2021`{{EXECUTE}}

Vamos a ejecutar nuestro compose, recordemos que solo se van a generar las imagenes del directorio 

`docker-compose up`{{EXECUTE}}


vamos a ver que este corriendo 

`docker-compose ps`{{EXECUTE}}

y ahora, como dijo el zurdo, le hacemos un curl al port 5000, a los dos endpoints / y /other

`curl $IP:5000/`{{EXECUTE}}

y ahora al /other

`curl $IP:5000/other`{{EXECUTE}}

todo anduvo bien, nos vamos!

Muchas gracias a la gente de craftech!

`exit`{{EXECUTE}}
