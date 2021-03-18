Veremos en este ejemplo, la iniciación a docker.

En primer momento, vamos a ver que este corriendo el docker engine. `docker ps`{{EXECUTE}}

Nos vamos a clonar el repo de la aplicacion

`git clone https://github.com/mguazzardo/flaskapi`{{EXECUTE}}

nos posicionamos en el directorio correcto

`cd flaskapi`{{EXECUTE}}

Vamos a crear nuestro primer Container

`docker build -t flaskapi .`{{EXECUTE}}


`docker run -d --name flaskapi flaskapi`{{EXECUTE}}

vamos a ver que este corriendo 

`docker ps`{{EXECUTE}}

Vamos a ver si está todo corriendo en orden, averiguamos la IP del contenedor.

`IP=$(docker inspect flaskapi | grep IPAddress | tail -1 | awk -F":" '{print $2}' | awk -F\" '{print $2}')`{{EXECUTE}}

y ahora, le hacemos un curl al port 8080, a los dos endpoints / y /products

`curl $IP:8080/`{{EXECUTE}}

y ahora al /other

`curl $IP:8080/products`{{EXECUTE}}

todo anduvo bien, nos vamos!

Muchas gracias!

`exit`{{EXECUTE}}
