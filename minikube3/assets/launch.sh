echo "Lanzando Kubernetes..."
minikube start
while [ `docker ps | wc -l` -eq 1 ]
do
  sleep 1
done
wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens && chmod +x kubens && mv kubens /usr/local/bin/

echo "Kubernetes Start y corriendo"
