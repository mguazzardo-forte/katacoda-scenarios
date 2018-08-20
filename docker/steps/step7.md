
**Objetivo: Crear un _script_ para levantar una instalación en local del CMS Drupal.**

Nos situamos en el directorio del ejercicio ``cd /home/scrapbook/tutorial/training-setup/training-samples/4-compose-sample && ll``{{execute}}

- Editaremos el fichero docker-compose.yml que hay en la carpeta.
- Usaremos las imágenes oficiales de `drupal` y `postgres` de _Docker Hub_.
- Usaremos la versión `2`de la sintaxis de YAML.
- Drupal escuchará en el puerto 8080.
- Debemos asegurarnos de que asignamos una contraseña para acceder a la BB.DD., usando la variable de entorno `POSTGRES_PASSWORD` en la imagen de `postgres`.
- Realizaremos la configuración del Drupal utilizando el _Wizard_ vía navegador, en el puerto 8080 (Pestaña _Web Preview_ (+) al lado de _Terminal Host 1_)
- Drupal considera que la BB.DD. está en local, i.e. `localhost`, pero en vuestro caso su nombre será el del servicio que pongáis en el _script_.
- Leer y escribir son habilidades muy poco valoradas: repasad la documentación de la imagen oficial de Drupal en _Docker Hub_ para ver qué volúmenes necesitan persistencia y qué variables de entorno necesitamos.

> *Fuente:* Adaptado del curso _Udemy_ [_Docker Mastery_](https://www.udemy.com/docker-mastery/learn/v4/content), de [Brent Fisher](https://www.bretfisher.com/)
