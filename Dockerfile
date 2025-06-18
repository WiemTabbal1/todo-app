# Étape 1 : build avec Maven
FROM maven:3.8.7-eclipse-temurin-17 AS build

WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Étape 2 : exécution avec JDK
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8089
ENTRYPOINT ["java", "-jar", "app.jar"]
