¡Llegó la hora!

Por fin, tras un rato configurando nuestro rol y explicando nuestra pequeña y 'revolucionaria' idea :)... **podemos empezar a ajustar nuestro *playbook.yml* para dar rienda suelta a nuestras ejecuciones**.

# Terminando el playbook.yml
Como parte de este curso, desde el principio se ha creado un playbook.yml por defecto. Este *playbook.yml* nos serviría en situaciones normales, donde tuvieramos un directorio "vars" con un único main.yml, pero no es nuestro caso.

**Nosotros contamos con dos ficheros de variables, y eso vamos a tener que ajustarlo**. Para esto existe un parámetro de Ansible que sería el siguiente:

```yaml
  vars_files:
    - roles/katacoder/vars/{{ tipo }}.yml
```

Esto **tendríamos que ponerlo debajo del parámetro de roles, a su mismo nivel**. Para que quede más claro, esto quedaría así:

```yaml
---
- hosts: localhost
    roles:
      - katacoder
    vars_files:
      - roles/katacoder/vars/{{ tipo }}.yml
```

Como se puede apreciar, **él va a detectar el tipo**: una vez más, es el parámetro que nosotros daremos como extra-vars, con la opción -e del comando de ansible-playbook.

Para hacer esto, ejecutaremos el siguiente comando, cerciorándonos de que estamos en el directorio correcto (`cd /home/scrapbook/tutorial/ansible/`{{execute}}: `ansible-playbook -e tipo=mamifero playbook.yml`{{execute}}

Una vez el playbook se ejecute, si todo ha ido bien, veremos que bajo el directorio "tarjetas" se nos ha creado un subdirectorio bajo el directorio "mamiferos" llamado "Toby" y dentro un "tarjeta.txt" que podremos leer con `cat /home/scrapbook/tutorial/tarjetas/mamiferos/Toby/tarjeta.txt`{{execute}}

**¡Genial!**


# Comprobando las prioridades de variables
¿Recordáis que en la carpeta '*defaults*' dimos todos los valores y, además, los de comida y tipo los dimos como "indefinido"? En una ejecución correcta, **hemos visto que tanto la variable "comida" como la de "tipo" fueron sustituidas por la que le tocaba**: la primera por estar en el fichero main.yml bajo la carpeta 'vars'; la segunda por dar el valor de la variable como parámetro de la ejecución (como un *extra vars*).

Si por ejemplo hubieramos definido, también, la variable 'tipo' dentro del fichero 'mamifero.yml', ¿qué hubiera ocurrido?

Siguiendo las reglas de prioridad, al dar la variable tipo como extra vars, tendría precedencia sobre TODAS las variables definidas, ya sea en el inventario, como en defaults, como en vars.

**Prueba tú mismo:** cambia el nombre de la mascota en el main.yml de 'defaults', y añade la variable 'tipo' dentro de mamifero.yml (o oviparo.yml, a tu gusto). Dándole el valor que tu quieras, tras ejecutar nuevamente el comando `ansible-playbook -e tipo=mamifero playbook.yml`{{execute}} veremos que se crea una nueva carpeta bajo mamíferos... Esto es así porque la variable dada con la opción -e tiene precedencia sobre la definida en el fichero de variables 'vars'.


# Ejecuciones incorrectas
¿Y qué hay de las *ejecuciones incorrectas*? **Puede suceder que el playbook se ejecute sin darle la opción -e y sin definir la variable de tipo**, ¿no?

Pues bien, si ocurriera, **no se cargarían las variables dentro del directorio 'vars' y sucedería lo siguiente:**
- Se cargarían únicamente las variables en 'defaults'.
- Se crearía una subcarpeta bajo "tarjetas" con el nombre "indefinidos" (porque en defaults tenemos la variable tipo asignada como "indefinido").
- Se crearía una subcarpeta bajo esa con el nombre de la mascota.
- Dentro de la tarjeta.txt se rellenaría con los datos tal cual están en el fichero de 'defaults'.

Con esto cubriríamos las ejecuciones incorrectas y el rol no tendría por qué fallar.

Y sí, puedes probarlo tú mismo también. Solo requiere ejecutar el siguiente comando: `ansible-playbook playbook.yml`{{execute}}


# ¿Algo más que añadir?
Este rol, obviamente, es algo muy simple y sin un uso práctico en el mundo real, pero siguiendo su esquema seríamos capaces de utilizar las variables, las templates y los distintos directorios de un rol de Ansible.

A partir de ahora podrías **dedicar un poco de tiempo a mejorar un poco el rol**...

Por ejemplo: repetimos mucho la ruta "/home/scrapbook/tutorial"... ¿no sería interesante cubrir esta ruta con una variable? La podríamos colocar bajo el directorio "defaults" en su main.yml y utilizarla en las tasks del propio rol. 

Podríamos hacer lo mismo con la carpeta de las tarjetas... Una variable que tenga definida la ruta "/home/scrapbook/tutorial/tarjetas".

E incluso una variable más para tener definido el directorio de Ansible bajo "/home/scrapbook/tutorial/ansible".

**De esta manera ahorraríamos mucho tiempo a la hora de escribir más tasks y, de paso, el código quedaría mucho más bonito y legible.**
