FROM centos:centos7

MAINTAINER devopstenerife@gmail.com

RUN yum -y update && \
    yum clean all && \
    yum install -y httpd &&\
    yum clean all

VOLUME /var/www/html

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]