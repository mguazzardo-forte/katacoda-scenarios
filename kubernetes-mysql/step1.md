Kubernetes, Jugando con mysql-mariadb 

bueno, veremos en esta lección, veremos todas las versiones de mariadb/mysql , simulando errores, y veremos como ir solucionandolos.

lo primero que vamos a hacer, vamos a ejecutar, el siguiente comando

`kubectl get nodes`{{EXECUTE}}

En el nodo01, lo corremos, pero vamos a tener un error, lo hacemos adrede.

`kubectl get nodes`{{EXECUTE HOST2}}


Con lo cual, se me genera una salida de los nodos como están corriendo. **Pero queremos mas info**

[Salida kubectl](https://github.com/mguazzardo/katacoda-scenarios/blob/master/kubernetes-basico/kubectl.PNG)

Lanzamos el deployment basada en la imagen de docker de mysql

`kubectl run --image=mysql mysql`{{EXECUTE}}

Vemos todos los objetos de kubernetes que se me han generado

`kubectl get all`{{EXECUTE}}

Esperamos que el pod levante, pero sin embargo, nos da un error.

`kubectl get po -w`{{EXECUTE}}

Vemos allí que se nos marca un error, lo que vamos a hacer, es investigar ese error.

Para ello, lo que vamos a hacer es correr esto POD=$(kubectl get pod  | grep mysql | awk '{print $1}')

`POD=$(kubectl get pod  | grep mysql | awk '{print $1}')`{{EXECUTE}}

Y una vez que tenemos la variable, pedimos los logs

`kubectl logs $POD`{{EXECUTE}}

Lo que vemos, es que necesitamos pasarle parametros al pod, entonces, vamos a borrar todos los objetos que tenemos creados en nuestro namespace de kubernetes.

`kubectl delete $(kubectl get all | awk '{ print $1}' | grep mysql)`{{EXECUTE}}

Una vez que borramos todos los objetos de kubernetes, vamos a volver a lanzar el pod con los parametros.

`kubectl run --image=mysql --env 'MYSQL_ROOT_PASSWORD=master' mysql`{{EXECUTE}}

Luego, vamos viendo si se estan corriendo los pods.

`kubectl get po -w`{{EXECUTE}}

Finalmente vemos que esta corriendo el pod, y lo que vamos a hacer es instalar el cliente mariadb.

`apt update && apt -y install mariadb-client-core-10.0`{{EXECUTE}}

Luego, lo que vamos a hacer, es tratar de conectarnos a la base de datos, con el password de root de master. 

Averiguo la IP del contenedor.

`IP=$(kubectl describe po | grep -i ip)`{{EXECUTE}}

Ahora lanzo el cliente mariadb

`mysql -u root -pmaster -h $IP`{{EXECUTE}}

Y nuevamente, vemos un error, PERO TRANQUILOS, QUE ESTA CONOCIDO, VAMOS A USAR UNA IMAGEN DE DOCKER DE MARIADB!!.

`docker search mariadb | grep centos`{{EXECUTE}}

Ahora borramos todos los objetos de kubernetes en nuestro namespace anteriormente creados

`kubectl delete $(kubectl get all | awk '{ print $1}' | grep mysql)`{{EXECUTE}}

Finalmente , lanzamos el pod de kubernetes con la imagen de mariadb de centos

`kubectl run --image=centos/mariadb-102-centos7 --env 'MYSQL_ROOT_PASSWORD=master' mysql`{{EXECUTE}}

Vemos como se van creando los pods

`kubectl get po -w`{{EXECUTE}}

Vemos el docker corriendo en el nodo01

`docker ps| grep mariadb`{{EXECUTE HOST2}}

Tambien lo podemos ver con el siguiente comando, que nos dice en que nodo esta el pod

`kubectl get po -o wide`{{EXECUTE}}

Finalmente nos conectamos con el cliente mariadb-client

`mysql -u root -pmaster -h 10.32.0.193`{{EXECUTE}}

**Muchas gracias**
