 La salida de la aplicacion deberia mandarse hacia `STDOUT` , pero para recibir estos logs, tenemos el siguiente  comando `kubectl logs`:

`kubectl logs $POD_NAME`{{execute T1}}

*Nota: Nosotros no necesitamos especificar el nombre del contenedor, por que hay un solo contenedor dentro del pod*
