
En este ejemplo, veremos un configmap, de nginx, donde apuntamos el  port 8888 en vez del 80. Debajo la configuracion:


<pre class="file" data-filename="nginx_custom_default.conf" data-target="replace">

server {
    listen       8888;
    server_name  localhost;
    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }
}
</pre>

Aplicamos la configuracion
`oc create cm nginx --from-file nginx_custom_default.conf`{{execute}}

Vemos como quedo nuestro configmap:
`oc describe configmap/nginx`{{execute}}

Vemos que hemos cambiado toda la configuracion `nginx_custom_default.conf`, La cual sera usada en el pod.
