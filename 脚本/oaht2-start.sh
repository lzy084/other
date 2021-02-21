#stop.sh
#!/bin/bash
echo "Stopping SpringBoot Application"
kill -9 8888
file="/usr/local/webapp/idms-oauth2-server-1.0.2-v2.jar"
if [ -f "$file" ]
then
 mv /usr/local/webapp/idms-oauth2-server-1.0.2-v2.jar  /usr/local/webapp/back/idms-oauth2-server-1.0.2-v2.jar.`date +%Y%m%d%H%M%S`
fi
cp  /root/.jenkins/workspace/idms-oauth2-server/target/idms-oauth2-server-1.0.2-v2.jar /usr/local/webapp/
chmod -R 777 /usr/local/webapp/idms-oauth2-server-1.0.2-v2.jar
cd /usr/local/webapp
nohup /usr/local/java/jdk1.8.0_192/bin/java -jar  idms-oauth2-server-1.0.2-v2.jar >>idms-oauth2-server-1.0.2-v2.jar.`date +%Y%m%d%H%M%S`.log 2>&1&