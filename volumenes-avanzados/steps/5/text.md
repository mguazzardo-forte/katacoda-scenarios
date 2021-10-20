Definimos un pod llamado `mypod` con un contenedor llamado `myfrontend`, basaado en la imagen `nginx:latest`.

Tambien definimos los PV y sus pvcs.


Creamos el pod `oc create -f pod.yaml`{{execute HOST1}}

Podemos ver los pods correiendo
``oc get pods``{{execute HOST1}}

