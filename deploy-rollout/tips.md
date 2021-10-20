## Nos logueamos al dashboard 

La [Console](https://console-openshift-console-[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com). 

Primero creamos un proyecto

``oc new-project app-rollout``{{execute}}

``oc new-app https://github.com/mguazzardo/phpdeploy --name app --as-deployment-config``{{execute}}

Vemos como va corriendo

``oc logs bc/app -f``{{execute}}

Exponemos la ruta

``oc expose svc app``{{execute}}


La ruta es: http://app-app-rollout.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com

Ahora empieza el rollout

``oc rollout latest dc/app``{{execute}}

NOTA IMPORTANTE: Hacer el Edit  de la page!

Ahora preguntamos la historia del rollout

``oc rollout history dc/app``{{execute}}

Ahora consultamos los pods, y vemos la ruta.

``oc get po``{{execute}}

Como vemos, han cambiado los Pods, pero la URL sigue igual, necesito disparar
el build. Para eso lo lanzamos

``oc start-build bc/app``{{execute}}

Vemos como va la compilacion

``oc logs bc/app -f``{{execute}}

Por ultimo, vemos en la url, como todo cambio, y como quedaron los pods

``oc get po -w``{{execute}}

#Pero ahora nos damos cuenta que queremos volver atras, como hacemos?. Simple.

``oc rollout undo dc/app``{{execute}}

Esto nos mandara al ultimo deploy bueno que se hizo.

Nos vemos!




