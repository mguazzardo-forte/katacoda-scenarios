Nos situaremos en el directorio donde tenemos nuestra aplicación: `cd /home/scrapbook/tutorial/git/sample-app`{{execute}}

Lo primero que haremos es inicializar nuestro repositorio local: `git init`{{execute}}

Vemos como se ha generado un directorio oculto: `ls -ltra .git`{{execute}}

Dentro de ese directorio oculto es donde _Git_ mantiene los objetos que identifican su propio sistema de ficheros y las referencias a los tres "árboles" de los que habábamos en el paso anterior.

Veamos en qué situación estamos: `git status`{{execute}}

Vamos a definir una ubicación "remota" para nuestro repositorio local, que etiquetaremos como "origin" por convención:`git remote add origin /home/scrapbook/tutorial/git/my-remote`{{execute}}

Nos traemos los cambios que pueda haber en el repositorio remoto: `git pull`{{execute}}

Ahora ya tenemos en local todos los cambios; y podemos subir los nuestros:

* Primero los registramos en el control de versiones: `git add .`{{execute}}
* Los subimos al repositorio local: `git commit -m "Carga inicial de Aplicación Java de ejemplo"`{{execute}}
* Los "empujamos" al repositorio remoto: `git push -u origin master`{{execute}}
