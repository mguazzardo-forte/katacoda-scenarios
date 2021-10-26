## Nos logueamos al dashboard 

La [Console](https://console-openshift-console-[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com). 


## Creando un despliegue de mongo

``oc new-project mongo``{{execute}}

Con esto creamos el nuevo proyecto mongo, y ahora vamos a crear la base de datos.

``oc new-app mongo --name mongodb``{{execute}}


Si queremos ver el progreso, lo que hacemos es lo siguiente

``oc get po -w``{{execute}}

Ahora vamos a levantar el backend, para eso, tenemos el siguiente comando.


``oc new-app https://github.com/mguazzardo/multi-container-app --context-dir backend --name backend``{{execute}}

Esperamos y exponemos el servicio

``oc expose svc  backend``{{execute}}

Y ahora vemos la ruta, y la populamos con postman

http://backend-mongo.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/api/topics


Una vez que populamos la ruta, viene lo divertido!


Clonamos el repo nuevamente

``git clone https://github.com/mguazzardo/multi-container-app ``{{execute}}


Ahora vamos al directorio que contiene los ficheros a modificar

``cd multi-container-app/frontend/src``{{execute}}

y Aca hacemos las sustituciones

``ROUTE=$(oc get route | awk '{print $2}' | grep -v PORT)``{{execute}}


``sed s/backend/$ROUTE/g App.js > App.js.new``{{execute}}


``rm -fr App.js && mv App.js.new App.js``{{execute}}

Ahora lanzamos los builds


``oc new-build --name frontend --binary --strategy docker``{{execute}}

Y luego lanzamos el start

``cd .. && oc start-build frontend --from-dir=.``{{execute}}

Cuando haya terminado el build, lanzamos la app

``oc new-app frontend``{{execute}}


Y luego exponemos el servicio

``oc expose svc frontend``{{execute}}

Y sacamos la ruta


``oc get route``{{execute}}

Finalmente la ruta sera 

http://frontend-mongo.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/api/topics




