## Nos logueamos al dashboard 

La [Console](https://console-openshift-console-[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com). 

You will then able able to login with admin permissions with:

* **Username:** ``admin``{{copy}}
* **Password:** ``admin``{{copy}}

Or as a standard user with:

* **Username:** ``developer``{{copy}}
* **Password:** ``developer``{{copy}}

## Loguearse al openshift via clia

When the OpenShift playground is created you will be logged in initially as
a cluster admin (`oc whoami`{{execute}}) on the command line. This will allow you to perform
operations which would normally be performed by a cluster admin.

Before creating any applications, it is recommended you login as a distinct
user. This will be required if you want to log in to the web console and
use it.

To login to the OpenShift cluster from the _Terminal_ run:

``oc login -u developer -p developer``{{execute}}

This will log you in using the credentials:

* **Username:** ``developer``
* **Password:** ``developer``

Use the same credentials to log into the web console.

## Creando un despliegue desde consola, usando la estrategia de Dockerfile

``oc new-project appphp``{{execute}}

Con esto creamos el nuevo proyecto apache, y ahora, lo que falta es crear la app.

``oc new-app https://github.com/ilosuna/phpsqlitecms --name appphp``{{execute}}


Si queremos ver el progreso, lo que hacemos es lo siguiente

``oc logs appphp-1-build -f``{{execute}}

Esperamos, y deberia crear un deploy en la siguiente ruta:

Antes, debemos exponer el servicio

``oc expose svc appphp``{{execute}}

La ruta

http://appphp-appphp.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com


Con esto vemos nuestro primer despliegue con DockerHub usando s2i
