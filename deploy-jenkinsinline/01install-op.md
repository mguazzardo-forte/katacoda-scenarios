Jenkins en openshift 4.


## Haremos todo desde la consola de comandos 

Me creo un project

`oc new-project pipelines`{{execute}}


Lanzo Jenkins desde el template ephemeral

`oc new-app jenkins-ephemeral`{{execute}}

Espero un minuto y veo todo

`sleep 60 && oc get all`{{execute}}

Como vemos ya tenemos el jenkins, ahora lanzo el pipeline.

`oc create -f https://raw.githubusercontent.com/mguazzardo/apiflask/main/final.yaml`{{execute}}



Veo que BuildsConfigs Tenemos ahora para correr:

`oc get buildconfigs`{{execute}}

Ahora lanzamos el build config del pipeline

`oc start-build nodejs-sample-pipeline`{{execute}}


Viendo la ruta

`echo "Aguarde que se ejecuta el pipeline" &&sleep 200&& echo "termino"`{{execute}}

Proyecto terminado

http://flaskapi-pipelines.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/products


Reforzando conocimientos:

https://docs.openshift.com/container-platform/4.4/builds/build-strategies.html#builds-tutorial-pipeline_build-strategies

https://docs.openshift.com/container-platform/4.4/builds/understanding-buildconfigs.html



