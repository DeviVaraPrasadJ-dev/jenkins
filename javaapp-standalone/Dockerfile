# ===============================
# 1. Build Stage
# ===============================
FROM maven:3.9.6-eclipse-temurin-21 AS builder
WORKDIR /build

COPY pom.xml .
COPY src ./src

RUN mvn -B -DskipTests clean package

# ===============================
# 2. Runtime Stage
# ===============================
FROM eclipse-temurin:21-jre
WORKDIR /app

# COPY the exact JAR file name — NO wildcards → NO kaniko issues
COPY --from=builder /build/target/java-sample-21-1.0.0.jar /app/app.jar

EXPOSE 5000

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
