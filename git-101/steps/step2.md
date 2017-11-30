Es importante añadir a nuestro repositorio **un fichero README** en condiciones, es decir suficientemente descriptivo, con el objetivo
de que cualquier miembro del equipo entienda lo que tiene entre manos...

```
# Aplicación Java de ejemplo

En el repositorio puedes encontrar una sencilla aplicación, ``App.java``
y sus correspondientes pruebas unitrarias; además del fichero pom.xml para _Maven_
```

Si te sitúas en el directorio donde tienes tu aplicación: `cd /home/scrapbook/tutorial/git/sample-app`{{execute}}

Puedes crear el fichero: `touch README.md`{{execute}}

y copiar el contenido de arriba en el editor.

Otro punto relevante cuando empezamos a trabajar con un repositorio en Git es añadir un fichero ``.gitignore``, que servirá para especificar
qué archivos queremos que Git ignore, es decir que no los registre como parte de su control de versiones. Este fichero incluirá los patrones
de ese tipo de archivos, por ejemplo archivos temporales ``*.tmp``, logs, resultados de la compilación de nuestra aplicación, i.e. la carpeta ``/target``
o los ficheros propios de nuestro IDE, por ejemplo el ``.project`` de _Eclipse_.

Creamos el fichero: `touch .gitignore`{{execute}}

Metemos esos patrones básicos:

* Los directorios: `echo "tmp/" > .gitignore && echo "target/" >> .gitignore`{{execute}}
* Los ficheros empaquetados: `echo "*.jar" >> .gitignore && echo "*.war" >> .gitignore`{{execute}}
* Los ficheros del Eclipse: `echo ".project" >> .gitignore`{{execute}}

Una vez hemos creado estos dos ficheros, Git aún no los tendrá registrados en el control de versiones: `git status`{{execute}}

Tendremos que añadirlos al "índice" con la siguiente sentencia: `git add . `{{execute}}

y pasarlos al repositorio local: `git commit -m "Creados los ficheros README y .gitignore estándar para Java"`{{execute}}

Es **muy importante** añadir a cada ``commit`` un comentario suficientemente significativo, de tal manera que cualquier miembro del equipo
pueda saber qué hemos hecho con cada cambio registrado en el repositorio.