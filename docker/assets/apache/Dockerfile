FROM centos:centos7
RUN \
   yum -y update; yum clean all; yum install -y httpd; yum clean all
COPY \
   /home/scrapbook/tutorial/website/index.html /var/www/html/index.html

EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
