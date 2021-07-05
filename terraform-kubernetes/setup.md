
# vamos a ver un simple ejemplo de  **Terraform**

La idea es utilizar a terraform contra el proveedor de kubernetes.
En este primer ejemplo, lo que realizaremos es sencillo, vamos a generar un
nuevo namespace, llamado test.
Para eso lo que vamos a generar es un plan y luego un apply de nuestro namespace.tf
Lo primero que vamos a realizar, y dado a que esto puede tardar, es ver
si carga terraform, en la primera ejecucion seguro que falla, pero esperamos
y lo volvemos a correr.
 

`terraform version`{{execute}}.

## **Initializando**

Como ya me genere un archivo en el directorio de terraform **Terraform**,  ejecutamos **utilize**.

`cd terraform/terraform`{{execute}}

## Veamos que namespaces tenemos corriendo

Vamos a ver que namespaces tenemos corriendo. Para ello lo mas sencillo es
ejecutar el comando que tenemos a continuacion.
Para mas adelante veremos otros ejemplos.

`kubectl get namespaces`{{execute}}


Revisamos lo que tenemos guardado en nuestro archivo de namespaces.tf:

`cat namespaces.tf`{{execute}}

<pre class="file" data-filename="namespaces.tf" data-target="replace">resource "kubernetes_namespace" "test" {
  metadata {
    name = "test"
  }
}
</pre>


Luego, iniciamos el proyeecto, para que cargue los plugines para el provider de terraform

`terraform init`{{execute}}

Esto nos inicializara el directorio donde esta cargado todo, y luego debemos
correr un terraform plan

`terraform plan `{{execute}}

```
Plan: 1 to add, 0 to change, 0 to destroy.
```

Y como sabemos, luego de un apply , viene una ejecucion de un plan

`terraform apply`{{execute}}

```
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate
```
Veamos si se genero bien.

`kubectl get namespaces`{{execute}} 

PD: aca podriamos hacer lo mismo con 

`kubectl get namespaces`{{execute}}

