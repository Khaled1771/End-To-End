# Pull the official image of Tomcat server
FROM tomcat:latest

# Fix the permission error, Use CATALINA_HOME dir
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps

# Copy All tomcat's files to manage permission and users
COPY context.xml /usr/local/tomcat/webapps/host-manager/META-INF/context.xml
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

# Deploy your app on Apache-Tomcat container
COPY ./*.war /usr/local/tomcat/webapps

