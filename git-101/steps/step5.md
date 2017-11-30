Cuando trabajas en un equipo de desarrollo geográficamente distribuido (lo más normal) debes estar al día de los cambios que se han ido comprometiendo en el repositorio remoto que compartes.

Para actualizar tu repositorio local al ``commit`` más nuevo, ejecutarás: `git pull`{{execute}}

Esa orden bajará los últimos cambios del repositorio remoto y los mezclará (_merge_) con el contenido de tu directorio de trabajo.

Para fusionar una rama con tu rama activa (en la que estás trabajando, por ejemplo master), utilizarás: ``git merge <branch>``.

Por ejemplo, si nos situamos en nuestro directorio de trabajo: `cd /home/scrapbook/tutorial/git/sample-app`{{execute}}

Podemos ver en qué rama estamos con: `git branch`{{execute}}

Podemos crear una rama para pruebas, que se llame "test": `git branch test`{{execute}}

Nos cambiamos a la rama que hemos creado: `git checkout test`{{execute}}

**Apunte Pro:** Podemos crear la rama y cambiarnos a ella con ``git checkout -b <branch-name>``

Supongamos que tocamos el fichero ``pom.xml`` en esta rama: `echo "# Cambiando un fichero existente" >> pom.xml`{{execute}}

Comprometemos los cambios en el repositorio local: `git commit -am "Modificamos en pom.xml"`{{execute}}

Nos cambiamos a la rama "master": `git checkout master`{{execute}}

Antes de fusionar los cambios, puedes revisarlos usando `git diff test master`{{execute}}

Mezclamos el código de la rama "test": `git merge test`{{execute}}

**Apunte Pro:** Git intentará fusionar automáticamente los cambios. Desafortunadamente, no siempre será posible y se podrán producir conflictos.

En esos casos, tú eres responsable de solventar esos conflictos manualmente editando los archivos.

Después de modificarlos, necesitas marcarlos como fusionados con ``git add <filename>``