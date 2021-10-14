Los contenedores de las imagenes, son realmente archivos tar images asociado con un archivo JSON .Nosotros  llamamos a todo ese conjunto imagen. 
![Container Images](../../assets/subsystems/container-internals-lab-2-0-part-1/02-basic-container-image.png)


#Esperamos unos 5 minutos aproximadamente

``docker exec -it openshift-master oc get nodes``{{execute}}

Vamos a entrar al contenedor master
y creamos un nuevo proyecto apache2
``docker exec -it openshift-master bash``{{execute}}

``oc new-project apache2``{{execute}}

ahora lanzamos una aplicacion de httpd
``oc new-app docker.io/centos/httpd-24-centos8 --name apache2``{{execute}}

Esperamos a que se despliegue
``oc get po -w``{{execute}}

Vemos donde esta corriendo

``oc get po -o wide``{{execute}}

Ahora vamos a ver de escalar horizontalmente los pods

``oc scale dc/apache2 --replicas=3``{{execute}}

Esperar un rato, para eso podemos hacer 

``oc get po -w``{{execute}}

Y luego, ver de agarrar un pod, y hacerle un curl

primero , corremos 

``oc get po -o wide``{{execute}}

Luego, sacamos la ip del ultimo contenedor

``IP=$(oc get po -o wide | grep Run | grep apa | tail -1 |  awk '{print $(NF-2)}')``{{execute}}

y finalmente, hacemos

``curl $IP:8080``{{execute}}



