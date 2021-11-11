## Mysql Persistente

Lo primero que vamos a hacer es generar un nuevo proyecto 

``oc new-project db``{{execute}}

Despues de esto, lo que voy a generar es una nueva app, con un usuario, password y una base de datos.

``oc new-app mysql-persistent -e 'MYSQL_USER=db1' -e 'MYSQL_PASSWORD=db1' -e 'MYSQL_DATABASE=db1'``{{execute}}



Luego de esto, vamos a ver el avance de esto con el comando rollout

``oc rollout status dc/mysql``{{execute}}


Luego, cuando el rollout me dice que esta finalizado, vemos los pods

``oc get po``{{execute}}

Luego, ingresamos al pod

``PO=$(oc get po | grep -i ru | awk '{print $1}')``{{execute}}


Ahora aca lo que hacemos es copiarnos el dump de la base de datos al POD


``oc cp db1.sql $PO:/tmp``{{execute}}

Ingresamos al pod

``oc rsh $PO``{{execute}}

Desde ese pod, restauramos la base de datos

``mysql -u db1 -pdb1 < /tmp/db1.sql``{{execute}}




Ahora salimos del contenedor

``exit``{{execute}}

Ahora de vuelta en el HOST, vemos cual es el PVC ( Persistent Volume claim)

``oc get pvc``{{execute}}

Pero necesitamos este dato sacarlo y poder enviarlo al fedora core.

``PV=$(oc get pvc | grep pv | awk '{print $3}'); echo $PV > /tmp/pv.txt``{{execute}}
``scp -i ~/.crc/machines/crc/id_ecdsa /tmp/pv.txt  core@api.crc.testing:/tmp/``{{execute}}

Ahora , ingresamos al Fedora Core


## Con el siguiente comando nos conectamos a la consola de fedora core 

``ssh -i ~/.crc/machines/crc/id_ecdsa core@api.crc.testing``{{execute}}

Con esto entramos a la consola de fedora core, le vamos a setear la variable PS1, para que no nos confundamos

``export PS1="CORE#"``{{execute}}

En la vm de fedora core, podemos usar el comando sudo -i

``sudo -i``{{execute}}

y Luego, ya poder ver donde estan alojado los archivos de nuestro persistent volume

``DIR=$(cat /tmp/pv.txt); cd /mnt/pv-data/$DIR;ls``{{execute}}

ahora salimos de alli.

``exit``{{execute}}

Volvemos a salir de alli, ya que ahora estamos como user, lo vemos con el siguiente comando

``id``{{execute}}

Como vemos seguimos alli, salimos

``exit``{{execute}}

Ahora Viene lo divertido

# Borrando nuestra base de datos, total esta en persistencia.


Lo que viene a continuacion, es borrar la base de datos, total esta en persistencia.

Para ello, borramos todos los objetos del proyecto

``oc delete all --all``{{execute}}

Luego de eso, regenerar la base de datos, va a fallar cuando cree el volumen persistent claim, pero la app va a seguir. No nos asustemos por ello.


``oc new-app mysql-persistent -e 'MYSQL_USER=db1' -e 'MYSQL_PASSWORD=db1' -e 'MYSQL_DATABASE=db1'``{{execute}}

Ahora, como mandan las buenas practicas vamos a esperar que termine.


``oc rollout status dc/mysql``{{execute}}

Cuando termine, veremos si esto esta funcionando....


``oc new-app https://github.com/mguazzardo/mysql-complejo``{{execute}}


Vemos como  viene el phpdeploy

``oc logs bc/mysql-complejo``{{execute}}

Cuando termine, exponemos el servicio

``oc expose svc mysql-complejo``{{execute}}

Ahora lo que falta es la Ruta

http://mysql-complejo-db.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/public


