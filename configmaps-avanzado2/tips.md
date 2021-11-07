## Nos logueamos al dashboard 

La [Console](https://console-openshift-console-[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com). 


## Creando un despliegue simple de nodejs con express

``oc new-project node``{{execute}}

Con esto creamos el nuevo proyecto node, y ahora vamos a lanzar la app

``oc new-app https://github.com/mguazzardo/katacoda-scenarios --context-dir=complex-node --name=node``{{execute}}


Si queremos ver el progreso, lo que hacemos es lo siguiente

``oc get po -w``{{execute}}

Esperamos y exponemos el servicio

``oc expose svc node``{{execute}}

Y ahora vemos la ruta

http://node-node.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com


Pero como vemos ahi, dice el hostname , y una variable que aparece "undefined", y es ahi donde queremos inyectar la variable....

Por consola es bien sencillo, pero lo vamos a hacer por linea de comandos.

``oc set env deployment/node MY_VARIABLE="Marce"``{{execute}}





