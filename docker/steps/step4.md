
**Objetivo: Repasar la ejecución básica de contenedores con varios servicios.**

Nos situamos en el directorio del ejercicio ``cd /home/scrapbook/tutorial/training-setup/training-samples/1-multiple-containers-sample && ll``{{execute}}

- Levantaremos tres servidores: un `nginx` que nos hará de proxy, `mysql` como BB.DD., y un servidor web con Apache `httpd`.
- Los levantaremos en modo `--detached`, y les pondremos nombre `--name`.
- `nginx`escuchará en el puerto `80`, el Apache en el `8080`, y `mysql` usará el puerto estándar `3306`.
- En el caso de `mysql`, usaremos `--env` para pasarle el valor `MYSQL_RANDOM_ROOT_PASSWORD=yes` de forma que genere una contraseña aleatorio para el usuario `root`al arrancar.
- Pillaremos la contraseña que ha generado mirando en los logs del contenedor; y nos conectaremos usando cualquier herramienta, e.g. _DBeaver_.
- Nos aseguraremos de que todos los contenedores están levantados y funcionan correctamente.
- Limpiaremos todo, parando y borrando contenedores e imágenes.

> *Fuente:* Adaptado del curso _Udemy_ [_Docker Mastery_](https://www.udemy.com/docker-mastery/learn/v4/content), de [Brent Fisher](https://www.bretfisher.com/)
