**Git es un sistema de control de versiones que había ideado Linus Torvalds con la intención de distribuir sus proyectos relacionados con el kernel de Linux**; y se ha convertido en [un estándar](https://git-scm.com/).

`mkdir /home/scrapbook/tutorial/git/my-remote && git clone https://github.com/devopstf/sample-remote.git && mv sample-remote/.git/* /home/scrapbook/tutorial/git/my-remote/ && rm -Rf sample-remote`{{execute}}

Hemos creado un directorio con una sencilla aplicación java de ejemplo: `cd /home/scrapbook/tutorial/git/sample-app && ls -ltra`{{execute}}

Lo primero que haremos es inicializar nuestro repositorio: `git init`{{execute}}

Vemos como se ha generado un directorio oculto: `ls -ltra .git`{{execute}}

Dentro de ese directorio oculto es donde _Git_ mantiene los objetos que identifican su propio sistema de ficheros.

Veamos en qué situación estamos: `git status`{{execute}}
