#!/usr/bin/env bash
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible sshpass

ln -sf /vagrant/hosts /etc/ansible/hosts

ssh-keygen -t rsa -b 2048 -N "" -f /home/vagrant/.ssh/id_rsa
ssh-keyscan rp www1 www2 >> .ssh/known_hosts

ansible-playbook /vagrant/ssh-addkey.yml
ansible-playbook /vagrant/zero_downtime_deployment.yml

