docker run -e "NODES=3" -d --name oc-cluster-up -it -p 9000:9000 -v /tmp/:/tmp/ -v /var/run/docker.sock:/var/run/docker.sock gustavonalle/oc-cluster-up
