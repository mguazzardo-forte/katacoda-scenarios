## Nos logueamos al dashboard 

La [Console](https://console-openshift-console-[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com). 

You will then able able to login with admin permissions with:

* **Username:** ``admin``{{copy}}
* **Password:** ``admin``{{copy}}

Or as a standard user with:

* **Username:** ``developer``{{copy}}
* **Password:** ``developer``{{copy}}

## Loguearse al openshift via clia


To login to the OpenShift cluster from the _Terminal_ run:

``oc login -u developer -p developer``{{execute}}

This will log you in using the credentials:

* **Username:** ``developer``
* **Password:** ``developer``

## Creando un despliegue desde consola, pero de una imagen que usa root

A veces puede ser necesario correr una imagen como root, para algun debug,
o alguna otra cosa
para esto, necesitamos si o si , ejecutar las scc (Security Context Constraint)
Primero creamos un proyecto scc

``oc new-project scc``{{execute}}

Con esto creamos el nuevo proyecto scc, y ahora, lo que falta es crear la app, de una imagen de apache-php, que corre como root, pero antes, le vamos a pasar las scc.

``oc adm policy add-scc-to-user anyuid -z default``{{execute}}

y luego

``oc new-app eboraas/apache-php --name scc``{{execute}}


Si queremos ver el progreso, lo que hacemos es lo siguiente

``oc get po -w``{{execute}}

Esperamos, y deberia crear un deploy en la siguiente ruta:

Antes, debemos exponer el servicio

``oc expose svc scc``{{execute}}

La ruta

http://scc-scc.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com



