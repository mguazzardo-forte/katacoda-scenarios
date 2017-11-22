**Sabemos qué es un rol y cómo funciona**, qué utilidades tiene para nosotros y cómo utilizarlos para nuestro provecho... **¿pero sabemos utilizar sus funciones más potentes?** Los roles, además de tareas y ficheros, son capaces de alojar variables propias, así como generar ficheros en base a variables que podrían cambiar de una a otra ejecución.

Nuestro rol de pruebas se encargará de crear una tarjeta identificativa para una mascota en formato .txt, que cambiará según cómo ejecutemos nuestro playbook (o cual ejecutemos). Para simplificar el ejemplo, vamos a hacer una separación entre mascotas que son mamíferos (perros y gatos) y mascotas que son ovíparos (ninfas, canarios, etc...).

Tendremos que mostrar su nombre, su género, su tipo de reproducción y el tipo de alimento que necesitan (pienso en el caso de los mamíferos, semillas en el caso de los ovíparos), así como el año de su nacimiento.

Al final generaremos las tarjetas bajo un directorio con el nombre de la mascota, que estará bajo un directorio que definirá si es mamífero o ovíparo y podremos crear todas las que queramos. 

Con el ejemplo claro... vamos a ir viendo uno a uno cómo funcionan y para qué podemos aprovechar los directorios de los roles de Ansible, en orden de aparición.

# ¿Cuál es su utilidad?
**Este directorio se encarga de albergar variables por defecto**, por si acaso alguna de ellas no la definamos, tengan un valor que permita al Rol ejecutarse sin mayor problema.

Generalmente en él vamos a definir una **variable cuyo valor no es extremadamente importante, o que sabemos que va a cambiar con bastante frecuencia**. 

En nuestro caso, estas variables serán el nombre, el género y el año de nacimiento, que son datos bastante propensos a cambiar. 

# Creando nuestro main.yml

Con esto claro, vamos a crear nuestras variables por defecto.

Primero que nada, vamos a ubicarnos en el directorio de Ansible: `cd ansible`{{execute}}

Y ahora vamos a crear el fichero main.yml dentro de 'defaults': `touch roles/katacoder/defaults/main.yml`{{execute}}

Dentro, colocaremos las siguientes líneas de código:

```yaml
---
nombre: Toby
genero: M
nacimiento: 20/11/2017
tipo: indefinido
comida: indefinido
```

Con esto listo, no necesitamos nada más de esta carpeta. 

Pasemos al siguiente directorio...
