# Objetos de Docker

**Imagen:** una colección ordenada de cambios en el sistema de ficheros y sus correspondientes parámetros de ejecución. Se construye a base capas que se especifican en un _script_ o _Dockerfile_. Una imagen no tiene estado y nunca cambia.

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

# Primeros pasos: construimos una imagen con nuestro propio Dockerfile y levantamos un contenedor
- Se ha cargado un _Dockerfile_ de ejemplo para la creación de un contenedor _NGINX_.
- Para visualizar este archivo ejecutamos `cd /home/scrapbook/tutorial/nginx && cat Dockerfile`{{execute}}
- Para generar la imagen de este contenededor se debe ejectutar el comando _build_.
- Para dar un nombre a la imagen que se genera tras la construcción se utiliza la opción ``-t (--tag)`` (nommbre:version).
- Construimos ejecutando `docker build -t nginx:dev-01 .`{{execute}}
- Al final, se puede observar que la imagen se encuentra registrada en nuestro repositorio interno de docker. `docker images`{{execute}}
- Para desplegar el contenedor se debe ejecutar el comando ``docker run`` y posteriormente hacer corresponder el puerto entre el _host_ y el servicio dentro del contenedor `docker run -d -p 8080:80 -v config:/etc/nginx -v website:/usr/share/nginx/html --rm --name webserver nginx:dev-01`{{execute}}. La opción ``-d (--detach)`` indica que se ejecute en background; y con ``--rm`` indicamos que se elimine el contenedro cuando se pare.
- Con el comando `docker ps`{{execute}} vemos los contenedores en ejecución.
- Para interactuar con el contenedor se ejecutaría docker exec -ti nombre del contenedor (instrucción). A modo de ejemplo, se podría observar el fichero index.html generado en el Dockerfile `docker exec webserver cat /usr/share/nginx/html/index.html`{{execute}}
- Paramos el contenedor `docker stop webserver`{{execute}}
