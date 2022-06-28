ahora bien, sabemos la ip, del servera es  **172.18.0.2** y sabemos la clave de root que es master.

Nos falta crear el keygen de nuestro server hosts.

`ssh-keygen -t rsa`{{execute}}

y luego  todas las veces que nos pida enter

Luego, copiar esta llave al servera

`ssh-copy-id servera`{{execute}}

Y nos va a pedir , por única vez la clave de root, que es master, y luego probamos nuevamente

`ssh servera`{{execute}}

y con esto vemos que ya se genero el cruce de llaves ssh. 

**Viendo un ejemplo sencillo**

vamos a ver el ejemplo que ya tenemos cargado....

`ansible-playbook  playbook.yml -i inventory`{{execute}}


