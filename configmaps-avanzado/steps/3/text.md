Los configmaps se usan para almacenar datos en una aplicacion que se enceuntra corriendo. Estos datos seran inyectados a la aplicacion. La inyeccion de datos la haremos de la siguiente manera:

#### Exportamos el config

En este caso, crearemos el  Configmap desde una lista de  environment variables:


<pre class="file" data-filename="example.env" data-target="replace">
VAR_1=Hello
VAR_2=World
</pre>

`oc create cm example-config-map --from-env-file=example.env`{{execute}}


vemos como esta quedando:
`oc describe configmap/example-config-map`{{execute}}
