Recordemos que los Pods estan corriendo en una red aislada y privada, por eso necesitamos accesar via proxy.
Para acceder a los pods, lo haremos via proxy , con el siguiente comando en la segunda terminal `kubectl proxy` 

`echo -e "\n\n\n\e[92mStarting Proxy. After starting it will not output a response. Please click the first Terminal Tab\n"; kubectl proxy`{{execute T2}}

Ahora  de nuevo , Nosotros obtendremos el nombre del pod y preguntaremos directamente a traves del proxy.
Para adquireir el nombre del pod, lo tenemos en la variable de ambiente  POD_NAME:

`export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME`{{execute T1}}

Para ver la salida de nuestra app corremos `curl`.

`curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/proxy/`{{execute T1}}

Esta ruta nos comunicara mediante la  API hacia el  Pod.
