
## Create application 
It is time to start using new image, but first some OpenShift [glossary](http://v1.uncontained.io/playbooks/fundamentals/building_blocks_openshift.html)

* **Image** is a portable package containing all content, binaries, and configuration data that define a container instance
* **Container** is an operating system level construct that allows for the running of isolated software systems within a single OS
* **Pod** is wrapper on one or more **Container** with shared network 
* **Service** is a set of replicated **pods**.
* **Route** is a load balancing mechanism used to expose **services** externally
 
To create application you can use command.

``oc new-app hello``{{execute}}

### What happened?
Output:
```
--> Found image c01eb16 (8 minutes old) in image stream "myproject/hello" under tag "latest" for "hello"

    * This image will be deployed in deployment config "hello"
    * Port 8080/tcp will be load balanced by service "hello"
      * Other containers can access this service through the hostname "hello"
    * WARNING: Image "myproject/hello:latest" runs as the 'root' user which may not be permitted by your cluster administrator

--> Creating resources ...
    deploymentconfig "hello" created
    service "hello" created
--> Success
    Run 'oc status' to view your app.
```

OpenShift creates deploymentconfig and service
* **DeploymentConfig** is recipe what you want to run and how, in simplistic example it will default all values.
It will run one instance of your application hello using image **hello** that you build in previous step. 
DeploymentConfig makes OpenShift to create **ReplicationController**.
* **ReplicationController** ensures that a specified number of **Pod** replicas/instances are running at any one time
* **Service** represent collection of **Pods** of specific application (hello in your case).
Service can be used to communicate inside of cluster.

Go back to your Dashboard and get familiar with UI.

## Check if your pods are running

``oc get pod``{{execute}}
```
NAME            READY     STATUS      RESTARTS   AGE
hello-1-0ghfb   1/1       Running     0          19m
hello-1-build   0/1       Completed   0          28m
```
You can see different names, but you should see one Running Pod, which is your application.

## Expose application 

To make your application accessible from outside cluster you need *Route*
The simplest way you would 
``oc expose service hello``{{execute}}

```
route "hello" exposed
```

### Access from external world

Simply follow http://hello-myproject.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/etc/os-release

If you prefer to stay in terminal run command
``curl -s http://hello-myproject.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/etc/os-release``{{execute}}

### Check logs

To check logs you need to know name of your pods

``oc get pod --show-all=false``{{execute}}

`--show-all=false` will not show completed pods 

Output:
```
NAME            READY     STATUS    RESTARTS   AGE
hello-1-nk58l   1/1       Running   0          25s
```

``oc log hello-1-nk58l``

Output:
```
172.20.0.1 - - [09/Nov/2018 17:32:07] "GET /etc/os-release HTTP/1.1" 200 -
```

## Check information in Web Interface

Use interface to see details 
* [deployment config](https://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com/console/project/myproject/browse/dc/hello?tab=history), History tab shows list of replication controller, check out Configuration tab it describes your recipe 
* [replication controller](https://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com/console/project/myproject/browse/rc/hello-1?tab=details) look at Pod table that shows **Pods** under control of replication controller
* [service](https://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com/console/project/myproject/browse/services/hello?tab=details) search for Pod that are "under" this service
* [route](https://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com/console/project/myproject/browse/routes/hello) search for Service used to load balance external traffic