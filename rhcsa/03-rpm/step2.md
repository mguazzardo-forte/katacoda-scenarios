**<pre> Verificamos si nuestro  apache web server esta instalado </pre>**
<pre>Sino , es es una buena oportunidad para hacerlo</pre>

`yum list installed | grep httpd`{{execute}}


>>Q1: Que comando nos mostrara todos los paquetes que contienen /var/www/html<<
( ) yum -? /var/www
(*) yum whatprovides /var/www
( ) yum find /var/www

**<pre> Actualizando nuestro apache web server</pre>**

`CHECK=$( yum update httpd | grep "^No" | awk '{print $1}') ; if [[ $CHECK == No ]] ; then echo congrats ; else echo "Update Apache"; fi`{{execute}}

**<pre> Ahora removemos nuestro apache web server. </pre>**



