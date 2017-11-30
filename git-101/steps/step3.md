En caso de que hagas algo mal o cambies de opinión, puedes reemplazar cambios locales (en tu directorio de trabajo) usando el comando ``git checkout -- <filename>``

Este comando reemplaza los cambios en tu directorio de trabajo con el último contenido de HEAD (el puntero que Git mantiene al último cambio comprometido en el repositorio local. Los cambios que ya han sido agregados al _Index_, así como también los nuevos archivos, se mantendrán sin cambio.

Si estás en medio de un _commit_ y tienes cambios registrados por el índice, es decir en la _Staging Area_, ![puedes revertirlos con ``git reset``](https://i.stack.imgur.com/RPeKg.png)

Por otro lado, si quieres deshacer todos los cambios locales y _commits_, puedes traer la última versión del repositorio remoto y apuntar a tu copia local principal: `git fetch origin`{{execute}}

Con ``git reset --hard`` hacemos la dos cosas: borramos los cambios incluidos en la _Staging Area_ y devolvemos nuestro directorio de trabajo al estado del último _commit_ (o el que especifiquemos):

* Con `git reset --hard HEAD`{{execute}} volvemos al último _commit_
* Con ``git reset --hard <commit-hash>`` volvemos a uno específico.

Puede ocurrir que ya hayamos hecho el _commit_ y nos hayamos dado cuenta tarde de que la cosa no ha ido bien. Aun así, podemos revertir los cambios, utilizando ``git revert HEAD~1``{{execute}} lo cual nos devolvería al _commit_ inmediatamente anterior al último en el que hemos metido la zarpa.

Podemos ir hacia atrás en el histórico de cambios utilizando el mismo puntero a la cabecera de nuestro repositorio local, i.e. ``HEAD~<n>``

Ese histórico, que Git guarda etiquetando cada _commit_ con un ``hash`` unívoco se puede consultar con ``git log``{{execute}} (veremos el _hash_ y el comentario asociado)

Podemos verlo de una forma más resumida con `git log --oneline`{{execute}}

Si queremos visualizar qué cambios se realizaron en cada _commit_ (más allá del comentario que incluyó el desarrollador) podemo utilizar `git show`{{execute}}