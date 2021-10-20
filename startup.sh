#!/bin/sh

# nohup with background process (&) is the preferred way to put background something in docker
nohup java -Dconfig.file=application.conf -jar openscoring-server-executable-2.0.4.jar --host localhost &
# wait for openscoring server to be available
sleep 5s
# the DirectoryDeployer will watch the specified directory for models and deploy them. 
java -cp openscoring-client-executable-2.0.4.jar org.openscoring.client.DirectoryDeployer --dir /openscoring/models --model-collection http://localhost:8080/openscoring/model
