# Use maven:3.6.0-jdk-8-alpine as a parent image
FROM maven:3.6.0-jdk-8-alpine as build

# Set the working directory in the image to /app
WORKDIR /app

# Copy the pom.xml file to download dependencies
COPY pom.xml ./

# Download the dependencies
RUN mvn dependency:go-offline -B

# Copy your other files
COPY src ./src

# Build the project and package it as a jar
RUN mvn package

# Use openjdk:8-jdk-alpine for the final image
FROM openjdk:8-jdk-alpine

# Copy the jar file from the build stage
COPY --from=build /app/target/your-app.jar /your-app.jar

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the application when the container launches
CMD ["java", "-jar", "/your-app.jar"]
