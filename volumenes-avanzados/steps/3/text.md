En este paso, crearemos un  Persistent Volume Claim. Lo usaremos para reclamarlo.

# Tarea
Para completar este paso, definimos un PersistentVolumeClaim called `claim1` ay definimos al  `volumeName` como _volume1_ pidiendo `requests` as _storage: "5Gi"_.

Lo ejecutaremos  `oc create -f volume-claim.yaml`{{execute HOST1}}
