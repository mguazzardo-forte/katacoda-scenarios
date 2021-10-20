# Hora de probar
Llego la hora de probar esta config. Crearemos el siguiente recurso:

<pre class="file" data-filename="example-pod-3.yml" data-target="replace">
apiVersion: v1
kind: Pod
metadata:
  name: example3
  labels:
    role: web
spec:
  containers:
  - name: example3
    image: nginx
    volumeMounts:
    - name: conf
      mountPath: /etc/nginx/conf.d
  volumes:
  - name: conf
    configMap:
      name: nginx
      items:
      - key: nginx_custom_default.conf
        path: default.conf
</pre>


Ahora creamos el pod:
`oc create -f example-pod-3.yml`{{execute}}

Creamos un servicio para el pod:
`oc expose po/example3 --port 8888`{{execute}}


**Note:** Hemos definido en forma explicita el servicio.

Lo exponemos para tener la ruta:
`oc expose svc/example3`{{execute}}

`oc get route`{{execute}}

Finalmente, usaremos curl para ver si todo salio bien!:
`curl -H 'Host: example3-advanced.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com' 127.0.0.1`{{execute}}

```
...
<output omitted>
...
<title>Welcome to nginx!</title>
...
<output omitted>
...
```

Como vemos ngnix esta escuchando  en el  puerto 8888/tcp, como especificamos en el ConfigMap. con esto concluimos el ejercicio de  ConfigMaps, por eso borramos nuestro lab:
`oc delete all --all`{{execute}}

`oc delete configmap --all`{{execute}}

