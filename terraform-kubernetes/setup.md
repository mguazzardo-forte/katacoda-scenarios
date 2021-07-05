
# Конфигурирование проекта **Terraform**

Во-первых, давайте удостоверимся, что наша **Terraform command line** работает.

Давайте быстро проверим версию CLI с помощью: 

`terraform version`{{execute}}.

## **Initialize**

Мы предоставили вам **scaffold** проекта **Terraform**, который на данный момент содержит только те бэкэнды, которые мы будем **utilize**.

`cd terraform/terraform`{{execute}}

## Давайте удостоверимся, что это работает

По умолчанию поставщик **Kubernetes** для **Terraform** будет использовать наш текущий **Kubecontext**.

Выполните следующую команду, чтобы получить список **namespaces** в кластере **Kubernetes**:

`kubectl get namespaces`{{execute}}


Revisamos lo que tenemos guardado en nuestro archivo de namespaces.tf:

`nano namespaces.tf`{{execute}}

<pre class="file" data-filename="namespaces.tf" data-target="replace">resource "kubernetes_namespace" "test" {
  metadata {
    name = "test"
  }
}
</pre>


Luego, iniciamos el proyeecto, para que cargue los plugines para el provider de terraform

`terraform init`{{execute}}

Теперь давайте спланируем "plan" изменения. Когда мы запускаем эту команду, **Terraform** будет сравнивать наше желаемое состояние (то есть, что **wrong** в наших **.tf files**) с фактическим состоянием в нашей среде и сообщать нам, что ему нужно сделать, чтобы синхронизировать их.

`terraform plan `{{execute}}

```
Plan: 1 to add, 0 to change, 0 to destroy.
```

Y como sabemos, luego de un apply , viene una ejecucion de un plan

`terraform apply plan`{{execute}}

```
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate
```

Поздравляем! Вы сделали первое изменение инфраструктуры с помощью **Terraform**. 

Повторное выполнение команды:

`kubectl get namespaces`{{execute}} 

PD: aca podriamos hacer lo mismo con 

`kubectl get namespaces`{{execute}}

должно показать новое пространство имен "test" в нашем кластере **Kubernetes**.
