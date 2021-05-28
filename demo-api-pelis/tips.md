Before you get started we recommend reading the following tips. They explain
a bit about how the playground environment is setup and what access you have.


## Creando un despliegue desde consola

``oc new-project pelis``{{execute}}

Con esto creamos el nuevo proyecto pelis, y ahora, lo que falta es crear la app.

``oc new-app centos/httpd-24-centos7~https://github.com/mguazzardo/pelis-cheta``{{execute}}



Esperamos, y deberia crear un deploy en la siguiente ruta:

Antes, debemos exponer el servicio

``oc expose svc pelis-cheta``{{execute}}

La ruta

http://pelis-cheta-pelis.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com

