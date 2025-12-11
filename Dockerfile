# Use official maven image to build the app
FROM maven:3.8.6-eclipse-temurin-17 AS build

# Set working directory in the container
WORKDIR /app

# Copy pom.xml and download dependencies
COPY pom.xml .

# Download the dependencies (this is to cache dependencies in Docker layers)
RUN mvn dependency:go-offline

# Copy the source code
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Use OpenJDK 17 for the final image
FROM eclipse-temurin:17-jre-alpine

# Set the working directory
WORKDIR /app

# Copy the jar file from the build image
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar app.jar

# Expose port
EXPOSE 8081

# Command to run the app
ENTRYPOINT ["java", "-jar", "app.jar"]

