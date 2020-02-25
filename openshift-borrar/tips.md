Veremos en este tutorial como borrar una app despues de crearla

## Ingresando al  Cluster

Lo primero que haremos, es loguearnos al cluster de openshift

Para loguearnos al cluster , desde la terminarl y via oc  the _Terminal_ ejecutamos:

``oc login -u developer -p developer [[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com``{{execute}}

Esto hara que nos logueemos con las siguientes credenciales:

* **Username:** ``developer``
* **Password:** ``developer``

Usamos las mismas credenciales para poder entrar a la  web console.

## Creando nuetro projecto

Para crear un projecto llamado  ``myproject`` corremos lo siguiente:

``oc new-project myproject``{{execute}}

Una vez ingresado alli, lo que haaremos es crear un despliegue  que corra httpd, y para eso, utilizaremos la imagen
de httpd de centos, que nos corre el httpd en el port 8080

``oc new-app docker.io/centos/httpd-24-centos7``{{execute}}

Queremos ver que el deploy este corriendo.

``oc get all``{{execute}}

y alli vemos, los pods, los services, los dc, etc

Si queremos borrar absolutamente todos los elementos que tenemos corriendo dentro de nuestro projecto

``oc delete all --all``{{execute}}

Luego vemos si se ejecuto como lo deseamos

``oc get all``{{execute}}

y finalmente, si queremos borrar el projecto

``oc delete project my-project``{{execute}}

