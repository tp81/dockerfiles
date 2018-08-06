FROM tp81/ubuntu-umn:latest

RUN apt-get update && apt-get install -y wget unzip openjdk-8-jre 

RUN wget http://www.icy.bioimageanalysis.org/downloadIcy/icy.zip && unzip -qq icy.zip

RUN echo "java -jar icy.jar" >go.sh

ENTRYPOINT ["sh","go.sh"]


