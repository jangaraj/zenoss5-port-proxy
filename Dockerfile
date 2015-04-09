# Build Docker image for Zenoss 5 Port Proxy

FROM centos:centos6
MAINTAINER "Jan Garaj" <jan.garaj@gmail.com> (www.jangaraj.com)

RUN yum -y install httpd
#COPY zenoss5portproxy.conf /etc/httpd/conf.d/
COPY index.html /var/www/html/
EXPOSE 8080

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
