# Use Java 17 image
FROM eclipse-temurin:17-jdk

# Create working directory
WORKDIR /app

# Copy the jar file built by Maven
COPY target/*.jar app.jar
EXPOSE 8081
# Run the application
ENTRYPOINT ["java", "-jar", "/app.jar"]

