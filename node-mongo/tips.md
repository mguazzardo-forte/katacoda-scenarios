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

Use the same credentials to log into the web console.

## Creando un despliegue de mariadb, usando port-forward, y cargando la base

``oc new-project mongo``{{execute}}

Con esto creamos el nuevo proyecto mongo, y ahora vamos a crear la base de datos.

``oc new-app mongo --name mongodb``{{execute}}


Si queremos ver el progreso, lo que hacemos es lo siguiente

``oc get po -w``{{execute}}

Ahora vamos a levantar el backend, para eso, tenemos el siguiente comando.


``oc new-app https://github.com/mguazzardo/multi-container-app --context-dir backend --name backend``{{execute}}

Esperamos y exponemos el servicio

``oc expose svc  backend``{{execute}}
