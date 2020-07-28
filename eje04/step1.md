Veremos en este ejemplo, como generar una imagen desde dockerfile.

En primer momento, vamos a ver que este corriendo el docker engine.
`docker ps`{{EXECUTE}}

Ahora vamos a correr el docker build

`docker build -t apache01 .`{{EXECUTE}}

Vamos a ver si se genero la imagen

`docker images`{{EXECUTE}}

Vamos a correr el container

`docker run -d --name apache apache01`{{EXECUTE}}

Vamos a ver la IP que tiene asignada el container (De paso scripteamos un poco)

`IP=$(docker inspect apache | grep IPAddress | tail -1 | awk -F: '{print $2}' | awk -F\" '{print $2});;echo $IP`{{EXECUTE}}

ahora vamos a instalar un navegador

`apt -y install lynx`{{EXECUTE}} 

Por ultimo, hacemos la prueba final

`lynx $IP/hola.html`{{EXECUTE}}


Muchas gracias!











