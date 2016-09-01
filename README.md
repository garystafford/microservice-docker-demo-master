# Microservice Demo Master Files

#### Introduction
Master build file repository for a set of Java Spring Boot services, for an upcoming post on scaling microservices with the latest Spring and Docker features.

#### Technologies
* Java
* Spring Boot
* Gradle
* MongoDB
* Spring Cloud Config Server (migrating to Consul)
* Spring Cloud Netflix Eureka
* Spring Boot with Docker

#### Docker
Optionally, delete existing containers
```bash
docker rm -f user widget eureka config elk mongodb
```

Optionally, pre-pull the latest images from Docker Hub
```bash
docker pull mongo:latest && \
docker pull sebp/elk:latest && \
docker pull garystafford/microservice-docker-demo-eureka-server:latest && \
docker pull garystafford/microservice-docker-demo-config-server:latest && \
docker pull garystafford/microservice-docker-demo-widget:latest && \
docker pull garystafford/microservice-docker-demo-user:latest

docker rmi $(docker images | grep "<none>")
```

Build project containers in require start-up order, using images built directly on
Docker Hub from `Dockerfile_dh` files
```bash
docker-compose -f docker-compose-dh.yml -p widget up -d elk; docker logs --follow elk # ^C to exit
docker-compose -f docker-compose-dh.yml -p widget up -d config; docker logs --follow config
docker-compose -f docker-compose-dh.yml -p widget up -d eureka; docker logs --follow eureka
docker-compose -f docker-compose-dh.yml -p widget up -d mongodb; docker logs --follow mongodb
docker-compose -f docker-compose-dh.yml -p widget up -d widget user; docker logs --follow widget
docker logs --follow user
```

Alternately, use images built with Spring Boot with Docker and Gradle from `Dockerfile` files
```bash
docker-compose -f docker-compose.yml -p widget up -d elk; docker logs --follow elk # ^C to exit
docker-compose -f docker-compose.yml -p widget up -d config; docker logs --follow config
docker-compose -f docker-compose.yml -p widget up -d eureka; docker logs --follow eureka
docker-compose -f docker-compose.yml -p widget up -d mongodb; docker logs --follow mongodb
docker-compose -f docker-compose.yml -p widget up -d widget user; docker logs --follow widget
docker logs --follow user
```

#### Links
* [https://www.elastic.co/downloads/beats/filebeat](https://www.elastic.co/downloads/beats/filebeat)
* [https://hub.docker.com/r/zot24/filebeat/~/dockerfile/](https://hub.docker.com/r/zot24/filebeat/~/dockerfile/)
* [https://spring.io/guides/gs/spring-boot-docker/](https://spring.io/guides/gs/spring-boot-docker/)
* [https://docs.gradle.org/current/userguide/gradle_command_line.html](https://docs.gradle.org/current/userguide/gradle_command_line.html)
* [https://github.com/spujadas/elk-docker/blob/master/nginx-filebeat/filebeat.yml](https://github.com/spujadas/elk-docker/blob/master/nginx-filebeat/filebeat.yml)
* [http://elk-docker.readthedocs.io/](http://elk-docker.readthedocs.io/)
* [https://www.elastic.co/guide/en/beats/filebeat/1.2/filebeat-template.html](https://www.elastic.co/guide/en/beats/filebeat/1.2/filebeat-template.html)
* [https://www.elastic.co/guide/en/beats/filebeat/current/configuration-filebeat-options.html#multiline](https://www.elastic.co/guide/en/beats/filebeat/current/configuration-filebeat-options.html#multiline)
* [http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-logging.html](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-logging.html)
