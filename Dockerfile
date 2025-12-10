# Use Java 17 image
FROM eclipse-temurin:17-jdk

# Create working directory
WORKDIR /app

# Copy the jar file built by Maven
COPY target/simple-springboot-0.0.1-SNAPSHOT.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "/app.jar"]

