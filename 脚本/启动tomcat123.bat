echo
E:
cd  E:\workspace\zd-2\zd-two-phase
call mvn clean:clean compiler:compile package  -Dmaven.test.skip=true
D:
cd D:\"Program Files (x86)"\apache-tomcat-8.5.32-windows-x64\apache-tomcat-8.5.32\bin
del/f/s/q  D:\"Program Files (x86)"\apache-tomcat-8.5.32-windows-x64\apache-tomcat-8.5.32\webapps\zd_two_phase.war
rd/s/q D:\"Program Files (x86)"\apache-tomcat-8.5.32-windows-x64\apache-tomcat-8.5.32\webapps\zd_two_phase
copy E:\workspace\zd-2\zd-two-phase\target\zd_two_phase.war  D:\"Program Files (x86)"\apache-tomcat-8.5.32-windows-x64\apache-tomcat-8.5.32\webapps /y

call startup.bat 
echo over

