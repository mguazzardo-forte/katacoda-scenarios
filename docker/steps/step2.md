
# Objetos de Docker

**Contenedor**: es una instancia “ejecutable” de una imagen. Se puede crear, desplegar, parar, mover y eliminar usando la API de _Docker_. Básicamente, un contenedor se compone de una imagen _Docker_, un entorno de ejecución y un conjunto estándar de instrucciones. De la misma manera que los contenedores de logística definen un estándar para mover mercancía, los contenedores _Docker_ definen un estándar para transportar o mover aplicaciones software y microservicios.

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

# Primeros pasos: levantamos un servidor web (NGINX)
- Usaremos una imagen pública de NGINX basada en el SO Alpine.
- Ejecutaremos `docker run --rm --name webserver -d -p 8080:80 nginx:alpine`{{execute}}
- Abrimos una pestaña mostrando el puerto ``8080`` del ``HOST 1`` y vemos que efectivamente se ha lanzado el servidor y responde al puerto que hemos publicado.
- Con el comando `docker ps`{{execute}} vemos los contenedores en ejecución.
- Con `docker images`{{execute}} veremos las imágenes que hemos descargado.
- Podemos ver los logs del servidor ejecutando `docker logs webserver`{{execute}}
- Comprobaremos los procesos en marcha dentro del contenedor con la siguiente orden `docker top webserver`{{execute}}
- También podemos disponer de información acerca del consumo de recursos con `docker stats webserver`{{execute}}
- Incluso podemos meternos dentro del contenedor con un _bash_ (en este caso usamos ``ash, apline bash``) haciendo `docker exec -it webserver ash`{{execute}}
- Lo paramos `docker stop webserver`{{execute}}
- Comprobamos que el _flag_ ``--rm`` lo ha borrado `docker ps -a`{{execute}}
