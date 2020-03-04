En este nuevo escenario, lo que vamos a hacer es como generar una imagen de docker , para que pueda correr ssh, y luego podamos conectarnos por ssh para usar ansible.


**Primero generar la imagen** 

`cd /root/DockerSSH`{{EXECUTE}}

Entramos ahi a ese directorio y ejecutamos el Dockerfile
`docker build -t centos7ssh .`{{EXECUTE}}
