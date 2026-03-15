FROM tomcat:9.0-jdk11-openjdk-slim

RUN apt-get update && apt-get install -y sudo curl && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/local/tomcat/webapps/ROOT/uploads

RUN echo '<% response.sendError(403, "Access Denied"); %>' > /usr/local/tomcat/webapps/ROOT/uploads/index.jsp

COPY index.jsp /usr/local/tomcat/webapps/ROOT/index.jsp
COPY upload.jsp /usr/local/tomcat/webapps/ROOT/upload.jsp

RUN chown -R www-data:www-data /usr/local/tomcat/webapps/ROOT/

ENV JAVA_OPTS="-XX:-UseContainerSupport"
RUN echo "www-data ALL=(root) NOPASSWD: /usr/local/openjdk-11/bin/jrunscript" >> /etc/sudoers

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER root
ENTRYPOINT ["/entrypoint.sh"]