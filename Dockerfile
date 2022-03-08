FROM openjdk:17-alpine
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN mv ./server_files/* . && rm -rf ./server_files
RUN apk add bash
RUN apk add curl
RUN chmod +x ./start-server.sh
RUN echo "eula=true" > eula.txt
RUN wget -O serverstarter-2.2.0.jar "https://github.com/EnigmaticaModpacks/ServerStarter/releases/download/v2.2.0/serverstarter-2.2.0.jar"
RUN java -jar serverstarter-2.2.0.jar install
CMD java -jar serverstarter-2.2.0.jar