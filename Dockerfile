# Build Docker image for Zenoss 5 Port Proxy

FROM centos:centos6
MAINTAINER "Jan Garaj" <jan.garaj@gmail.com> (www.jangaraj.com)

RUN yum -y install httpd mod_ssl && rm -rf /etc/httpd/conf.d/ssl.conf && sed -i 's/^Listen 80/#Listen 80/g' /etc/httpd/conf/httpd.conf \
&& mkdir -p /etc/pki/tls/private/ && mkdir -p /etc/pki/tls/certs \ 
&& openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -keyout /etc/pki/tls/private/localhost.key -out /etc/pki/tls/certs/localhost.crt
 
COPY zenoss5portproxy.conf /etc/httpd/conf.d/
EXPOSE 8080

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
