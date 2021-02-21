echo off
SET war_paht=E:\today_jsass_war
SET PROJECT_BASE_PATH=E:\workspace\today_three
SET TODAY_PATH=today_jsaas5.8
SET FANHAN_PATH=fanhan_jsaas.5.8
SET YILIAO_PATH=yiliao_jsaas.5.8
SET TARGET_PATH=target
SET FANHAN_WAR_NAME=fanhan.war
SET YILIAO_WAR_NAME=yiliao.war
SET TODAT_WAR_NAME=today.war
SET SVN_PATH=D:\Program Files\TortoiseSVN\bin

IF NOT EXIST %war_paht%  MD  %war_paht%

cd %SVN_PATH%    
start TortoiseProc.exe /command:update /path:"%PROJECT_BASE_PATH%\%TODAY_PATH%" /closeonend:1 
start TortoiseProc.exe /command:update /path:"%PROJECT_BASE_PATH%\%YILIAO_PATH%" /closeonend:1 
start TortoiseProc.exe /command:update /path:"%PROJECT_BASE_PATH%\%FANHAN_PATH%" /closeonend:1 
E:
cd  %PROJECT_BASE_PATH%\%TODAY_PATH%
call mvn  compile package  -Dmaven.test.skip=true
del/f/s/q  %war_paht%\%TODAT_WAR_NAME%
copy %PROJECT_BASE_PATH%\%TODAY_PATH%\%TARGET_PATH%\%TODAT_WAR_NAME% "%war_paht%" /y


cd %PROJECT_BASE_PATH%\%YILIAO_PATH%
call mvn  compile package  -Dmaven.test.skip=true
del/f/s/q  %war_paht%\%YILIAO_WAR_NAME%
copy %PROJECT_BASE_PATH%\%YILIAO_PATH%\%TARGET_PATH%\%YILIAO_WAR_NAME% "%war_paht%" /y

cd  %PROJECT_BASE_PATH%\%FANHAN_PATH%
call mvn  compile package  -Dmaven.test.skip=true
del/f/s/q  %war_paht%\%FANHAN_WAR_NAME%
copy %PROJECT_BASE_PATH%\%FANHAN_PATH%\%TARGET_PATH%\%FANHAN_WAR_NAME% "%war_paht%" /y

D:
cd "D:\Program Files\WinSCP"
WinSCP.exe /console /command "option batch continue" "option confirm off" "open sftp://root:today76!@114.115.254.131:22"  "rm  /usr/local/apache-tomcat-8.5.35/webapps/fanhan.war" "rm  /usr/local/apache-tomcat-8.5.35/webapps/today.war" "rm  /usr/local/apache-tomcat-8.5.35/webapps/yiliao.war" "option transfer binary"  "put E:\today_jsass_war\fanhan.war /usr/local/apache-tomcat-8.5.35/webapps/" "put E:\today_jsass_war\today.war /usr/local/apache-tomcat-8.5.35/webapps/" "put E:\today_jsass_war\yiliao.war /usr/local/apache-tomcat-8.5.35/webapps/" "exit" /log=log_file.txt

echo over
