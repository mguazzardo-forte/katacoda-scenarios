## Nos logueamos al dashboard 


## Creando un despliegue de React desde la consola

``oc new-project node``{{execute}}

Usaremos una estrategia de template, Para generar una app con nodejs y postgres.


``oc new-app nodejs-postgresql-example``{{execute}}

Esperamos unos 5 minutos y vemos!

La ruta

http://nodejs-postgresql-example-node.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com



