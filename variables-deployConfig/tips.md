## Nos logueamos al dashboard 

## Crearemos un nuevo deployment

``oc new-project variables``{{execute}}

Con esto creamos el nuevo proyecto variables

`wget https://raw.githubusercontent.com/mguazzardo/demislamer/master/deploy-variables.yaml`{{execute}}

Aplicamos este deployConfig

``oc crete -f deploy-variables.yaml``{{execute}}

Si queremos ver el progreso, lo que hacemos es lo siguiente

``oc get po -w``{{execute}}

Esperamos, y cuando todo este ok, hacemos lo siguiente

Entramos al pod, y vemos las variables desplegadas


Con esto vemos nuestro primer despliegue con DockerHub
