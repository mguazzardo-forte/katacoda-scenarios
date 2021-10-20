En este paso, Crearemos un persistent volumen. Este es el storage que sera usado por los pods.

# Tareas
Definimos  `volume1` y definimos el  `hostPath` como
_path: /data/volume1_ with `capacity` as _storage: 10Gi_.

Creamos el PV como hostpath con el siguiente comando `oc create -f volume.yaml`{{execute HOST1}}. 

Tendremos un PV en el path `/data/volume1`.

