## Nos logueamos al dashboard 

## Creando un despliegue de mariadb, usando un template, usando port-forward, y cargando la base

``oc new-project template``{{execute}}

Con esto creamos el nuevo proyecto mariadb, y ahora vamos a crear la base de datos.

Para eso nos bajamos dos archivos fundamentales.... el template y la db.sql

``wget https://raw.githubusercontent.com/mguazzardo/php-quotes/main/example.yaml``{{execute}}

``wget https://raw.githubusercontent.com/mguazzardo/php-quotes/main/db.sql``{{execute}}

Ahora creamos el objeto template

``oc create -f example.yaml``{{execute}}

Y vemos si se genero ok

``oc get template``{{execute}}

Basados en el nuevo template, lanzamos la aplicacion, y esperamos

``oc new-app --template quotes``{{execute}}

Vemos el progreso

``oc get po -w``{{execute}}

Ahora, tenemos que averiguar el pod, que corre la base de datos

``PO=$(oc get po | grep -i running | grep db | awk '{print $1}')``{{execute}}

Una vez averiguado, tenemos que copiar la db, y lanzarla con el comando mysql

``oc cp db.sql $PO:/tmp/db.sql``{{execute}}
``oc rsh $PO``{{execute}}

## Estamos dentro del POD!, ejecutar lo siguiente

``mysql -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE -h 127.0.0.1 < /tmp/db.sql``{{execute}}

Con esto populamos la base de datos, ahora salimos

``exit``{{execute}}

Luego, lo que nos queda es ver las rutas:


La ruta de la quote random es http://quotesapi-template.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/get.php
