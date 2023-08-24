FROM openjdk:17
ADD target/hello-maven-1.0.jar hello-maven-1.0.jar
ENTRYPOINT ["java", "-jar","hello-maven-1.0.jar"]
