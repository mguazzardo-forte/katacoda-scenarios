## Nos logueamos al dashboard 

## Crearemos un nuevo deploy usando s2i, inyectando secrets 

Veremos en este caso como usar las secrets, inyectandolas en un bc.


``oc new-project clima``{{execute}}

Con esto creamos el nuevo proyecto clima


Aplicamos nuestra secret

##Declarando los configmaps en forma declarativa


``oc create -f Openweathermap-Node.js/k8s/secrets.yml``{{execute}}

Ahora lanzamos la app.

``oc new-app https://github.com/mguazzardo/Openweathermap-Node.js --name clima``{{execute}}

Esperamos unos minutos


``echo "Espere 3 minutos && sleep 180 && echo "Listo"``{{execute}}


Vemos que BC ( BuildConfig) Tenemos.


Crearemos el secret de la forma man secilla

``oc get bc``{{execute}}

Inyectamos el BC

``oc set env bc/clima --from="secret/clima"``{{execute}}

Exponemos el Servicio


``oc expose svc clima``{{execute}}

La ruta


http://clima-clima.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com
