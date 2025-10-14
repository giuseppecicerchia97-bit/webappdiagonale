    # Fase 1: Usiamo un'immagine Maven per compilare il nostro progetto
    FROM maven:3.8.5-openjdk-17 AS build
    WORKDIR /app
    COPY . .
    RUN mvn clean package

    # Fase 2: Usiamo un'immagine Tomcat ufficiale e pulita per eseguire l'app
    FROM tomcat:10.1-jdk17-temurin
    WORKDIR /usr/local/tomcat

    # --- MODIFICA QUESTA RIGA ---
    # Copiamo il nostro .war e lo rinominiamo in ROOT.war.
    # Questo dice a Tomcat di installarlo all'indirizzo principale.
    COPY --from=build /app/target/webappdiagonale.war ./webapps/ROOT.war

    # Modifichiamo il file di configurazione di Tomcat (server.xml) per
    # disabilitare la porta di shutdown impostandola a -1.
    RUN sed -i.bak 's/port="8005"/port="-1"/' ./conf/server.xml

    # Esponiamo la porta 8080, che è la porta standard di Tomcat
    EXPOSE 8080
    

