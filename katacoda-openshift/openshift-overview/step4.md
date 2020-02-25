## Labels

All object in OpenShift have labels, label is key value like `app=hello`

Labels are used widely in OpenShift infrastructure.

 ``oc get pod --show-labels``{{execute}}

Output:
```
NAME               READY     STATUS      RESTARTS   AGE       LABELS
po/hello-1-build   0/1       Completed   0          54m       openshift.io/build.name=hello-1
po/hello-1-nk58l   1/1       Running     0          53m       app=hello,deployment=hello-1,deploymentconfig=hello
```

## Labels in Service

``oc describe svc hello``{{execute}}

Output:
```
Name:                   hello
Namespace:              myproject
Labels:                 app=hello
Annotations:            openshift.io/generated-by=OpenShiftNewApp
Selector:               app=hello,deploymentconfig=hello
Type:                   ClusterIP
IP:                     172.30.103.221
Port:                   8080-tcp        8080/TCP
Endpoints:              172.20.0.3:8080
Session Affinity:       None
Events:                 <none>
```

Selector defines what labels Pod need to have to be part of Service.
As you can see in this case it is `app=hello,deploymentconfig=hello`

## Labels in Replication Controller

Replication controller ensure to 

``oc describe replicationcontroller hello-1``{{execute}}

Output:
```
Name:           hello-1
Namespace:      myproject
Selector:       app=hello,deployment=hello-1,deploymentconfig=hello
Labels:         app=hello
                openshift.io/deployment-config.name=hello
Annotations:    openshift.io/deployer-pod.name=hello-1-deploy
                openshift.io/deployment-config.latest-version=1
                openshift.io/deployment-config.name=hello
                openshift.io/deployment.phase=Complete
                openshift.io/deployment.replicas=1
                openshift.io/deployment.status-reason=image change
                openshift.io/encoded-deployment-config={"kind":"DeploymentConfig","apiVersion":"v1","metadata":{"name":"hello","namespace":"myproject","selfLink":"/apis/apps.openshift.io/v1/namespaces/myproject/deplo...
Replicas:       1 current / 1 desired
Pods Status:    1 Running / 0 Waiting / 0 Succeeded / 0 Failed
Pod Template:
  Labels:       app=hello
                deployment=hello-1
                deploymentconfig=hello
  Annotations:  openshift.io/deployment-config.latest-version=1
                openshift.io/deployment-config.name=hello
                openshift.io/deployment.name=hello-1
                openshift.io/generated-by=OpenShiftNewApp
  Containers:
   hello:
    Image:              172.30.190.229:5000/myproject/hello@sha256:b9088f5b6cbe9d26b9617d4dd4029fc9706aaa0e1718d1ac24027d0b501aee2a
    Port:               8080/TCP
    Environment:        <none>
    Mounts:             <none>
  Volumes:              <none>
Events:
  FirstSeen     LastSeen        Count   From                    SubObjectPath   Type      Reason                   Message
  ---------     --------        -----   ----                    -------------   --------  ------                   -------
  3m            3m              1       replication-controller                  Normal    SuccessfulCreate Created pod: hello-1-070ht
```

Selector here defines what labels pod need to have to be associated with replication controller, in this case it is `app=hello,deployment=hello-1,deploymentconfig=hello`

## Query using labels

You can use labels to query objects

``oc get pod -l "deployment=hello-1"``{{execute}}

produce list of pod that are have label `deployment=hello-1`

## Remove label

Let's remove label `deployment` from existing pod

``oc label $(oc get pod -l "deployment=hello-1" -o name) deployment-``{{execute}}

Now observe what happened

``oc get pod --show-labels``{{execute}}

It shows now two pods in Status Running, as replication controller could not find pod matching selector and starts new one.

Noticed that [service](https://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com/console/project/myproject/browse/services/hello?tab=details) uses two pod as selectors match.


## Clean up

Let's remove all what what created using label

First list what you want to delete

``oc get all -l "app=hello"``{{execute}}

When you happy with the list execute

``oc delete all -l "app=hello"``{{execute}}
