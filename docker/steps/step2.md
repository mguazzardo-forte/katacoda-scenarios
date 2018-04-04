
# Objetos de Docker

![Flujo y relaciones de los objetos en Docker](https://docs.docker.com/engine/images/engine-components-flow.png)

**Dockerfile Referencias de Commandos**: 
- **FROM**: Indica de que imagen base con la que se contruye la imagen
- **MAINTAINER**: Autor
- **LABEL**: Añade metadatos a la imagen
- **ADD, COPY**: Copia de ficheros y directorios a la imagen
- **ENV**: Define variables de entorno de la imagen
- **RUN**: Ejecución de comandos
- **EXPOSE**: Informa que puertos escuchan pero no los pone accesibles desde  nuestro host. Para que los puertos sean accesibles hay que indicarlo en docker run cuando se despliegue con –p $PUERTOHOST:$PUERTODOCKER
- **USER**: Indica que usuario se utiliza para desplegar el contenedor.
- **WORKDIR**:  Cambia de directorio de trabajo
- **VOLUME**:  Indica el punto de montaje  Persistencia
- **ENTRYPOINT**: Permite configurar el contenedor en el despliegue.
- **CMD**: Ejecutable, típicamente el arranque del servicio del propósito del contenedor.

# Primeros pasos: levantamos un servidor web (NGINX)
- Usaremos una imagen pública de NGINX basada en el SO Alpine.
- Ejecutaremos `docker run --rm --name webserver -d -p 8080:80 nginx:alpine`{{execute}}
- Abrimos una pestaña mostrando el puerto ``8080`` del ``HOST 1`` y vemos que efectivamente se ha lanzado el servidor y responde al puerto que hemos publicado.
- Con el comando `docker ps`{{execute}} vemos los contenedores en ejecución.
- Con `docker images`{{execute}} veremos las imágenes que hemos descargado.
- Podemos ver los logs del servidor ejecutando `docker logs webserver`{{execute}}
- Comprobaremos los procesos en marcha dentro del contenedor con la siguiente orden `docker top webserver`{{execute}}
- También podemos disponer de información acerca del consumo de recursos con `docker stats webserver`{{execute}}
- Incluso podemos meternos dentro del contenedor con un _bash_ haciendo `docker exec -it webserver bash`{{execute}}