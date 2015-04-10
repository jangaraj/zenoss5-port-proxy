# Build Docker image for Zenoss 5 Port Proxy

FROM centos:centos6
MAINTAINER "Jan Garaj" <jan.garaj@gmail.com> (www.jangaraj.com)

RUN yum -y install httpd mod_ssl && rm -rf /etc/httpd/conf.d/ssl.conf && sed -i 's/^Listen 80/#Listen 80/g' /etc/httpd/conf/httpd.conf 
COPY zenoss5portproxy.conf /etc/httpd/conf.d/
EXPOSE 8080

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
