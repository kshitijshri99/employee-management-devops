# ==========================
# Stage 1 - Build the Application
# ==========================
FROM maven:3.9.9-eclipse-temurin-21 AS builder

WORKDIR /app

# Copy pom.xml first for dependency caching
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline

# Copy project source
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# ==========================
# Stage 2 - Runtime
# ==========================
FROM eclipse-temurin:21-jre

LABEL maintainer="Kshitij Shrivastava"
LABEL project="Employee Management DevOps Pipeline"
LABEL version="1.0"
LABEL description="Dockerized Spring Boot Application with Jenkins CI/CD on AWS"

WORKDIR /app

# Copy JAR from builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose application port
EXPOSE 8080

# Start the application
ENTRYPOINT ["java","-jar","app.jar"]