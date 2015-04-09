FROM centos:centos6
MAINTAINER "Jan Garaj" <jan.garaj@gmail.com>

RUN yum -y install httpd
COPY zenoss5portproxy.conf /etc/httpd/conf.d/
COPY index.html /var/www/html/
EXPOSE 80 8080

ENTRYPOINT ["/usr/sbin/httpd"] 
CMD ["-D", "FOREGROUND", " -k", " start"]
