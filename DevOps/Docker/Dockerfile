# Pull the official image of Tomcat server
FROM tomcat:latest

# Fix the permission error  
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps

# Deploy your app on Apache-Tomcat container
COPY ./*.war /usr/local/tomcat/webapps

