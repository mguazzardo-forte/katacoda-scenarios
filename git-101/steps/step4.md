**La rama master es la rama que se crea "por defecto"** cuando inicializas un repositorio.

Las ramas se utilizan para realizar cambios manteniendo el trabajo aislado entre diferentes desarrolladores o equipos.

Cada rama consiste en generar el mismo conjunto de ficheros que tenemos en el repositorio y mantener un control de versiones por separado.

Es habitual disponer de ramas para diferentes conjuntos de funcionalidades, o para pruebas, o para la solución de defectos, etc.

**Es importante** para la organización del equipo de desarrollo definir [una estrategia de ramas clara](http://nvie.com/posts/a-successful-git-branching-model/): las **buenas prácticas** aconsejan disponer, al menos, de **una rama de desarrollo** (_dev_) y/o una rama por cada desarrollador. Normalmente se desarrollará sobre esas ramas y se mezclará código en la rama _master_ cuando esté terminado.

![El flujo habitual para, por ejemplo, desarrollar una nueva funcionalidad sería:](https://i.stack.imgur.com/F00b8.png)

* Te situas en el directorio donde tenemos nuestra aplicación: `cd /home/scrapbook/tutorial/git/sample-app && ls -ltra`{{execute}}
* Crea una nueva rama llamada "feature_x" y cámbiate a ella usando: `git checkout -b feature_x`{{execute}}
* Haz los cambios que te toquen: `touch changes.md && echo "feature_x" > changes.md`{{execute}}
* Sube los cambios en local: `git add . && git commit -m "Terminada la Funcionalidad X"`{{execute}}
* Vuelve a la rama principal: `git checkout master`{{execute}}
* Baja los cambios realizados: `git merge feature_x`{{execute}}
* Borra la rama local que utilizaste: `git branch -d feature_x`{{execute}}
