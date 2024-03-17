# Use a base image with the desired JDK version
FROM adoptopenjdk:11-jdk-hotspot

# Set the working directory inside the container
WORKDIR /app

# Copy the gradlew file and the gradle directory to the container
COPY gradlew .
COPY gradle ./gradle

# Give execute permission to gradlew
RUN chmod +x ./gradlew

# Copy the build.gradle.kts and settings.gradle.kts files to the container
COPY build.gradle.kts settings.gradle.kts ./

# Copy the source code to the container
COPY src ./src

RUN ./gradlew build

EXPOSE 8080

# Start the application when the container starts
CMD ["java", "-jar", "build/libs/food-api-all.jar"]
