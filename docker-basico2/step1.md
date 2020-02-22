En este nuevo escenario, lo que vamos a hacer , es ver como instalar mysql, y como conectarnos a la base de datos

veremos un ejemplo muy sencillo, para la instalación de mysql, y como se debe pasar los parámetros

de acuerdo a la documentación oficial https://hub.docker.com/_/mysql 

entonces, lo que vamos a hacer es.

**Primero buscar la imagen**

`docker search mysql | grep centos`{{EXECUTE}}

ahi vemos que tenemos varias imagenes, lo que vamos a hacer, ahora es seleccionar la que queremos correr, que es la de centos7

`docker run -d --name mysql -e 'MYSQL_ROOT_PASSWORD=master' centos/mysql-57-centos7`{{EXECUTE}}

Con esto corro el mysql, y con la clave de root master. Pero debemos fijarnos que este ejecutándose el contenedor.

`docker ps`{{EXECUTE}}

Con esto, vemos que el contenedor se está ejecutando, vamos a correr un inspect para ver la IP.

`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mysql`{{EXECUTE}}

con esto podemos ver la IP, que en el próximo paso lo usaremos para conectarnos a la base de datos.
