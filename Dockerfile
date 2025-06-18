# Étape 1 : construire l'application avec Maven + JDK 17
FROM maven:3.8.5-openjdk-17 AS build


WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# Étape 2 : image runtime JDK 17
FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8089

ENTRYPOINT ["java", "-jar", "app.jar"]
