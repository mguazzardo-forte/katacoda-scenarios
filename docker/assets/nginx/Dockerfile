FROM centos:centos7

MAINTAINER devopstenerife@gmail.com

RUN yum -y update && \
    yum clean all && \
    yum install -y nginx &&\
    yum clean all

VOLUME /usr/share/nginx/html

EXPOSE 80

CMD [ "nginx" ]