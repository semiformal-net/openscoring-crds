FROM tomcat:8.5.51-jdk8-openjdk-slim

#MAINTAINER Villu Ruusmann <villu.ruusmann@gmail.com>

COPY . /openscoring

WORKDIR /openscoring

ADD https://github.com/openscoring/openscoring/releases/download/2.0.4/openscoring-server-executable-2.0.4.jar /openscoring
ADD https://github.com/openscoring/openscoring/releases/download/2.0.4/openscoring-client-executable-2.0.4.jar /openscoring

ENTRYPOINT ./startup.sh
