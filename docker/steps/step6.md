
**Objetivo: Desplegar una aplicación basada en microservicios.**

Nos situamos en el directorio del ejercicio ``cd /home/scrapbook/tutorial/training-setup/training-samples/3-dockerfile-sample && ll``{{execute}}

En este ejemplo tendremos que seguir las indicaciones de un equipo de desarrollo que quiere desplegar su aplicación basada en ``nodejs``.
Utilizaremos el propio fichero incluido en el repo, _Dockerfile_, dentro del cual encontraremos sus instrucciones, para elaborar nuestra solución.

# Indicaciones del equipo de desarrollo

- deberíamos utilizar la imagen oficial de 'node', con la etiqueta alpine 6.x
- La aplicación escucha en el puerto 3000, pero el contenedor debería publicar el servicio en el puerto 80 de manera que responda en el puerto 80 (pestaña de _Web Preview_ al lado del _Terminal Host 1_) de la máquina donde tengamos el servidor de _Docker_
- luego instalaremos tini con el gestor de paquetes de Alpine: 'apk add --update tini'
- meteremos los ficheros de la aplicación en un directorio /usr/src/app que debemos crear 'mkdir -p /usr/src/app'
- Node utiliza un gestor de paquetes, así que tenemos que copiar el fichero package.json
- luego usaremos 'npm install' para instalar las dependencias de ese fichero
- procuramos dejarlo todo limpio después de instalar, con 'npm cache clean --force'
- luego hay que copiar todos los ficheros de la carpeta
- el contenedor arrancará con la orden 'tini -- node ./bin/www'

# Si funciona todo como debe, solo queda

- Etiquetar la imagen para subirla a vuestra cuenta de Docker Hub.
- Subirla y ver que aparece en https://hub.docker.com
- Eliminar la imagen de la caché local.
- Levantar un contenedor con vuestra imagen de Docker Hub y comprobar que la descarga y levanta bien.
- Comprobar de nuevo que todo funciona.

> *Fuente:* Adaptado del curso _Udemy_ [_Docker Mastery_](https://www.udemy.com/docker-mastery/learn/v4/content), de [Brent Fisher](https://www.bretfisher.com/)
