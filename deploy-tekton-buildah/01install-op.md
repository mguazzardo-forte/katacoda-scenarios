OpenShift Pipelines Corren con un operador de openshift.


## Haremos todo desde la consola de comandos 

Me clono mi repositorio

`git clone https://github.com/mguazzardo/pipelinefinal`{{execute}}

Aplico el Operador
me muevo al directorio
`cd pipelinefinal`{{execute}}

`oc apply -f subscription.yaml`{{execute}}

Creo un nuevo proyecto debian

`oc new-project flaskapi`{{execute}}

## Verificando la instalacion

```
until oc api-resources --api-group=tekton.dev | grep tekton.dev &> /dev/null
do 
 echo "Operator installation in progress..."
 sleep 5
done

echo "Operator ready"
```{{execute}}

Bien, ya tenemos el operador instalado... ahora esperamos un minuto y lanzamos

Con esto agregamos el pipeline, y el pvc.

Lo fuerzo a esperar adrede

`echo Espere por favor && sleep 100`{{execute}}


`oc create -f helpers.yaml && oc create -f buildah-pipeline.yaml `{{execute}}

`echo Espere por favor && sleep 120`{{execute}}

Con esto vemos que el pipeline se ejecuto
`tkn pipeline ls`{{execute}}

Lanzamos el pipeline , desde el cli de tekton

`tkn pipeline start buildah-deployment -w name=shared-workspace,claimName=source-pvc -p APP_NAME=flaskapi -p GIT_REPO=https://github.com/mguazzardo/apiflask`{{execute}}


vemos los logs

`PIPE=$(tkn pipeline ls | awk '{print $5}'| awk '{print $2}')`{{execute}}

`tkn pipelinerun logs $PIPE -f -n flaskapi`{{execute}}


Cuando termina, vemos la ruta que dejo

Vemos la ruta que nos dejo

`oc get route`{{execute}}

La ruta es:

http://flaskapi-flaskapi.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com

