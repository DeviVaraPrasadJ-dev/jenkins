FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy the JAR into /app directory
COPY target/*.jar /app/app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
