**Git es un sistema de control de versiones que había ideado Linus Torvalds con la intención de distribuir sus proyectos relacionados con el kernel de Linux**; y se ha convertido en [un estándar](https://git-scm.com/).

Para hacer las veces de repositorio remoto crearemos un repositorio vacío en otro directorio:`mkdir /home/scrapbook/tutorial/git/my-remote`{{execute}}
y lo inicializamos: `cd /home/scrapbook/tutorial/git/my-remote && git --bare init`{{execute}}

Hemos creado un directorio con una sencilla aplicación java de ejemplo: `cd /home/scrapbook/tutorial/git/sample-app && ls -ltra`{{execute}}

Lo primero que haremos es inicializar nuestro repositorio: `git init`{{execute}}

Vemos como se ha generado un directorio oculto: `ls -ltra .git`{{execute}}

Dentro de ese directorio oculto es donde _Git_ mantiene los objetos que identifican su propio sistema de ficheros.

Veamos en qué situación estamos: `git status`{{execute}}

Vamos a definir una ubicación "remota" para nuestro repositorio local, que etiquetaremos como "origin" por convención:`git remote add origin /home/scrapbook/tutorial/git/my-remote`{{execute}}

Nos traemos los cambios que pueda haber en el repositorio remoto: `git pull`{{execute}}

Ahora ya tenemos en local todos los cambios; y podemos subir los nuestros:

* Primero los registramos en el control de versiones: `git add .`{{execute}}
* Los subimos al repositorio local: `git commit -m "Carga inicial de Aplicación Java de ejemplo"`{{execute}}
* Los "empujamos" al repositorio remoto: `git push -u origin master`{{execute}}
