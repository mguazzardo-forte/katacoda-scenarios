Lanzamos una shell interactiva:
``oc rsh mypod``{{execute HOST1}}

En la shell interactiva, corremos ``cd /logs``{{execute HOST1}}

Ahi corremos el siguiente comando `echo "This file will be persisted" > log.txt`{{execute}}

Corremos `exit`{{execute}} para irnos del pod

Verificamos que  `log.txt` existe en host path by corriendo ``cat /data/volume1/log.txt``{{execute HOST1}}.

