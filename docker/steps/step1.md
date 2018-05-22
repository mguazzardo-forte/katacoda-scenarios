Para este curso vamos a utilizar una máquina **Ubuntu**, distribución que suele utilizarse para crear entornos de producción y que cuenta con mucha documentación sobre cómo solucionar todo tipo de problemas.

Instalamos Git para empezar a jugar, ejecutando ``apt update && apt install -y git``{{execute HOST1}} (esto puede tardar un poco)

Lo primero que haremos es clonar los ficheros de los ejemplos que iremos recorriendo en este escenario: lo haremos ejecutanto ``git clone https://github.com/devopstf/training-setup.git``{{execute HOST1}}

En este escenario introductorio, repasaremos los conceptos básicos de _Docker_ y recorreremos los ejemplos del repositorio que acabamos de clonar y que se encuentran en el directorio ``cd /home/scrapbook/tutorial/training-setup/training-samples/ && ll``{{execute}}

# Arquitectura Docker.

La arquitectura docker se compone de los siguientes componentes:

![Arquitectura Docker](https://docs.docker.com/engine/images/architecture.svg)

- **Docker Daemon (dockerd)**: Escucha por la Docker API las peticiones y controla los objetos típicos de docker: imágenes, contenedores, redes y volúmenes. Además, puede comunicarse con otros dockerd para dirigir servicios docker.
- **Docker Client**: Interacción de los usuarios con docker a través de comandos: build, run, stop, etc. Puede comunicarse con más de un dockerd.
- **Docker Registry**: Donde se almacenan las imágenes docker. Púlico: Docker Hub, Privado: Nexus3, Gitlab,etc.
- **Docker Objects**: Incluye la creación y uso de imágenes, redes, contenedores, volúmenes y plugins.

# Objetos de Docker

**Imagen**: 
- Fichero binario que contiene todo el sistema de ficheros de un contenedor
- Estructurado en capas (layers) por delta. 
- Para su construcción se genera un fichero (Dockerfile)
- Se ejecuta la instrucción docker build Dockerfile
- Cuando se genera un cambio en el Dockerfle y un rebuild de la imagen, solo las nuevas capas que han cambiado son construidas (Ligeras, Pequeñas y Rápidas)

**Contenedor**:
- Fichero de texto que contiene todos los comandos que se ejecutarían manualmente con el fin de construir una imagen Docker.
- Docker puede construir imágenes automáticamente leyendo las instrucciones desde un Dockerfile. 

# Primeros pasos: "Hola Mundo", imágenes y contenedores
- Ejecutamos ``docker container run hello-world``{{execute}}
- Para listar las imágenes disponibles en el repositorio de docker local se utiliza el comando ``docker images``{{execute}}. Como no se ha generado ni descargado ninguna debe aparecer vacío. En este ejemplo, se está utilizando una imagen ya construida donde ya se han descargado imágenes previamente (redis,ubuntu,alpine).
- Para listar los contenedores ejecución se debe ejecutar ``docker ps``{{execute}}. Si deseamos listar todos los contenedores tantos en ejecución como parados ``docker ps -a``{{execute}}. Del mismo modo, al no tener ninguna imagen para desplegar debe aparcer vacío.
