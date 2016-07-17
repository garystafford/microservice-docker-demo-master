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
docker-compose -f docker-compose-dev.yml -p widget up -d
docker-compose -f docker-compose-dev.yml -p widget up -d mongodb
```
