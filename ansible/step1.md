En este nuevo escenario, lo que vamos a hacer es como generar una imagen de docker , para que pueda correr ssh, y luego podamos conectarnos por ssh para usar ansible.


**Primero generar la imagen** 

`cd /root/DockerSSH`{{EXECUTE}}

Entramos ahi a ese directorio y ejecutamos el Dockerfile

`docker build -t centos7ssh .`{{EXECUTE}}

Lo que hacemos despues, es luego de generar la imagen de centos con ssh y systemd, correr el container

`docker run -itd --privileged --name=servera centos7ssh`{{execute}}

y luego vemos que este corriendo 

`docker ps`{{execute}}

Luego, generamos dos containers mas, con el password siempre de ``master`` 

`docker run -itd --privileged --name=serverb centos7ssh`{{execute}}

`docker run -itd --privileged --name=serverc centos7ssh`{{execute}}

y luego vemos que este corriendo

`docker ps`{{execute}}

agregamos hosts al /etc/hosts

`echo "172.18.0.2 servera" >> /etc/hosts`{{execute}}

`echo "172.18.0.3 serverb" >> /etc/hosts`{{execute}}

`echo "172.18.0.4 serverc" >> /etc/hosts`{{execute}}

Luego, tratamos de ingresar a los hosts, para ver si estan corriendo bien.

`ssh servera`{{execute}}

Le damos al yes, por el fingerprinting para darle ok, y vemos que entramos. asi lo hacemos con cada uno de ellos, y vemos que esta ok

`ssh serverb`{{execute}}

`ssh serverc`{{execute}}

Veamos eso
