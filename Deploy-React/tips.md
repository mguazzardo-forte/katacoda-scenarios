## Nos logueamos al dashboard 

La [Console](https://console-openshift-console-[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com). 

## Creando un despliegue de React desde la consola

``oc new-project react``{{execute}}

Usaremos una estrategia de s2i, usando un builder llamado nodeshift especialmente para SPA.

Y escogemos un repo para la ocasion.



``oc new-app nodeshift/ubi8-s2i-web-app:latest~https://github.com/mguazzardo/consuming-restful-api-in-react --name react``{{execute}}


Si queremos ver el progreso, lo que hacemos es lo siguiente

``oc logs bc/react -f``{{execute}}

Esperamos, y deberia crear un deploy en la siguiente ruta:

Antes, debemos exponer el servicio

``oc expose svc react``{{execute}}

La ruta

http://react-react.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com


Con esto vemos nuestro primer despliegue con React

