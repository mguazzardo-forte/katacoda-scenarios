Es importante añadir a nuestro repositorio **un fichero README** en condiciones, es decir suficientemente descriptivo, con el objetivo
de que cualquier miembro del equipo entienda lo que tiene entre manos...

```
# Aplicación Java de ejemplo

En el repositorio puedes encontrar una sencilla aplicación, ``App.java``
y sus correspondientes pruebas unitrarias; además del fichero pom.xml para _Maven_
```

Si te sitúas en el directorio donde tienes tu aplicación: `cd /home/scrapbook/tutorial/git/sample-app && ls -ltra`{{execute}}

Puedes crear el fichero: `touch README.md`{{execute}}

y copiar el contenido de arriba en el editor.

Otro punto relevante cuando empezamos a trabajar con un repositorio en Git es añadir un fichero ``.gitignore``, que servirá para especificar
qué archivos queremos que Git ignore, es decir que no los registre como parte de su control de versiones. Este fichero incluirá los patrones
de ese tipo de archivos, por ejemplo archivos temporales ``*.tmp``, logs, resultados de la compilación de nuestra aplicación, i.e. la carpeta ``/target``
o los ficheros propios de nuestro IDE, por ejemplo el ``.project`` de _Eclipse_.

Vemos un ejemplo para Java que podemos copiar y pegar en el editor después de crear el fichero: `touch .gitignore`{{execute}}

```
######################
# Directories #
######################

build/
bin/
target/
libs/
tmp/
jaxws/jaxws-client/src/main/

######################
# Package Files #
######################

*.jar
*.war
*.ear
*.db
*.zip
*.tar.gz
*.rar

######################
# Compiled class file
######################

*.class

######################
# Log file
######################

*.log

######################
# Eclipse
######################
 
*.pydevproject
/.project
.metadata
*.tmp
*.bak
*.swp
*~.nib
local.properties
.classpath
.project
.settings/
.loadpath
```

Una vez hemos creado estos dos ficheros, Git aún no los tendrá registrados en el control de versiones: `git status`{{execute}}

Tendremos que añadirlos al "índice" con la siguiente sentencia: `git add . `{{execute}}

y pasarlos al repositorio local: `git commit -m "Creados los ficheros README y .gitignore estándar para Java"`{{execute}}

Es **muy importante** añadir a cada ``commit`` un comentario suficientemente significativo, de tal manera que cualquier miembro del equipo
pueda saber qué hemos hecho con cada cambio registrado en el repositorio.