 Para usar minikube, kubectl  debera ser instalado. (Ya lo hemos hecho por ud). Use kubectl para ver esto.
La forma de uso del comando kubectl es: kubectl <verbo> <recurso>.
Esto realiza la accion pedida (como crear, describir) un determinado recurso (como un  nodo, contedor). Ud. podra usar `--help` después del comando para obtener informacion adicional (`kubectl get nodes --help`).

Chequearemos si kubectl esta en nuestro cluster con el siguiente comando,  `kubectl version`:

`kubectl version`{{execute}}

OK, kubectl esta instalado y ud puede ver tanto el cliente como el server de kubernetes corriendo.

Para ver los nodos corriendo en el cluster, tenemos el siguiente comando `kubectl get nodes`:

`kubectl get nodes`{{execute}}

Veremos los nodos corriendo (1 en nuestro caso). Recordemos que estamos corriendo minikube.
