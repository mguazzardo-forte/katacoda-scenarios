mkdir /root/DockerSSH
cat << EOF >/root/DockerSSH/start.sh
#!/bin/bash

__create_user() {
# Create a user to SSH into as.
useradd user
SSH_USERPASS=Espejito.76
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin user)
echo ssh user password: $SSH_USERPASS

echo "root:Espejito.76" | chpasswd

}

# Call all functions
__create_user
EOF
