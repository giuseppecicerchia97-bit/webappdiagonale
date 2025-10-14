# Fase 1: Usiamo un'immagine Maven per compilare il nostro progetto
# Questo crea il file .war, proprio come facciamo in locale.
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Fase 2: Usiamo un'immagine Tomcat ufficiale e pulita per eseguire l'app
# Questa immagine contiene già un server Tomcat pronto all'uso.
FROM tomcat:10.1-jdk17-temurin
WORKDIR /usr/local/tomcat/webapps

# Rimuoviamo le app di default di Tomcat per avere un server pulito
RUN rm -rf ./*

# Copiamo il file .war che abbiamo creato nella Fase 1
# dentro la cartella 'webapps' del server Tomcat.
# Tomcat lo installerà e avvierà automaticamente.
COPY --from=build /app/target/webappdiagonale.war .

# Esponiamo la porta 8080, che è la porta standard di Tomcat
EXPOSE 8080
