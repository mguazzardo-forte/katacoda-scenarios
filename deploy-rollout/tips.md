## Nos logueamos al dashboard 

La [Console](https://console-openshift-console-[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com). 

Primero creamos un proyecto

``oc new-project app-rollout``{{execute}}

``oc new-app https://github.com/mguazzardo/phpdeploy --name app --as-deployment-config``{{execute}}
