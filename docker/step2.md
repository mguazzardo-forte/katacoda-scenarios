
# Objetos de Docker

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

# Primeros comandos (Generar una imagen docker de Apache)
 - Se ha generado un Dockerfile para la creación de un contenedor apache en la ruta ./apache/Dockerfile. Para visualizar este archivo `cat ./apache/Dockerfile`{{execute}} Para generar la imagen de este contenededor se debe ejectutar el comando build. Para dar un nombre a la imagen a generar se  introduce la opción -t (nommbre:version) `docker build -t apache:v1 ./apache/Dockerfile`{{execute}}
