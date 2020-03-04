ahora bien, sabemos la ip, que en este caso es **172.18.0.2** y sabemos la clave de root que es master.

Nos falta instalar el cliente mysql. para eso hacemos lo siguiente

`apt update`{{EXECUTE}}

y luego 

`apt install -y mysql-client-core-5.7`{{EXECUTE}}

Una vez que tenemos esto, nos conectamos finalmente a la base de datos

`mysql -u root -pmaster -h 172.18.0.2`{{EXECUTE}}

y con esto terminamos el ejercicio
