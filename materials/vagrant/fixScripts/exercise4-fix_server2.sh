#!/bin/bash
#add fix to exercise4-server2 here
sudo sed -i '$ d' /etc/hosts
sudo sed -i '$a 192.168.60.10 server1' /etc/hosts
sudo sed -i '$a 192.168.60.11 server2' /etc/hosts
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo systemctl restart ssh
cat ~/.ssh/authorized_keys >> ~/.ssh/id_rsa.pub
ssh server1 cat ~/.ssh/authorized_keys >> ~/.ssh/authorized_keys
echo "yes"
