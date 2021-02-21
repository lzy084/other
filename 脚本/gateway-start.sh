#stop.sh
#!/bin/bash
echo "Stopping SpringBoot Application"
pid=`ps -ef | grep idms-cloud-gateway-1.0.jar | grep -v grep | awk '{print $2}'`
if [ -n "$pid" ]
then
   kill -9 $pid
fi
file="/usr/local/webapp/idms-cloud-gateway-1.0.jar"
if [ -f "$file" ]
then
 mv /usr/local/webapp/idms-cloud-gateway-1.0.jar  /usr/local/webapp/back/idms-cloud-gateway-1.0.jar.`date +%Y%m%d%H%M%S`
fi
cp  /root/.jenkins/workspace/idms-cloud-gateway/idms-cloud/idms-cloud-gateway/target/idms-cloud-gateway-1.0.jar /usr/local/webapp/
chmod -R 777 /usr/local/webapp/idms-cloud-gateway-1.0.jar
cd /usr/local/webapp
nohup /usr/local/java/jdk1.8.0_192/bin/java -jar  idms-cloud-gateway-1.0.jar >>idms-cloud-gateway-1.0.`date +%Y%m%d%H%M%S`.log 2>&1&