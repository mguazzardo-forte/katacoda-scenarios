OpenShift Pipelines Corren con un operador de openshift.


## Haremos todo desde la consola de comandos 

Me clono mi repositorio

`git clone https://github.com/mguazzardo/pipelinefinal`{{execute}}

Aplico el Operador
me muevo al directorio
`cd pipelinefinal`{{execute}}

`oc apply -f subscription.yaml`{{execute}}

Creo un nuevo proyecto debian

`oc new-project debian`{{execute}}

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


`oc create -f pipelinedosenuno-fix.yaml`{{execute}}

`echo Espere por favor && sleep 120`{{execute}}

Con esto vemos que el pipeline se ejecuto
`tkn pipeline ls`{{execute}}

Lanzamos el pipeline , desde el cli de tekton

`tkn pipeline start build-and-deploy -w name=shared-workspace,claimName=source-pvc -p deployment-name=debian -p git-url=https://github.com/mguazzardo/demislamer`{{execute}}


Vemos la ruta que nos dejo

`oc get route`{{execute}}

La ruta es:

http://debian-debian.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com

