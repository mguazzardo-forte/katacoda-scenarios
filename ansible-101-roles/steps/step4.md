Y por fin podemos empezar a crear nuestras tareas. **Es recomendable que esto se haga por último**, ya que es muy probable que en el proceso de crear o modificar tu rol, modifiques los nombres de los ficheros o la forma de obtener variables... Por eso es mejor tener todo claro y luego ya ajustar el fichero de tareas.

# Rellenando el main.yml
Debido a que en cuanto a este fichero tenemos muy claro su objetivo, **no vamos a indagar mucho más en él**.

Así que simplemente creemos el fichero y comencemos: `touch roles/katacoder/tasks/main.yml`{{execute}}

Para empezar, **vamos a necesitar que el rol cree la carpeta de la mascota dentro de su tipo de reproducción**. Si es 'mamifero', se creará un subdirectorio dentro del que ya está creado, con el nombre de la mascota, y dentro un "tarjeta.txt" con todos los datos.

Gracias a las variables, **vamos a automatizar esto de manera que no nos importe cuál es el nombre de la mascota, mucho menos su tipo de reproducción**, que siempre definimos al llamar al playbook con la opción -e.

Para llamar a variables dentro del main.yml de nuestro directorio tasks, tendremos que usar esta forma: `{{ variable }}`.

Lo mejor de todo, es que es fácilmente encadenable con rutas u otras cadenas.

Vamos a verlo en la práctica, introduciendo esto en el fichero main.yml:

```yaml
---
- name: Create pet's own folder
    file:
      path: /home/scrapbook/tutorial/tarjetas/{{ tipo }}s/{{ nombre }}
      state: directory
```

**Como podemos apreciar en el 'path', es decir, en la dirección, utilizamos dos variables para la creación del directorio propio de la mascota**. La primera es el tipo, que definiremos en singular: como el directorio está creado en plural, podemos hacer el truco de encadenarle la s a la variable, de manera que una vez se ejecute el rol, Ansible lo sustituirá, quedándole la ruta `/home/scrapbook/tutorial/tarjetas/mamiferos` (por ejemplo).

Así mismo, completará luego con el nombre de la mascota, definido en el fichero del directorio defaults. Nuestra mascota de pruebas se llama 'Toby', por lo que así se llamará el directorio.

Ahora, para crear la template, también utilizaremos el mismo 'truco':

```yaml
- name: Create pet's card with its name
    template:
      src: tarjeta.j2
      dest: /home/scrapbook/tutorial/tarjetas/{{ tipo }}s/{{ nombre }}/tarjeta.txt
```

Como podemos ver, **a la hora de dar el fichero, a través de la opción "src" (origen) del módulo de templates, no necesitaremos más que darle el propio nombre**. Esto es así porque el módulo "template" presupone que tiene que mirar dentro del directorio 'templates' de nuestro rol.

En cuanto al destino, vamos a utilizar la misma idea que con la creación del directorio, aunque en este caso añadiendo el nombre del fichero donde se escupirá el resultado del uso de la plantilla (tarjeta.txt).

Sencillo, ¿cierto?

**Con esto ya hemos rellenado todos nuestros directorios del rol**, pero aún nos queda un pequeño paso para poder empezar a ejecutarlo y ver su resultado...

Seguimos en el siguiente paso :).
