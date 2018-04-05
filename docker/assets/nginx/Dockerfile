FROM centos:centos7

MAINTAINER devopstenerife@gmail.com

ENV NGINX_VERSION 1.12.2

RUN yum install -y epel-release && \
    yum install -y nginx-${NGINX_VERSION} &&\
    # forward request and error logs to docker log collector
	ln -sf /dev/stdout /var/log/nginx/access.log && \
	ln -sf /dev/stderr /var/log/nginx/error.log && \
	setcap cap_net_bind_service=+ep /usr/sbin/nginx && \
	groupadd -g 65500 httpd && \
	chgrp -R httpd /var/lib/nginx && \
	chmod -R g+rwx /var/lib/nginx && \
	chgrp -R httpd /var/log/nginx && \
	chmod -R g+rwx /var/log/nginx && \
	chgrp -R httpd /run && \
	chmod -R g+rwx /run && \
	mkdir -p /etc/pki/nginx/private/ && \
	openssl req -new -newkey rsa:2048 -days 99999 -nodes -x509 \
    -subj "/C=ES/ST=Tenerife/L=Tenerife/O=Dis/CN=www.beerdrivendevelopment.tech" \
    -keyout /etc/pki/nginx/private/server.key  -out /etc/pki/nginx/server.crt && \
    yum clean all

RUN sed "5s/nginx/root/" /etc/nginx/nginx.conf

VOLUME /usr/share/nginx/html /etc/nginx

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]