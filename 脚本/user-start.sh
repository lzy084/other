#stop.sh
#!/bin/bash
echo "Stopping SpringBoot Application"
cd /root/.jenkins/workspace/idms-admin-service
svn up
mvn clean compile package
pid=`ps -ef | grep idms-admin-service | grep -v grep | awk '{print $2}'`
if [ -n "$pid" ]
then
   kill -9 $pid
fi
file="/usr/local/webapp/idms-eureka-server-1.0.jar"
if [ -f "$file" ]
then
 mv /usr/local/webapp/idms-admin-service-1.0.jar  /usr/local/webapp/back/idms-admin-service-1.0.jar.`date +%Y%m%d%H%M%S`
fi
cp  /root/.jenkins/workspace/idms-admin-service/target/idms-admin-service-1.0.jar /usr/local/webapp/
chmod -R 777 /usr/local/webapp/idms-admin-service-1.0.jar
cd /usr/local/webapp
nohup /usr/local/java/jdk1.8.0_192/bin/java -jar  idms-admin-service-1.0.jar  >>idms-admin-service-1.0.jar.`date +%Y%m%d%H%M%S`.log 2>&1&