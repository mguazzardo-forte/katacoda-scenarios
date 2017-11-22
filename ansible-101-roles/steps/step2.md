El directorio 'templates' **se encarga de albergar los diferentes ficheros que sirven como plantillas para el rol de Ansible**. A través del lenguaje de plantillas [Jinja 2](http://jinja.pocoo.org/docs/2.10/), especialmente diseñado para Python, podremos crear plantillas rápidas y fáciles de entender por cualquier persona, con ejecución aislada y muy fácil de debuggear en caso de cualquier problema.

# ¿Cuál es su utilidad?

Generalmente este directorio de plantillas **se suele utilizar a la hora de configurar máquinas que necesitan de ficheros de configuración que podrían verse alterados**. También se puede utilizar para **generar imágenes Docker con una versión específica** (que colocaríamos en el Dockerfile generado a través de Jinja 2) **o con un hostname específico para el contenedor**, etc...

El límite realmente lo pone tu imaginación.

Con él podemos crear un rol independiente cuyo resultado variará según la ejecución. 

# Creando nuestra plantilla

En nuestro caso de ejemplo no tenemos mucho que crear, pero es totalmente posible colocar tantos ficheros como queramos en este directorio. Como nosotros no necesitamos más que uno, vamos a crearlo ya mismo: `touch roles/katacoder/templates/tarjeta.j2`{{execute}}

Y la vamos a rellenar de la siguiente manera, siguiendo nuestra idea:

```jinja2
--- TARJETA IDENTIFICATIVA DE MASCOTA
- Nombre: {{ nombre }}
- Genero: {{ genero }}
- Reproduccion: {{ tipo }}
- Alimentacion: {{ comida }}
- Fecha de nacimiento: {{ nacimiento }}
```

Como se puede apreciar, **las variables para Ansible han de ser definidas de esta manera, con los "{{ }}" alrededor y sus correspondientes espacios**. Esto es muy importante por que de lo contrario Ansible se va a quejar de que algo está mal escrito.

Más adelante haremos referencia a esta plantilla, pero por ahora ya hemos terminado con esta parte.

Continuemos...
