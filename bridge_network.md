 ## Creating a Docker Swarm Cluster and Bridge Network

[https://docs.docker.com/engine/userguide/networking/get-started-overlay/](https://docs.docker.com/engine/userguide/networking/get-started-overlay/)

```bash
docker-machine create -d virtualbox mh-keystore

eval "$(docker-machine env mh-keystore)"

docker run -d \
  -p "8500:8500" \
  -h "consul" \
  progrium/consul -server -bootstrap

docker-machine create \
  -d virtualbox \
  --swarm --swarm-master \
  --swarm-discovery="consul://$(docker-machine ip mh-keystore):8500" \
  --engine-opt="cluster-store=consul://$(docker-machine ip mh-keystore):8500" \
  --engine-opt="cluster-advertise=eth1:2376" \
  mhs-demo0

docker-machine create \
  -d virtualbox \
  --swarm \
  --swarm-discovery="consul://$(docker-machine ip mh-keystore):8500" \
  --engine-opt="cluster-store=consul://$(docker-machine ip mh-keystore):8500" \
  --engine-opt="cluster-advertise=eth1:2376" \
  mhs-demo1

docker-machine ls
eval $(docker-machine env --swarm mhs-demo0)
docker network create --driver overlay --subnet=10.0.9.0/24 my-net
eval $(docker-machine env mhs-demo0)
docker network ls
eval $(docker-machine env mhs-demo1)
docker network ls
```
