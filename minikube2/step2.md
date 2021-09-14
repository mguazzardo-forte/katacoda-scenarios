Vamos a desplegar  nuestra primera aplicacion  en Kubernetes con el comando `kubectl create deployment`. Necesitaremos setear el nombre del deployment y de la ubicacion de la imagen.

`kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1`{{execute}}

Bien! Hemos desplegado nuestra primera aplicacion en kubernetes creando un deployments:

Para  listar nuestros deployments usaremos  `get deployments` :

`kubectl get deployments`{{execute}}

Veremos  1 deployment corriendo en una simple instancia de nuestra aplicacion. Esta instancia esta corriendo en kubernetes, (Minikube).
