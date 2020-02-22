Lo que vamos a ver ahora es como instalar un contenedor de apache con php.

Lo primero que vamos a ver, es como buscar imágenes, con el comando docker search. 

La imagen de eboraas, es la que me gusta , ya que tiene, apache y php sobre debian

**vamos a buscarla**

`docker search eboraas | grep -w "apache-php"`{{EXECUTE}}

lo que haremos, es bajarla, correrla en detach, y verla como anduvo.

`docker run -d --name apache eboraas/apache-php`{{EXECUTE}}

**como vemos, ponemos la primer imagen, el path al repo de docker**

**Comprobando que todo esta andando**

Lo primero que debemos hacer, es ver que está corriendo el contenedor.

`docker ps` y ahi vemos que esta corriendo el contenedor.

**haciendo una inspección del contenedor**

`docker inspect apache | grep -i ip`{{EXECUTE}}

En este caso, la ip que me dió es la 172.18.0.2

Podemos hacer un curl a la ip 172.18.0.2

Pero vemos que nos da la página de apache por defecto de debian, lo que queremos hacer, es ingresar al contenedor, 

y generar una página. como sabemos que el nombre del contenedor es apache, hacemos lo siguiente

`docker exec -it apache bash`{{EXECUTE}}

una vez que estamos dentro, hacemos

`echo "hola mundo" > /var/www/html/hola.html`{{EXECUTE}}

con exit salimos del contenedor, 

`exit`{{EXECUTE}} 

**es necesario salir del contenedor**

y vemos que todo este corriendo como corresponde. para esto hacemos.

`curl 172.18.0.2/hola.html`{{EXECUTE}}

y con esto vemos que se ejecutó correctamente el contenedor!!!

Muchas gracias!

