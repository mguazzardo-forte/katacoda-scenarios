Empezaremos esta leccion con una idea de Builds and deployconfigs
## Builds and deployconfigs.

Para esta leccion, generaremos una app, que se nutra de un repositorio git de django.

vamos a ir paso a paso.

``Crearemos el Build`` Lo que haremos, es setearemos el repositorio git, que lo veremos mas adelante

``Bajaremos el codigo`` Utilizando git o lo que corresponda

``Crearemos la imagen de docker``

``Pusheamos la imagen al docker registry`` para que tenga visibilidad en el cluster de openshit

``Luego, comienza el despliegue`` 

## Empezando
Para hacer esto, desde la terminal tipeamos lo siguiente:


``oc login -u developer -p developer [[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com``{{execute}}

con esto nos logueamos 

``oc new-project build``{{execute}}

con esto creamos el project build

Una vez alli, lanzamos la app

``oc new-app https://github.com/sclorg/django-ex.git``{{execute}}

Para ver el progreso del build, hacemos lo siguiente

``oc logs -f bc/django-ex``{{execute}}

Una vez que el build haya terminado, vemos todos los elementos de la app

``oc get all``{{execute}}

Donde podremos ver una salida como la siguiente

`` 
NAME                          REVISION   DESIRED   CURRENT   TRIGGERED BY
deploymentconfigs/django-ex   1          1         1         config,image(django-ex:latest)

NAME                     TYPE      FROM      LATEST
buildconfigs/django-ex   Source    Git       1

NAME                 TYPE      FROM          STATUS     STARTED         DURATION
builds/django-ex-1   Source    Git@0905223   Complete   7 minutes ago   1m31s

NAME                     DOCKER REPO                       TAGS      UPDATED
imagestreams/django-ex   172.30.1.1:5000/build/django-ex   latest    5 minutes ago

NAME                   READY     STATUS      RESTARTS   AGE
po/django-ex-1-8q2t4   1/1       Running     0          5m
po/django-ex-1-build   0/1       Completed   0          7m

NAME             DESIRED   CURRENT   READY     AGE
rc/django-ex-1   1         1         1         5m

NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
svc/django-ex   ClusterIP   172.30.54.171   <none>        8080/TCP   7m
``

Con lo cual vemos que esta todo corriendo. si queremos borrar todo, hacemos 

``oc delete all --all``{{execute}}

Y finalmente si queremos borrar el projecto ,

``oc delete project build``{{execute}}


