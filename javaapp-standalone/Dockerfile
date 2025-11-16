# ============================
# 1) Build stage using Maven
# ============================
FROM maven:3.9.6-eclipse-temurin-21 AS builder
WORKDIR /build

# Copy source
COPY pom.xml .
COPY src ./src

# Build JAR file
RUN mvn -B -DskipTests clean package


# ============================
# 2) Runtime stage using JRE
# ============================
FROM eclipse-temurin:21-jre
WORKDIR /app

# Copy the packaged JAR from builder stage
COPY --from=builder /build/target/*.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]


