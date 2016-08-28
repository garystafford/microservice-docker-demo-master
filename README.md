# Microservice Demo Master Files

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
Build project containers in require start-up order

Uses images built directly on Docker Hub from `Dockerfile_dh` files
```bash
docker-compose -f docker-compose-dh.yml -p widget up -d elk; docker logs --follow elk
docker-compose -f docker-compose-dh.yml -p widget up -d config; docker logs --follow config
docker-compose -f docker-compose-dh.yml -p widget up -d eureka; docker logs --follow eureka
docker-compose -f docker-compose-dh.yml -p widget up -d mongodb; docker logs --follow mongodb
docker-compose -f docker-compose-dh.yml -p widget up -d widget user; docker logs --follow widget
docker logs --follow user
```

Uses images built with Spring Boot with Docker and Gradle from `Dockerfile` files
```bash
docker rm -f user widget eureka config elk mongo
docker-compose -f docker-compose.yml -p widget up -d elk; docker logs --follow elk
docker-compose -f docker-compose.yml -p widget up -d config; docker logs --follow config
docker-compose -f docker-compose.yml -p widget up -d eureka; docker logs --follow eureka
docker-compose -f docker-compose.yml -p widget up -d mongodb; docker logs --follow mongodb
docker-compose -f docker-compose.yml -p widget up -d widget user; docker logs --follow widget
docker logs --follow user
```

Pull the latest images from Docker Hub
```bash
docker pull garystafford/microservice-docker-demo-eureka-server:latest && \
docker pull garystafford/microservice-docker-demo-config-server:latest && \
docker pull garystafford/microservice-docker-demo-widget:latest && \
docker pull garystafford/microservice-docker-demo-user:latest && \
docker rmi $(docker images | grep "<none>") # clean up un-tagged images
```

#### Links
* [https://www.elastic.co/downloads/beats/filebeat](https://www.elastic.co/downloads/beats/filebeat)
* [https://hub.docker.com/r/zot24/filebeat/~/dockerfile/](https://hub.docker.com/r/zot24/filebeat/~/dockerfile/)
* [https://spring.io/guides/gs/spring-boot-docker/](https://spring.io/guides/gs/spring-boot-docker/)
* [https://docs.gradle.org/current/userguide/gradle_command_line.html](https://docs.gradle.org/current/userguide/gradle_command_line.html)
* [https://github.com/spujadas/elk-docker/blob/master/nginx-filebeat/filebeat.yml](https://github.com/spujadas/elk-docker/blob/master/nginx-filebeat/filebeat.yml)
* [http://elk-docker.readthedocs.io/](http://elk-docker.readthedocs.io/)
