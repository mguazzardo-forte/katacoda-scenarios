**Git es un sistema de control de versiones que había ideado Linus Torvalds con la intención de distribuir sus proyectos relacionados con el kernel de Linux**; y se ha convertido en [un estándar](https://git-scm.com/).

En el directorio donde estamos tenemos una sencilla aplicación ``java`` de ejemplo: `tree`{{execute}}

Lo primero que haremos es inicializar nuestro repositorio: `git init`{{execute}}

Vemos como se ha generado un directorio ``.git``: `ls -ltra`{{execute}}

Dentro de ese directorio oculto es donde _Git_ mantiene los objetos que identifican su propio sistema de ficheros.

Veamos en qué situación estamos: `git status`{{execute}}
