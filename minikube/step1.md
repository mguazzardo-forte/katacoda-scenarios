Hemos instalado un cluster con minikube por ud. Chequearemos que este corriendo correctamente , usando *minikube version*:

`minikube version`{{execute}}

OK, Podemos ver que esta todo en orden.

Iniciamos el cluster, corriendo *minikube start* :

`minikube start`{{execute}}

y lo que nos resta, es instalar una herramienta *kubens*

`wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens && chmod +x kubens && mv kubens /usr/local/bin/`{{execute}}

Bravo! Ahora tu tienes corriendo un cluster de kubernetes usando minikube. Felicitaciones, disfrute de este por una hora.



