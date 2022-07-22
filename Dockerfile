FROM tomcat:8
COPY Serious_Game.war /usr/local/tomcat/webapps/Serious_Game.war
ENTRYPOINT ["/bin/bash", "/usr/local/tomcat/bin/catalina.sh", "run"]
