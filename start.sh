#!/bin/bash
read -p "Enter Application Name: " appName
read -p "Enter MySQL Persistence Storage Path : " mysqlStoragePath
read -p "Enter MySQL Persistence Storage Size : " storageSize
read -p "Docker Image Name: " imageName
read -p "Docker Image Tag: " imageTag


echo "******************************************************************************************************"
echo "                                     Compiling JAVA Code"
echo "******************************************************************************************************"
mvn clean install -DskipTests=true
echo "******************************************************************************************************"
echo "                                     Copying Jar To Docker Folder"
echo "******************************************************************************************************"
cp $PWD/target/spring-boot-mysql-v3.jar $PWD/docker
echo "******************************************************************************************************"
echo "                                     Creating Docker Image"
echo "******************************************************************************************************"
docker build -t ${imageName}:${imageTag} $PWD/docker
echo "******************************************************************************************************"
echo "                                     Removing Jar From Docker Folder"
echo "******************************************************************************************************"
rm $PWD/docker/spring-boot-mysql-v3.jar
echo "******************************************************************************************************"
echo "                                     Launching Helm Chart"
echo "******************************************************************************************************"
helm install --name ${appName} $PWD/helm/springboot-example --set mysql.persistence.size=${storageSize} --set mysql.persistence.storagePath=${mysqlStoragePath} --set image.repository=${imageName} --set  image.tag=${imageTag}
echo "******************************************************************************************************"
echo "  Helm Chart Successfuly Launched Use Below URL To Access Application Once Pods are UP and  Running"
echo "******************************************************************************************************"
export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services ${appName}-springboot-example)
export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
echo http://$NODE_IP:$NODE_PORT
