## Nos logueamos al dashboard 

## Crearemos un nuevo deployment

A veces ,cuando tenemos muchas variables, no es muy buen negocio poner todas las variables en el
fichero declarativo yaml, por que seria engorroso.
Para eso vienen los configmaps a nuestra ayuda.
Empezaremos con nuestro proyecto.

``oc new-project variables``{{execute}}

Con esto creamos el nuevo proyecto variables

`wget https://raw.githubusercontent.com/mguazzardo/demislamer/master/deploy-config.yaml`{{execute}}
`wget https://raw.githubusercontent.com/mguazzardo/demislamer/master/busybox-cm`{{execute}}

Aca empezamos a forjar nuestro configmap

##Declarando los configmaps en forma declarativa



Crearemos el configmap de la manera mas sencilla, ahora usaremos un fichero de configuracion

``oc create configmap cm1 --from-literal=MENSAJE1="Hola Busybox" --from-env-file busybox.cfg``{{execute}}



Aplicamos este deployConfig

``oc create -f deploy-config.yaml``{{execute}}

Si queremos ver el progreso, lo que hacemos es lo siguiente

``oc get po -w``{{execute}}

Primero vemos los logs 

Me consigo el POD:

``POD=$(oc get po | grep -i ru | awk '{print $1}')``{{execute}}

Con esto veo los logs, y luego entro al POD

``oc logs $POD``{{execute}}

Ahora vemos las variables de ambiente, para eso entramos al pod

``oc rsh $POD``{{execute}}

Y adentro del pod

``env | grep MENSAJE1``{{execute}}

Luego salimos

``exit``{{execute}}


Con esto terminamos nuestro ejercicio
