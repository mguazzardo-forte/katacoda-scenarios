# Objetos de Docker

**Contenedor**: 
Instancia “ejecutable” de una imagen. Se puede crear, desplegar, parar, mover y eliminar usando la API de Docker

![Ciclo de vida de un contenedor](https://cdn-images-1.medium.com/max/1129/1*vca4e-SjpzSL5H401p4LCg.png)

Órdenes en línea para gestionar el ciclo de vida de un contenedor _docker_:
- **build** ( Construir)
- **run**  (Desplegar)
- **ps**  (Listar  Contenedores)
- **images** (Listar Imágenes )
- **pull** (Descargar imagen )
- **push** (Subir imagen)
- **exec** (Interactuar con el contenedor)
- **rmi** (Borrar Imagen)
- **kill** (Matar contenedor)

# Primeros pasos: construimos una imagen con nuestro propio Dockerfile y levantamos un contenedor
- Se ha cargado un _Dockerfile_ de ejemplo para la creación de un contenedor _Apache_.
- Para visualizar este archivo ejecutamos `cd /home/scrapbook/tutorial/ && cat ./apache/Dockerfile`{{execute}}
- Para generar la imagen de este contenededor se debe ejectutar el comando _build_.
- Para dar un nombre a la imagen que se genera tras la construcción se utiliza la opción ``-t (--tag)`` (nommbre:version).
- Construimos ejecutando `docker build -t apache:dev-01 ./apache`{{execute}}
- Al final, se puede observar que la imagen se encuentra registrada en nuestro repositorio interno de docker. `docker images`{{execute}}
- Para desplegar el contenedor se debe ejecutar el comando ``docker run`` y posteriormente hacer corresponder el puerto entre el _host_ y el servicio dentro del contenedor `docker run -d -p 80:80 --rm --name webserver apache:v1`{{execute}}. La opción ``-d (--detach)`` indica que se ejecute en background; y con ``--rm`` indicamos que se elimine el contenedro cuando se pare.
- Con el comando `docker ps`{{execute}} vemos los contenedores en ejecución.
- Para interactuar con el contenedor se ejecutaría docker exec -ti nombre del contenedor (instrucción). A modo de ejemplo, se podría observar el fichero index.html generado en el Dockerfile `docker exec webserver cat /var/www/html/index.html`{{execute}}