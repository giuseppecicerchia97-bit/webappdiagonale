# Fase 1: Usiamo un'immagine Maven per compilare il nostro progetto
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Fase 2: Usiamo un'immagine Tomcat ufficiale e pulita per eseguire l'app
FROM tomcat:10.1-jdk17-temurin
WORKDIR /usr/local/tomcat

# Copiamo il file .war che abbiamo creato nella Fase 1
# dentro la cartella 'webapps' del server Tomcat.
COPY --from=build /app/target/webappdiagonale.war ./webapps/

# --- QUESTA È LA RIGA CORRETTA ---
# Modifichiamo il file di configurazione di Tomcat (server.xml) per
# disabilitare la porta di shutdown impostandola a -1.
RUN sed -i.bak 's/port="8005"/port="-1"/' ./conf/server.xml
# ---------------------------------

# Esponiamo la porta 8080, che è la porta standard di Tomcat
EXPOSE 8080


