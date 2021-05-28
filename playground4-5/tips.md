Before you get started we recommend reading the following tips. They explain
a bit about how the playground environment is setup and what access you have.

## Logging in to the Cluster via Dashboard new

Click the [Console](https://console-openshift-console-[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com) tab to open the dashboard. 

You will then able able to login with admin permissions with:

* **Username:** ``admin``{{copy}}
* **Password:** ``admin``{{copy}}

Or as a standard user with:

* **Username:** ``developer``{{copy}}
* **Password:** ``developer``{{copy}}

## Logging in to the Cluster via CLI

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

## Creando un despliegue desde consola

``oc new-project apache``{{execute}}

Con esto creamos el nuevo proyecto apache, y ahora, lo que falta es crear la app.

``oc new-app httpd --name apache``{{execute}}

Esperamos, y deberia crear un deploy en la siguiente ruta:


La ruta

http://`apache-apache.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

