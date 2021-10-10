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

## Creando un despliegue desde un template, usando la estrategia de template

``oc new-project template``{{execute}}

Con esto creamos el nuevo proyecto template, y ahora, lo que falta es crear la app.
Para eso lo seguiremos desde la consola.
Pero antes, tenemos que importar el template que hemos generado

``cd template && oc create -f template-php.json -n openshift``{{execute}}


Y ahora nos vamos a consola, para ver que todo este bien

Con esto vemos nuestro primer despliegue con templates
