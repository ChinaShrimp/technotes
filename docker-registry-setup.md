# Registry
```
docker pull registry:2.3
docker run -p 5000:5000 -v <HOST_DIR>:/tmp/registry-dev registry

# for example, HOST_DIR is /home/iot/docker/registry
docker run -p 5000:5000 -v /home/iot/docker/registry:/tmp/registry-dev registry > /home/iot/docker/registry/registry.log 2>&1 &
```
Modify your docker startup line/script: add "-H tcp://127.0.0.1:2375 -H unix:///var/run/docker.sock --insecure-registry <REGISTRY_HOSTNAME>:5000"
