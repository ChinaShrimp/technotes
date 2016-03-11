# Registry
Here we setup registry using version 2, instead of deprecated v1.
```
docker pull registry:2.3
docker run -p 5000:5000 -v <HOST_DIR>:/tmp/registry-dev registry

# for example, HOST_DIR is /home/iot/docker/registry
docker run -p 5000:5000 -v /home/iot/docker/registry:/tmp/registry-dev \
  registry:2.3 > /home/iot/docker/registry/registry.log 2>&1 &
```
Modify your docker startup line/script: add "-H tcp://127.0.0.1:2375 -H unix:///var/run/docker.sock --insecure-registry <REGISTRY_HOSTNAME>:5000"

# Registry Frontend
```
docker pull konradkleine/docker-registry-frontend:v2
sudo docker run \
  -d \
  -e ENV_DOCKER_REGISTRY_HOST=ENTER-YOUR-REGISTRY-HOST-HERE \
  -e ENV_DOCKER_REGISTRY_PORT=ENTER-PORT-TO-YOUR-REGISTRY-HOST-HERE \
  -p 8080:80 \
  konradkleine/docker-registry-frontend:v2

# for example frontend runs on the same machine with registry
# the registry's IP is 172.17.0.2, with port 5000
sudo docker run \
  -d \
  -e ENV_DOCKER_REGISTRY_HOST=172.17.0.2 \
  -e ENV_DOCKER_REGISTRY_PORT=5000 \
  -p 8080:80 \
  konradkleine/docker-registry-frontend:v2
```

# Pushing Images
