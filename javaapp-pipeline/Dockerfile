FROM maven:3.9.11-eclipse-temurin-21-alpine 
WORKDIR /app
COPY ./target/java-sample-21-1.0.0.jar myapp.jar
EXPOSE 5000
CMD ["java", "-jar", "myapp.jar"]
