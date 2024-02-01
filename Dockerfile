FROM openjdk:8

ADD target/springboot-docker-app.jar springboot-docker-app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","springboot-docker-app.jar"]
