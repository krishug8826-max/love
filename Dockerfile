# Tomcat ka official image use kar rahe hain
FROM tomcat:9.0-jdk11-openjdk-slim

# Default Tomcat apps ko hatana (optional)
RUN rm -rf /usr/local/tomcat/webapps/*

# Aapki saari JSP aur photos ko Tomcat ke ROOT folder mein daalna
COPY . /usr/local/tomcat/webapps/ROOT/

# Port 8080 open karna
EXPOSE 8080

# Tomcat start karna
CMD ["catalina.sh", "run"]
