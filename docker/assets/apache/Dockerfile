FROM centos:centos7
RUN \
   yum -y update; yum clean all; yum install -y httpd; yum clean all
RUN \
   echo 'Soy un DevOpsWoman/Man' > /var/www/html/index.html

EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
