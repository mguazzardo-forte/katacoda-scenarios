**Git es un sistema de control de versiones que había ideado Linus Torvalds con la intención de distribuir sus proyectos relacionados con el kernel de Linux**; y se ha convertido en [un estándar](https://git-scm.com/).

Tu repositorio local esta compuesto por **tres "árboles"** administrados por git.

* El primero es tu Directorio de trabajo (_working dir_) que contiene los archivos.
* El segundo es el **Index** (_Staging Area_) que actua como una zona intermedia.
* El último es el **HEAD** que apunta al último ``commit`` realizado sobre el repositorio local.

![El flujo de trabajo habitual pasará tus cambios de tu directorio de trabajo al índice y de ahí al repositorio local](http://rogerdudler.github.io/git-guide/img/trees.png)