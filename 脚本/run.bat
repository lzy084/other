echo off  
D:
cd D:\server-svn\today-bpm\bpm-oauth
call mvn clean:clean compiler:compile package spring-boot:run -Dmaven.test.skip=true
echo