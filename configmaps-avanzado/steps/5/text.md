
Crearemos un pod que pase las variables por echo en linea de comando:

<pre class="file" data-filename="example-pod-2.yml" data-target="replace">
apiVersion: v1
kind: Pod
metadata:
  name: example2
spec:
  containers:
    - name: example2
      image: cirros
      command: ["/bin/sh", "-c", "echo ${VAR_1} ${VAR_2}"]
      envFrom:
        - configMapRef:
            name: example-config-map
</pre>

Creamos el objeto:
`oc create -f example-pod-2.yml`{{execute}}

Vemos los logs
`oc logs po/example2`{{execute}}

```
Hello World
```

Borramos el pod
`oc delete po/example2`{{execute}}
