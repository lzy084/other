echo off
E:
cd  E:\workspace\today_three\fanhan_jsaas.5.8
call mvn clean compile package  -Dmaven.test.skip=true
del/f/s/q  C:\Users\Liuzy\Desktop\war\fanhan.war
copy E:\workspace\today_three\fanhan_jsaas.5.8\target\fanhan.war "C:\Users\Liuzy\Desktop\war" /y

cd  E:\workspace\today_three\today_jsaas5.8
call mvn clean compile package  -Dmaven.test.skip=true
del/f/s/q  C:\Users\Liuzy\Desktop\war\today.war
copy E:\workspace\today_three\today_jsaas5.8\target\today.war "C:\Users\Liuzy\Desktop\war" /y


cd E:\workspace\today_three\yiliao_jsaas.5.8
call mvn clean compile package  -Dmaven.test.skip=true
del/f/s/q  C:\Users\Liuzy\Desktop\war\yiliao.war
copy E:\workspace\today_three\yiliao_jsaas.5.8\target\yiliao.war "C:\Users\Liuzy\Desktop\war" /y
D:
cd "D:\Program Files\WinSCP"
WinSCP.exe /console /command "option batch continue" "option confirm off" "open sftp://root:today76!@114.113.254.131:22"  "rm  /usr/local/apache-tomcat-8.5.35/webapps/fanhan.war" "rm  /usr/local/apache-tomcat-8.5.35/webapps/today.war" "rm  /usr/local/apache-tomcat-8.5.35/webapps/yiliao.war" "option transfer binary"  "put E:\today_jsass_war\fanhan.war /usr/local/apache-tomcat-8.5.35/webapps/" "put E:\today_jsass_war\today.war /usr/local/apache-tomcat-8.5.35/webapps/" "put E:\today_jsass_war\yiliao.war /usr/local/apache-tomcat-8.5.35/webapps/" "exit" /log=log_file.txt
echo over
