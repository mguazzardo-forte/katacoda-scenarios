## Nos logueamos al dashboard 

La [Console](https://console-openshift-console-[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com). 


* **Username:** ``admin``{{copy}}
* **Password:** ``admin``{{copy}}

Or as a standard user with:

* **Username:** ``developer``{{copy}}
* **Password:** ``developer``{{copy}}

## Loguearse al openshift via clia


``oc login -u developer -p developer``{{execute}}

This will log you in using the credentials:

* **Username:** ``developer``
* **Password:** ``developer``


## Creando un despliegue desde consola, usando la estrategia de s2i 

``oc new-project temperatura``{{execute}}

Con esto creamos el proyecto temperatura, y ahora, lo que falta es crear la app.

``oc new-app https://github.com/RedHatTraining/DO180-apps --context-dir temps --name temperatura``{{execute}}


Si queremos ver el progreso, lo que hacemos es lo siguiente

``oc get po -f``{{execute}}

Esperamos, y deberia crear un deploy en la siguiente ruta:

Antes, debemos exponer el servicio

``oc expose svc temperatura``{{execute}}

La ruta

http://temperatura-temperatura.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com


