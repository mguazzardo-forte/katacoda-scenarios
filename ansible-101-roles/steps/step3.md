El directorio de 'vars' también sirve para el mismo propósito que el de 'defaults'. En este caso, las variables son consideradas más como constantes ya que tienen más prioridad que las otras. 

Aún así, si especificáramos una variable a través de la opción "-e" (extra vars), estas tendrán precedencia sobre las demás. 

La idea es utilizar este fichero para definir variables que generalmente no vayamos a cambiar, de manera que ya no tenemos por qué referenciarlas de nuevo en un futuro y así ahorrar tiempo.

# Creando nuestro main.yml

Como ocurría en el caso del directorio defaults, si tuviéramos un solo fichero, es recomendable llamarlo "main.yml". En este caso sólo vamos a contar con una variable, que cambiará según el playbook al que llamemos.  
