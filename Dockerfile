#stage 1 Build jar file
FROM maven:3.9.4-eclipse-temurin-17 AS builder
WORKDIR /app
copy pom.xml
copy src ./src
RUN mvn clean package -DskipTests

#stage 2 run the application 
# Use Java 17 image
FROM eclipse-temurin:17-jre-alpine

# Create working directory
WORKDIR /app

# Copy the jar file built by Maven
COPY --from =builder /app/target/*.jar app.jar
EXPOSE 8081
# Run the application
ENTRYPOINT ["java", "-jar", "/app.jar"]

