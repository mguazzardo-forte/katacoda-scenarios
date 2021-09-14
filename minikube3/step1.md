verifiquemos  que la applicacion que  hemos  desplegado en el escenario anterior este corriendo. Lo haremos con `kubectl get`  y miramos los  Pods:

`kubectl get pods`{{execute}}

Si no hay pods corriendo, aun esta cargando el escenario. Por favor espere, o puede correr kubectl get po -w . Podremos continuar cuando esten los pods en estado Running.

Lo proximo, Para ver que hay en los pods y con que imagenes han sido creados nosotros corremos `describe pods`:

`kubectl describe pods`{{execute}}

Vemos detalles sobre los pods como: IP address, Los puertos que usan y una  lista de eventos relacionados con el ciclo de vida de los pods.

La salida de  `describe` es muy  amplia, no nos preocupemos si aun no lo entendemos.

*Note: La salida de describe puede ser utilizada para varias primitivas de kubernetes como: node, pods, deployments. La salida esta en un formato humano, no es esta en un formato facil de scriptear*
