# Objetos de Docker

**Contenedor**: 
Instancia “runnable” de la imagen
Se puede crear, desplegar, parar, mover y eliminar usando la API de Docker
Comandos docker:
- **build** ( Construir)
- **run**  (Desplegar)
- **ps**  (Listar  Contenedores)
- **images** (Listar Imágenes )
- **pull** (Descargar imagen )
- **push** (Subir imagen)
- **exec** (Interactuar con el contenedor)
- **rmi** (Borrar Imagen)
- **kill**  (Matar contenedor)

- Se ha generado un Dockerfile para la creación de un contenedor apache en la ruta ./apache/Dockerfile. Para visualizar este archivo `cat ./apache/Dockerfile`{{execute}} Para generar la imagen de este contenededor se debe ejectutar el comando build. Para dar un nombre a la imagen a generar se  introduce la opción -t (nommbre:version) `docker build -t apache:v1 ./apache`{{execute}}
- Al final la generación de la imagen, se puede observar que se encuentra registrada en nuestro repositorio interno de docker. `docker images `{{execute}}
 - Para desplegar el contenedor se debe ejecutar el comando docker run y posteriormente mapear el puerto entre el host y el servicio dentro del contenedor `docker run -d -p 80:80 --name apache_c1 apache:v1`{{execute}}. La opción -d corresponde a ejecutarlo en background.
 - Con el comando `docker ps`{{execute}} se observa los contenedores en ejecución.
 - Para interactuar con el contenedor se ejecutaría docker exec -ti nombre del contenedor (instrucción). A modo de ejemplo, se podría observar el fichero index.html generado en el Dockerfile `docker exec apache_c1 cat /var/www/html/index.html`{{execute}}

