#stop.sh
#!/bin/bash
echo "Stopping SpringBoot Application"
cd /usr/local/workspace/dd-idms-cloud/idms-cloud/idms-cloud-gateway/
source /etc/profile
svn up
mvn clean compile package
pid=`ps -ef | grep idms-cloud-gateway-1.0.jar | grep -v grep | awk '{print $2}'`
if [ -n "$pid" ]
then
   kill -9 $pid
fi
file="/usr/local/workspace/dd-idms-cloud/idms-cloud/idms-cloud-gateway/target/idms-cloud-gateway-1.0.jar"
if [ -f "$file" ]
then
 mv /usr/local/webapp/idms-cloud-gateway-1.0.jar  /usr/local/webapp/back/idms-cloud-gateway-1.0.jar.`date +%Y%m%d%H%M%S`
fi
cp  /usr/local/workspace/dd-idms-cloud/idms-cloud/idms-cloud-gateway/target/idms-cloud-gateway-1.0.jar /usr/local/webapp/
chmod -R 777 /usr/local/webapp/idms-cloud-gateway-1.0.jar
cd /usr/local/webapp/log
>idms-cloud-gateway-1.0.log
cd /usr/local/webapp
nohup /usr/local/java/jdk1.8.0_192/bin/java -jar  idms-cloud-gateway-1.0.jar >>/usr/local/webapp/log/idms-cloud-gateway-1.0.log 2>&1&