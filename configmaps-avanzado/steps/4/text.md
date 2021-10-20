
Ahora inyectamos esto dentro de un pod. Creamos un pod my simple y le inyectamos nuestra ConfigMap:

<pre class="file" data-filename="example-pod-1.yml" data-target="replace">
apiVersion: v1
kind: Pod
metadata:
  name: example
spec:
  containers:
    - name: example
      image: cirros
      command: ["/bin/sh", "-c", "env"]
      envFrom:
        - configMapRef:
            name: example-config-map
</pre>

y creamos el objeto pod con el siguiente comando:
`oc create -f example-pod-1.yml`{{execute}}

 Vemos estas variables de ambiente en los  logs:
`oc logs po/example`{{execute}}

```
...
<output omitted>
...
VAR_1=Hello
VAR_2=World
```

Como vemos las dos variables de nuestro  ConfigMap han sido inyectadas dentro del contendedor.

Borramos el contenedor...
`oc delete po/example`{{execute}}
