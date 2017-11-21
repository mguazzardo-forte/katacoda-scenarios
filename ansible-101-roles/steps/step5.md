¡Llegó la hora!

Por fin, tras un rato configurando nuestro rol y explicando nuestra pequeña y 'revolucionaria' idea :)... podemos empezar a ajustar nuestro playbook.yml para dar rienda suelta a nuestras ejecuciones.

# Terminando el playbook.yml
Como parte de este curso, desde el principio se ha creado un playbook.yml por defecto. Este playbook.yml nos serviría en situaciones normales, donde tuvieramos un directorio "vars" con un único main.yml, pero no es nuestro caso.

Nosotros contamos con dos ficheros de variables, y eso vamos a tener que ajustarlo.

Para esto existe un parámetro de Ansible que sería el siguiente:

```yaml
  vars_files:
    - roles/katacoder/vars/{{ tipo }}.yml
```

Esto tendríamos que ponerlo debajo del parámetro de roles, a su mismo nivel. Para que quede más claro, esto quedaría así:

```yaml
---
- hosts: localhost
  roles:
    - katacoder
  vars_files:
    - roles/katacoder/vars/{{ tipo }}.yml
```

Como se puede apreciar, él va a detectar el tipo: una vez más, es el parámetro que nosotros daremos como extra-vars, con la opción -e del comando de ansible-playbook.

Para hacer esto, ejecutaremos el siguiente comando, cerciorándonos de que estamos en el directorio correcto (`cd /home/scrapbook/tutorial/ansible/`{{execute}}: `ansible-playbook -e tipo=mamifero playbook.yml`{{execute}}

Una vez el playbook se ejecute, si todo ha ido bien, veremos que bajo el directorio "tarjetas" se nos ha creado un subdirectorio bajo el directorio "mamiferos" llamado "Toby" y dentro un "tarjeta.txt" que podremos leer con `cat /home/scrapbook/tutorial/tarjetas/mamiferos/Toby/tarjeta.txt`{{execute}}

¡Genial!

# ¿Algo más que añadir?
Este rol, obviamente, es algo muy simple y sin un uso práctico en el mundo real, pero siguiendo su esquema seríamos capaces de utilizar las variables, las templates y los distintos directorios de un rol de Ansible.

A partir de ahora podrías dedicar un poco de tiempo a mejorar un poco el rol...

Por ejemplo: repetimos mucho la ruta "/home/scrapbook/tutorial"... ¿no sería interesante cubrir esta ruta con una variable? La podríamos colocar bajo el directorio "defaults" en su main.yml y utilizarla en las tasks del propio rol. 

Podríamos hacer lo mismo con la carpeta de las tarjetas... Una variable que tenga definida la ruta "/home/scrapbook/tutorial/tarjetas".

E incluso una variable más para tener definido el directorio de Ansible bajo "/home/scrapbook/tutorial/ansible".

De esta manera ahorraríamos mucho tiempo a la hora de escribir más tasks y, de paso, el código quedaría mucho más bonito y legible.
