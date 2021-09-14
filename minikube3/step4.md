Nosotros podemos ejecutar los comandos directamente dentro del contenedor una vez que este este corriendo. Para eso utilizamos el nombre del pod y el verbo exec. Veamos la lista de variable de ambiente del pod.
`kubectl exec $POD_NAME -- env`{{execute T1}}

De nuevo, vemos que tenemos un solo contenedor corriendo dentro del pod.

Vamos por mas, y abrimos una sesion interactiva en el pod:

`kubectl exec -ti $POD_NAME -- bash`{{execute T1}}

Tenemos una consola donde estamos corriendo nuestra propia aplicacion en  NodeJS application. Podemos ver el codigo del archivo server.js:

`cat server.js`{{execute T1}}

Veremos si la aplicacion esta corriendo con el siguiente comando:

`curl localhost:8080`{{execute T1}}

Para cerrar la conexion deberemos tipear  `exit`{{execute T1}}.
