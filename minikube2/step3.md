Los PODS (Minima unidad del cluster) estan corriendo dentro de kubernetes en una red aislada y privada
Por default ellos estan visibles desde los otros pods y desde los servicios , siempre desde el mismo cluster, pero NUNCA desde el exterior.
Para solucionar esto , veremos mas adelante ingress, y otros metodos

 el comando `kubectl` puede crear un proxy que puede forwardear comunicaciones dentro de la red del cluster. El  proxy se terminara con control-C. 

Abriremos una segunda terminal para poder correr el proxy.

```
echo -e "\n\n\n\e[92mStarting Proxy. After starting it will not output a response. Please click the first Terminal Tab\n"; 
kubectl proxy
```{{execute T2}}

Ahora tenemos una comunicacion entre el host (la terminal) y el  Kubernetes .

Ud podra ver las APIs  de kubernetes y sus respectivos endpoints. Por ejemplo, veremos una consulta a la API directa, usando  `curl`:

`curl http://localhost:8001/version`{{execute T1}}


**Si el  Puerto 8001 no está accesible, asegurese que el   `kubectl proxy` este corriendo.**

The API server  automaticamente crea un endpoint por cada pod, basado  en  el nombre del pod.

Lo primero que necesitamos es el nombre del POD, y lo alojaremos en la variable POD_NAME:

`export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME`{{execute T1}}

Ud podra acceder a esta corriendo running:

`curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/`{{execute T1}}

Pero como veremos, el tema del proxy no es lo mas comodo, mas adelante veremos el tema de los servicios.
