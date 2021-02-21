#stop.sh
#!/bin/bash
echo "Stopping SpringBoot Application"
kill -9 8001
file="/usr/local/webapp/idms-eureka-server-1.0.jar"
if [ -f "$file" ]
then
 mv /usr/local/webapp/idms-eureka-server-1.0.jar  /usr/local/webapp/back/idms-eureka-server-1.0.jar.`date +%Y%m%d%H%M%S`
fi
cp  /root/.jenkins/workspace/idms-eureka-service/target/idms-eureka-server-1.0.jar /usr/local/webapp/
chmod -R 777 /usr/local/webapp/idms-eureka-server-1.0.jar
cd /usr/local/webapp
nohup /usr/local/java/jdk1.8.0_192/bin/java -jar  idms-eureka-server-1.0.jar --spring.profiles.active=one >>idms-eureka-server-1.0.jar.`date +%Y%m%d%H%M%S`.log 2>&1&