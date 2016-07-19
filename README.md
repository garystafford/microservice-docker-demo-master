# microservice-docker-demo-master

#### Introduction
One of a set of Java Spring Boot services, for an upcoming post on scaling Spring Boot microservices with the latest Spring and Docker features.

#### Technologies
* Java
* Spring Boot
* Gradle
* MongoDB
* Consul
* Spring Cloud Config Server (migrating to Consul)
* Spring Cloud Netflix Eureka
* Spring Boot with Docker

#### Docker
```bash
docker rm -f user widget eureka config
docker-compose -f docker-compose-dev.yml -p widget up -d
docker-compose -f docker-compose-dev.yml -p widget up -d config; docker logs --follow config
docker-compose -f docker-compose-dev.yml -p widget up -d eureka; docker logs --follow eureka
docker-compose -f docker-compose-dev.yml -p widget up -d widget user; docker logs --follow widget
docker logs --follow widget
```
