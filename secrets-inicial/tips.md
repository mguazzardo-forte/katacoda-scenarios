## Nos logueamos al dashboard 

## Crearemos un nuevo deployment

A veces ,cuando tenemos muchas variables, no es muy buen negocio poner todas las variables en el
fichero declarativo yaml, por que seria engorroso.
Para eso vienen los configmaps a nuestra ayuda.
Empezaremos con nuestro proyecto.
En este caso vamos a ver un basico de secrets, para poder entender mas adelante como se manejan los secrets, cuando utilicemos s2i.
si bien el projecto va a decir mariadb, vamos a usar un pod bien basico, para entender el concepto.

``oc new-project secrets``{{execute}}

Con esto creamos el nuevo proyecto secrets


Aca empezamos a forjar nuestro secrets

##Declarando los configmaps en forma declarativa


``git clone https://github.com/mguazzardo/demislamer``{{execute}}

Nos movemos al directorio
``cd demislamer``{{execute}}


Crearemos el secret de la forma man secilla

``bash mariadb-secretes/crear-mariadb-secret.sh``{{execute}}

Luego de aplicar este secret, vamos a aplicar el secret del deployconfig

Aplicamos este deployConfig

``oc create -f mariadb-secret.yaml``{{execute}}

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

``env | grep MYSQL``{{execute}}

Luego salimos

``exit``{{execute}}

El tema es que esto es a veces poco practico, y lo veremos de como levantarlo desde un fichero, con el formato clave valor.

Con esto terminamos nuestro ejercicio
