## Logging in to the Cluster

First step, you need to login.

To login to the OpenShift cluster from the _Terminal_ run:

``oc login -u developer -p developer``{{execute}}

This will log you in using the credentials:

* **Username:** ``developer``
* **Password:** ``developer``

Use the same credentials to log into the web console. (see OpenShift Console tab)

## Creating your own Project

Next you need project.

A project is an isolation mechanism used to provide users ability to create resources while keeping them separate and secure from other OpenShift users.

To create a new project called ``myproject`` run the command:
``oc new-project myproject``{{execute}}

You could instead create the project from the web console. If you do this,
to change to the project from the command line run the command:

``oc project myproject``{{execute}}

## Check information in Web Interface

Please check out project in [OpenShift Console](https://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com/console/project/myproject/overview) and get yourself familiar with user interface.