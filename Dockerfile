FROM grams/ubuntu-base

# Install tomcat 7
RUN echo manual > /etc/init/tomcat7.override
RUN apt-get update && apt-get install -y tomcat7 tomcat7-user && apt-get clean

ADD assets/tomcat_in_supervisor.sh /usr/share/tomcat7/bin/tomcat_in_supervisor.sh
ADD assets/tomcat.conf /etc/supervisor/conf.d/tomcat7.conf

EXPOSE 8080
