# SpingBoot-MySQL-HelmChart

This project demonstrates a simple Hello World SpringBoot MySQL application and its deployment on a kubernetes cluster with the help oh Helm chart.

The project consist of 2 charts :

1)Helm chart for Hello World application
2)Helm chart for MySQL with persistence storage

Pre-Requesites To Run The Project :

Kubernetes Client Version : v1.15.3
Kubernetes Server Version : v1.15.12
Helm Chart Client Version : v2.14.3
Helm Chart Server Version : v2.14.3
Docker Version : 19.03.5
openjdk version "1.8.0_272"
OpenJDK Runtime Environment (build 1.8.0_272-8u272-b10-0ubuntu1~16.04-b10)
OpenJDK 64-Bit Server VM (build 25.272-b10, mixed mode)
Apache Maven 3.3.9

Steps To Run The Project :

To compile the java application, create docker image and deploy the application in kubernetes cluster with  the help of helm chart simply run below command 

     bash start.sh
 ![Start Script](/images/start.png)
     
Enter the Inputs asked in scripts as shown in below image and wait for the application to be deployed.Once the helm chart is successfuly deployed on kubernetes cluster you will receive an URL as show in below image.


![Application Launced](/images/launched.png)
     
![Kubernetes Pod List](/images/podlist.png)


Copy the URL and and run it in your desired browser. Once URL  is opened in the browser .There will be a Hello World string stored in table name sample and database HELLO_WORLD.This string will be retrived from table and visible on browser.As shown below All the operation are persistent and are stored using MySQL, You can check the data is persisted in MySQL from command line.

![Hello World  String](/images/hellow_world.png)

![Database List](/images/Database_list.png)

![Database SQL Queires](/images/HelloWorlDB.png)

      
Steps To Uninstall The Project :

To uninstall the simply run the below command followed by aplication name given during installation this will delete the application from kubernetes cluster.
    
    bash uninstall.sh <APP_NAME>
    bash uninstall.sh springboot-helm

