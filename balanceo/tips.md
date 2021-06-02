
## Viendo un Proyecto de balanceo de cargas y Escalado 

Vamos a generar un nuevo proyecto, via s2i, que tenga solo un php,
y que nos muestre el nombre del servidor.
Primero creamos el proyecto Balanceo.

``oc new-project balanceo``{{execute}}

Ahora creamos la app, con s2i, de la siguiente manera.

``oc new-app centos/php-71-centos7~https://github.com/mguazzardo/openshiftPHP``{{execute}}

Esperamos, y como sabemos que son buenas practicas, hacemos rollout


``oc rollout status dc/openshiftphp``{{execute}}

Cuando nos de la finalizacion, exponemos la ruta


``oc expose svc openshiftphp``{{execute}}

La ruta es la siguiente

http://openshiftphp-balanceo.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com

ahora, lo que haremos, es comprobar el balanceo de cargas. Para eso, vamos
a escalar horizontalmente los pod's.


``oc scale deploymentconfig/openshiftphp --replicas=4``{{execute}}

Y comprobamos que estos esten escalados, para eso lo hacemos con el siguiente comando


``oc get po``{{execute}}

Como vemos, ahi tenemos los 4 pods corriendo, ahora vamos a ejecutar un simple shell script, para ver que se balancea la carga


``RUTA=$(oc get route | awk '{print $2}' | grep -v HOST) ; for i in {1..100};do curl http://$RUTA/page.php ;done``{{execute}}

Con esto podemos ver que esta corriendo perfectamente nuestro balanceador.
Para cualquier consulta sobre devops o sysadmin, mguazzardo76@gmail.com o QQmelo en telegram.
Saludos!


