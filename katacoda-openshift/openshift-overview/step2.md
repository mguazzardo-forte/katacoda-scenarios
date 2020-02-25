## Create build config

OpenShift allow to build application in cluster.
You will create build that use docker to create simple server.

```
FROM centos:7
EXPOSE 8080
ENTRYPOINT ["python","-m","SimpleHTTPServer","8080"]
```
Above Dockerfile instructs docker to create new image based on centos:7.
Later it says to expose port 8080 and run simple server using python.


You can create build using command

``oc new-build --name=hello --dockerfile=$'FROM centos:7\nEXPOSE 8080\nENTRYPOINT ["python","-m","SimpleHTTPServer","8080"]'``{{execute}}

It is only one of many option to run this command, if you interested you can take a look [oc-new-build](https://www.mankier.com/1/oc-new-build)

### What happened?
After you run command you should see output like
```
--> Found Docker image 75835a6 (4 weeks old) from Docker Hub for "centos:7"

    * An image stream will be created as "centos:7" that will track the source image
    * A Docker build using a predefined Dockerfile will be created
      * The resulting image will be pushed to image stream "hello:latest"
      * Every time "centos:7" changes a new build will be triggered

--> Creating resources with label build=hello ...
    imagestream "centos" created
    imagestream "hello" created
    buildconfig "hello" created
--> Success
    Build configuration "hello" created and build triggered.
    Run 'oc logs -f bc/hello' to stream the build progress.
```

This command creates imagestreams and buildconfig.
* **ImageSteam** represents image collection, it also generate notification when image has changed, the notification could trigger an action in cluster.
* **BuildConfig** is recipe that describe how to build application into a container image.
In this case you are using Dockerfile.

## Check build logs

Let's check logs of newly created build 

``oc logs -f bc/hello``{{execute}}

Output:
```
Pulling image centos@sha256:dc29e2bcceac52af0f01300402f5e756cc8c44a310867f6b94f5f7271d4f3fec ...
Pulled 0/1 layers, 7% complete
Pulled 1/1 layers, 100% complete
Extracting
Step 1 : FROM centos@sha256:dc29e2bcceac52af0f01300402f5e756cc8c44a310867f6b94f5f7271d4f3fec
 ---> 75835a67d134
Step 2 : EXPOSE 8080
 ---> Running in 253fa42df1df
 ---> f6c341729bc1
Removing intermediate container 253fa42df1df
Step 3 : ENTRYPOINT python -m SimpleHTTPServer 8080
 ---> Running in 51b77b408075
 ---> 90c8976de2df
Removing intermediate container 51b77b408075
Step 4 : ENV "OPENSHIFT_BUILD_NAME" "hello-1" "OPENSHIFT_BUILD_NAMESPACE" "myproject"
 ---> Running in c07e9303ef5c
 ---> 1b9dcba3a3d8
Removing intermediate container c07e9303ef5c
Step 5 : LABEL "io.openshift.build.name" "hello-1" "io.openshift.build.namespace" "myproject"
 ---> Running in 3f22af2b7321
 ---> c01eb1604a5b
Removing intermediate container 3f22af2b7321
Successfully built c01eb1604a5b

Pushing image 172.30.110.129:5000/myproject/hello:latest ...
Pushed 0/1 layers, 3% complete
Pushed 1/1 layers, 100% complete
Push successful
```

Above you can see build is completed and pushed to ImageStream (calculate from name - hello)

## Check information in Web Interface

Use interface to see details of 
* [build](https://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com/console/project/myproject/browse/builds/hello/hello-1?tab=details) search for Logs
* [imagestream](https://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com/console/project/myproject/browse/images/hello) search for "latest" tag

Let's continue and run newly create image
