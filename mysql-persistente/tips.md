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

``PO=$(oc get po | grep -i ru | awk '{print $1}');oc rsh $PO``{{execute}}

Desde ese pod, ingresamos a la base de datos

``mysql -u db1 -pdb1``{{execute}}

Lanzamos un show databases

``show databases;``{{execute}}

Luego salimos de la consola de mysql

``exit;``{{execute}}

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




