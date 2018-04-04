FROM centos:centos7

MAINTAINER devopstenerife@gmail.com

RUN yum install -y epel-release && \
    yum install -y nginx &&\
    yum clean all

VOLUME /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]