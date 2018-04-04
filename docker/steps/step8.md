
**Objetivo: Configurar un entorno para un desarrollador que tiene que ponerse las pilas con la administración de un CMS Drupal, o que tiene que probarun tema nuevo para este gestor de contenidos.**

Nos situamos en el directorio del ejercicio ``cd /home/scrapbook/tutorial/training-setup/training-samples/5-compose-sample-custom && ll``{{execute}}

- Lo configuraremos de forma que podamos construir nuestra imagen a medida con `docker compose up -d`, incluyendo la persistencia de los datos y la configuración que necesitemos cada vez que lancemos el _script_.
- Partiremos del _script_ que desarrollamos para la tarea anterior basándonos en Drupal y PostgreSQL.
- Esta vez usaremos versiones concretas de las imágenes oficiales de _Docker Hub_ no sea que la etiquetada como `latest`no nos valga.

## Dockerfile
- Nuestra imagen base de Drupal será la versión `8.2`.
- Instalaremos git tirando de APT: `apt-get update && apt-get install -y git`.
- Haremos un poco de limpieza después de la instalación `rm -rf /var/lib/apt/lists/*`.
- Cambiaremos al directorio donde se guardan los temas, `/var/www/html/themes`.
- Luego clonaremos el tema que nos interesa, `git clone --branch 8.x-3.x --single-branch --depth 1 https://git.drupal.org/project/bootstrap.git`.
- Meteremos en la misma capa la sentencia para cambiar los permisos adecuadamente. Este contenedor se levanta con el usuario `www-data` pero el `build`se hace como `root`, así que meteremos en esta línea: `chown -R www-data:www-data bootstrap`.
- Finalmente, no estaría de más volver al directorio por defecto, `/var/www/html`

## Compose File
- Usaremos el fichero de la tarea anterior, pero construyendo nuestra propia imagen a medida, con el tema nuevo.
- Renombraremos la imagen como `custom-drupal`.
- Añadiremos `build: .` al servicio `drupal`.
- Para la imagen de la BB.DD. `postgres:9.6` necesitaremos la misma contraseña que antes, pero además necesitaremos un volumen para garantizar la persistencia entre pruebas sucesivas; usaremos `drupal-data:/var/lib/postgresql/data`.

## Levantamos los contenedores y configuramos Drupal
- Seguiremos el _Wizard_ como hicimos en la tarea anterior.
- Cuando se levante el CMS, clicamos en `Apariencia` en la barra superior; y veremos que aparece un nuevo tema llamado `Bootstrap`.
- Clicamos en `Instalar y configurar por defecto`. Luego clicamos en `Volver al site` para comprobar que ha cambiado el aspecto de nuestro CMS.
- Si bajamos los contenedores `docker-compose down` se borrarán los contenedores, pero se guardarán los datos para que en el siguiente `docker-compose up` todo seguirá en su sitio.
- Lo comprobamos y para destruirlo todo, incluidos los volúmenes, haremos `docker-compose down -v`.

> *Fuente:* Adaptado del curso _Udemy_ [_Docker Mastery_](https://www.udemy.com/docker-mastery/learn/v4/content), de [Brent Fisher](https://www.bretfisher.com/)
