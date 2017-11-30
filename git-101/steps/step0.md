**Git es un sistema de control de versiones que había ideado Linus Torvalds con la intención de distribuir sus proyectos relacionados con el kernel de Linux**; y se ha convertido en [un estándar](https://git-scm.com/).

Tu repositorio local esta compuesto por **tres "árboles"** administrados por git.

* El primero es tu Directorio de trabajo (_working dir_) que contiene los archivos.
* El segundo es el **Index** (_Staging Area_) que actua como una zona intermedia.
* El último es el **HEAD** que apunta al último ``commit`` realizado sobre el repositorio local.

![El flujo de trabajo habitual pasará tus cambios de tu directorio de trabajo al índice y de ahí al repositorio local](https://i.stack.imgur.com/NxTUz.png)

Normalmente haremos un ``git add <filename>`` para añadir un fichero al índice (meterlo bajo control de versiones).

A continuación lo subimos al repositorio local con la orden ``git commit -m "Comentario explicativo del cambio comprometido"``

**Apunte Pro:** Para hacer los dos pasos en una sola orden usaremos: ``git commit -am "Comentario"``

# Preparando el escenario

Para hacer las veces de repositorio remoto, crearemos un directorio vacío en otro directorio:`mkdir /home/scrapbook/tutorial/git/my-remote`{{execute}}

Lo inicializamos como repositorio _Git_: `cd /home/scrapbook/tutorial/git/my-remote && git --bare init`{{execute}}

También hemos creado un directorio con una sencilla aplicación _Java_ de ejemplo: `cd /home/scrapbook/tutorial/git/sample-app && ls -ltra`{{execute}}

Partiremos de este directorio, que puedes ver en el IDE, para ir progresando por este escenario.