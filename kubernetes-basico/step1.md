Kubernetes, la intro

bueno, veremos en esta lección, una intro, muy básica de kubernetes, tenemos un cluster armado con un nodo y un master

lo primero que vamos a hacer, vamos a ejecutar, el siguiente comando

`kubectl get nodes`{{EXECUTE}}

En el nodo01, lo corremos, pero vamos a tener un error, lo hacemos adrede.

`kubectl get nodes`{{EXECUTE HOST2}}


Con lo cual, se me genera una salida de los nodos como están corriendo. **Pero queremos mas info**

[Salida kubectl](https://github.com/mguazzardo/katacoda-scenarios/blob/master/kubernetes-basico/kubectl.PNG)

Lo que voy a hacer, es instalarme una imagen de apache-php, de eboraas. para eso, vamos a seguir todos los siguientes pasos en el master.

Lanzamos el deployment basada en la imagen de docker de eboraas/apache-php

`kubectl run --image=eboraas/apache-php apache-php`{{EXECUTE}}

Vemos todos los objetos de kubernetes que se me han generado

`kubectl get all`{{EXECUTE}}

Vemos ahora la imagen de docker corriendo en el node01

`docker ps| grep apache`{{EXECUTE HOST2}}

Ahora, lo que vamos a hacer, vamos a sacar el nombre del pod, y lo vamos a almacenar en una variable HTTP.

`HTTP=$(kubectl get po | grep apache |awk  '{print $1}')`{{EXECUTE}}

Vamos a averiguar la IP del pod, con el siguiente comando IP=$(kubectl describe pod $HTTP | grep -i ip | awk -F: '{print $2}')

`IP=$(kubectl describe pod $HTTP | grep -i ip | awk -F: '{print $2}')`{{EXECUTE}}

Ahora, vemos que hay en esa IP

`curl $IP`{{EXECUTE}}

Finalmente entramos al pod, ejecutando kubectl exec --stdin --tty  $HTTP -- bash

`kubectl exec --stdin --tty  $HTTP -- bash`{{EXECUTE}}

luego, si queremos nos movemos por el pod, y luego para salir, 

`exit`{{EXECUTE}}

Felicitaciones y muchas gracias!


