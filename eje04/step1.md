Veremos en este ejemplo, la iniciación a docker.

En primer momento, vamos a ver que este corriendo el docker engine.
`docker ps`{{EXECUTE}}

Ahora vamos a bajar la imagen de ubuntu 18.04 lts

`docker pull ubuntu:18.04`{{EXECUTE}}

Vamos a crear nuestro primer Container

`docker run -dit --name ubuntu ubuntu:18.04`{{EXECUTE}}

Vamos a ver  nuestro primer container corriendo

`docker ps`{{EXECUTE}}

Vamos a ingresar a nuestro primer container y ejecutar unos comandos

`docker exec -it ubuntu bash`{{EXECUTE}}

Vamos a actualizar los paquetes de ubuntu

`apt-get update`{{EXECUTE}}

Vamos a instalar apache y unos módulos adicionales que vamos a usar despues

`apt-get -y install apache2 net-tools curl telnet nano`{{EXECUTE}}

Vamos activar apache y ver si funciona

`service apache2 start`{{EXECUTE}}

Vamos a agregar una pagina hola.html

`echo "hola mundo" > /var/www/html/hola.html`{{EXECUTE}}

con exit salimos del contenedor,

`exit`{{EXECUTE}}

**es necesario salir del contenedor**

y vemos que todo este corriendo como corresponde. para esto hacemos.

`curl 172.18.0.2/hola.html`{{EXECUTE}}

y con esto vemos que se ejecutó correctamente el contenedor!!!

Muchas gracias!











