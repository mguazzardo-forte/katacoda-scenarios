Para este curso vamos a utilizar una máquina **Ubuntu**, distribución que suele utilizarse para crear entornos de producción y que cuenta con mucha documentación sobre cómo solucionar todo tipo de problemas. 

La máquina viene con docker instalado. En el caso que necesitemos instalar en otro entorno ejecutaríamos el siguiente comand: apt-get install docker. Posiblemente, debamos ininicar el servicio una vez instalado, para ello ejecutaremos service docker start.


# Arquitectura Docker.

La arquitectura docker se compone de los siguientes componentes:

- **Docker Daemon (dockerd)**: Escucha por la Docker API las peticiones y controla los objetos típicos de docker: imágenes, contenedores, redes y volúmenes. Además, puede comunicarse con otros dockerd para dirigir servicios docker.
- **Docker Client**: Interacción de los usuarios con docker a través de comandos: build, run, stop, etc. Puede comunicarse con más de un dockerd.
- **Docker Registry**: Donde se almacenan las imágenes docker. Púlico: Docker Hub, Privado: Nexus3, Gitlab,etc.
- **Docker Objects**: Incluye la creación y uso de imágenes, redes, contenedores, volúmenes y plugins.


# Objetos de Docker

- **Imagen**: 
    Fichero binario que contiene todo el sistema de ficheros de un contenedor
    Estructurado en capas (layers) por delta. 
    Para su construcción se genera un fichero (Dockerfile)
    Se ejecuta la instrucción docker build Dockerfile
    Cuando se genera un cambio en el Dockerfle y un rebuild de la imagen, solo las nuevas capas que han cambiado son construidas (Ligeras, Pequeñas y Rápidas)

