# Fase 1: Usiamo un'immagine Maven per compilare il nostro progetto
# Questo crea il file .war, proprio come facciamo in locale.
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Fase 2: Usiamo un'immagine Tomcat ufficiale e pulita per eseguire l'app
# Questa immagine contiene già un server Tomcat pronto all'uso.
FROM tomcat:10.1-jdk17-temurin
WORKDIR /usr/local/tomcat

# Copiamo il file .war che abbiamo creato nella Fase 1
# dentro la cartella 'webapps' del server Tomcat.
COPY --from=build /app/target/webappdiagonale.war ./webapps/

# Modifichiamo il file di configurazione di Tomcat (server.xml) per
# disabilitare la porta di shutdown, evitando i warning del health check.
RUN sed -i.bak 's|<Server port="8005" shutdown="SHUTDOWN">||' ./conf/server.xml

# Esponiamo la porta 8080, che è la porta standard di Tomcat
EXPOSE 8080