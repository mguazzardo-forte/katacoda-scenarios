## Nos logueamos al dashboard 

La [Console](https://console-openshift-console-[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com). 

You will then able able to login with admin permissions with:

* **Username:** ``admin``{{copy}}
* **Password:** ``admin``{{copy}}

Or as a standard user with:

* **Username:** ``developer``{{copy}}
* **Password:** ``developer``{{copy}}

## Loguearse al openshift via clia


To login to the OpenShift cluster from the _Terminal_ run:

``oc login -u developer -p developer``{{execute}}

This will log you in using the credentials:

* **Username:** ``developer``
* **Password:** ``developer``

Use the same credentials to log into the web console.

## Creando un despliegue de mariadb, usando port-forward, y cargando la base

``oc new-project mariadb``{{execute}}

Con esto creamos el nuevo proyecto mariadb, y ahora vamos a crear la base de datos.

``cd phpmariadb && oc new-app mariadb --name mariadb  -e MYSQL_DATABASE=sampledb -e MYSQL_USER=user1 -e MYSQL_PASSWORD=master``{{execute}}


Si queremos ver el progreso, lo que hacemos es lo siguiente

``oc get po -w``{{execute}}

Esperamos, y cuando todo este ok, hacemos lo siguiente

``PO=$(oc get po | grep -v NAME | awk '{print $1}')``{{execute}}
Con esto conseguimos el nombre de nuestro pod, por que ahora vamos a hacer 
un port forward

``nohup oc port-forward $PO 3306:3306 &``{{execute}}

teniendo esto, lo que ahora hacemos es agregar la base de datos.
para eso primero bajamos el cliente mysql

``yum -y update && yum -y install mysql``{{execute}}

``mysql -u user1 -pmaster -h 127.0.0.1 < db.sql``{{execute}}


Con esto ya tenemos la base populada, ahora lo que vamos a hacer, vamos a correr nuestra app en php, para ello, tambien vamos a usar s2i.

``oc new-app https://github.com/mguazzardo/phpdeploy --name app``{{execute}}

Vamos viendo el progreso con el siguiente comando

``oc get po -w``{{execute}}

Cuando terminamos, vemos exponemos el servicio

``oc expose svc app``{{execute}}

Y ahora lanzamos la consola en la siguiente url

http://app-mariadb.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/public/
