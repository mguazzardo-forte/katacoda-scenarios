mkdir /root/DockerSSH

cat << EOF > /root/DockerSSH/playbook.yml

---
 - hosts: servers
   tasks:
    - name: "instalar apache"
      yum:
        name: httpd
        state: latest
    - name: "Levantar apache"
      service:
        name: httpd
        state: started
EOF

cat << EOF > /root/DockerSSH/inventory
[servers]
servera
serverb
EOF

cat << EOF >/root/DockerSSH/start.sh
#!/bin/bash

__create_user() {
# Create a user to SSH into as.
useradd user
SSH_USERPASS=master
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin user)
echo ssh user password: $SSH_USERPASS

echo "root:master" | chpasswd

}

# Call all functions
__create_user
EOF

chmod +x /root/DockerSSH/start.sh

cat << EOF >/root/DockerSSH/Dockerfile
FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd shadow-utils; yum clean all
ADD ./start.sh /start.sh
RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

RUN chmod 755 /start.sh
# EXPOSE 22
RUN ./start.sh
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in ; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); rm -f /lib/systemd/system/multi-user.target.wants/; rm -f /etc/systemd/system/.wants/; rm -f /lib/systemd/system/local-fs.target.wants/; rm -f /lib/systemd/system/sockets.target.wants/udev; rm -f /lib/systemd/system/sockets.target.wants/initctl; rm -f /lib/systemd/system/basic.target.wants/; rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
EOF
