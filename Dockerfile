# Étape 1 : construire l'application avec Maven
FROM maven:3.8.6-openjdk-17 AS build

WORKDIR /app

# Copier les fichiers nécessaires
COPY pom.xml .
COPY src ./src

# Construire l'application (skip tests pour aller plus vite)
RUN mvn clean package -DskipTests

# Étape 2 : créer l'image exécutable à partir de l'artefact généré
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copier le jar compilé depuis l'étape précédente
COPY --from=build /app/target/*.jar app.jar

# Exposer le port utilisé par l'application
EXPOSE 8089

# Commande pour lancer l'application
ENTRYPOINT ["java", "-jar", "app.jar"]
