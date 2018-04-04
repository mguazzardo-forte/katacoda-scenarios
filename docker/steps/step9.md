
**Objetivo: Crear redes, volúmenes y servicios para desplegar una aplicación de ejemplo "_cats vs dogs_".**

Antes que nada vamos a inicializar el modo _Swarm_ de _Docker_, ejecutando ``docker swarm init``{{execute HOST1}}

Esto nos dejará con un _cluster_ que solo dispone de un nodo, que hace de líder y de _manager_, algo que podemos ver con la siguiente orden en línea, ``docker node ls``{{execute HOST1}}.

Para añadir un nodo '_worker_' al _cluster_ copiaremos la instrucción que nos ha facilitado el _manager_ al iniciar el modo _Swarm_ en el ``HOST 1`` y la pegaremos en el terminal del ``HOST 2``.

Ahora podemos ver cómo se ha modificado el estado de nuestro _cluster_, ejecutando de nuevo ``docker node ls``{{execute HOST1}}

Nos situamos en el directorio del ejercicio ``cd /home/scrapbook/tutorial/training-setup/training-samples/6-swarm-sample && ll``{{execute}}

- En el diagrama se puede ver cómo interactúan los cinco servicios que componen la aplicación.

![Arquitectura](https://cdn-images-1.medium.com/max/1024/0*LaLpavOVZGWNiLI_.)

- Todas las imágenes están en _Docker Hub_
- Necesitaremos dos redes superpuestas, `backend` y `frontend`, básicamente para que los datos no están accesibles desde el front-end web.
- La persistencia para la BB.DD. la configuramos con: `--mount type=volume,source=db-data,target=/var/lib/postgresql/data`

### Servicios
- vote
    - `dockersamples/examplevotingapp_vote:before`
    - la web donde los usuarios votarÃ¡n _dog/cat_
    - publicará el puerto TCP 80. El contenedor escucha en el puerto 80
    - red `frontend`
    - mínimo 2 réplicas

- redis
    - `redis:3.2`
    - almacén clave/valor para guardar los votos
    - no publica puerto alguno
    - red `frontend`
    - 1 réplica

- worker
    - `dockersamples/examplevotingapp_worker`
    - procesa los datos de redis y los almacena en la BB.DD.
    - no publica puertos
    - redes `frontend` y `backend`
    - 1 réplica

- db
    - `postgres:9.4`
    - un volumen, apuntando a `/var/lib/postgresql/data`
    - red `backend`
    - 1 réplica

- result
    - `dockersamples/examplevotingapp_result:before`
    - web donde se muestran los resultados de las votaciones
    - es un servicio que escuchará en un puerto alto (e.g. 5001). El contenedor escuchará en el 80.
    - red `backend`
    - 1 réplica

> *Fuente:* Adaptado del curso _Udemy_ [_Docker Mastery_](https://www.udemy.com/docker-mastery/learn/v4/content), de [Brent Fisher](https://www.bretfisher.com/)
