El directorio de 'vars' **también sirve para el mismo propósito que el de 'defaults'**. En este caso, **las variables de este directorio son consideradas más como constantes ya que tienen más prioridad que las de default**. 

Aún así, si especificáramos una variable a través de la opción "-e" (extra vars), estas tendrán precedencia sobre las demás.

La **lista de precedencia de variables** vendría a ser esta:
- Variables extra (extra_vars, dadas con la *opción -e*).
- Variables de conexión (*ansible_ssh_user*, por ejemplo, que suelen ir en el inventory).
- Otras variables (de rol, incluidas con *include_vars*, las definidas en el propio playbook...).
- Resto de variables definidas en el '*inventory*'.
- *Facts* (hechos) sobre el sistema.
- Variables en '*defaults*' de un rol.

La idea es utilizar este fichero para definir variables que generalmente no vayamos a cambiar, de manera que ya no tenemos por qué referenciarlas de nuevo en un futuro y así ahorrar tiempo.

# Creando nuestro main.yml

Como ocurría en el caso del directorio defaults, si tuviéramos un solo fichero, es recomendable llamarlo "main.yml". En este caso sólo vamos a contar con una variable, que cambiará según cómo haya sido definida la variable 'tipo', que daremos como variable extra (con la opción -e) al ejecutar el rol. 

Pues bien, creemos nuestro fichero de variables para mamíferos: `touch roles/katacoder/vars/mamifero.yml`{{execute}}

Y lo rellenamos con lo siguiente:
```yaml
---
comida: Pienso
```

Además, vamos a crear un fichero de variables para los ovíparos: `touch roles/katacoder/vars/oviparo.yml`{{execute}}

Y lo rellenamos de la misma forma:
```yaml
---
comida: Semillas
```

# ¿Por qué así?

Es muy probable que te estés preguntando el motivo por el cuál separar los ficheros. Bien, **vamos a hacer una detección de estado de variable, es decir, vamos a comprobar cuál es el valor de la variable 'tipo'**, que nosotros daremos como extra vars. 

Una vez comprobado, si resulta que es mamífero, incluiremos las variables de 'mamifero.yml'; si resulta que es ovíparo, pues incluiremos las de 'oviparo.yml'.

**Así controlaremos de manera automática la asignación del tipo de comida según la tarjeta que vayamos a crear**.

Con esto listo, ya podemos pasar a la siguiente fase...
