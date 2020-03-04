# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd shadow-utils sudo; yum clean all
ADD ./start.sh /start.sh
ADD ./sudoers /etc/sudoers
RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 

RUN chmod 755 /start.sh
# EXPOSE 22
RUN ./start.sh
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in ; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); rm -f /lib/systemd/system/multi-user.target.wants/; rm -f /etc/systemd/system/.wants/; rm -f /lib/systemd/system/local-fs.target.wants/; rm -f /lib/systemd/system/sockets.target.wants/udev; rm -f /lib/systemd/system/sockets.target.wants/initctl; rm -f /lib/systemd/system/basic.target.wants/; rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
