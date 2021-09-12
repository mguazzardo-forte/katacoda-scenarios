echo "Lanzando Kubernetes..."
minikube start
while [ `docker ps | wc -l` -eq 1 ]
do
  sleep 1
done

echo "Kubernetes Start y corriendo"
