echo off
D:
cd  D:\server-svn\today-bpm\bpm-oauth
call mvn clean compile package  -Dmaven.test.skip=true
del/f/s/q  D:\Program Files\apache-tomcat-8.5.32\bin\webapps\bpm-oauth.war
rd/s/q D:\Program Files\apache-tomcat-8.5.32\bin\webapps\bpm-oauth
copy D:\server-svn\today-bpm\bpm-oauth\target\bpm-oauth.war "D:\Program Files\apache-tomcat-8.5.32\webapps" /y
cd D:\Program Files\apache-tomcat-8.5.32\bin
call startup.bat 

echo over

