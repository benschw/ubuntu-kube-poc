#!/bin/bash

# download/install kubernetes/etcd
mkdir -p /opt

wget -q https://dl.dropboxusercontent.com/u/1266213/kube-bin.tar.gz -O /opt/kube-bin.tar.gz
tar -xzf /opt/kube-bin.tar.gz -C /opt/
mv /opt/kube-bin /opt/bin

wget -q https://github.com/coreos/etcd/releases/download/v2.0.0-rc.1/etcd-v2.0.0-rc.1-linux-amd64.tar.gz -O /opt/etcd-v2.0.0-rc.1-linux-amd64.tar.gz
tar -xzf /opt/etcd-v2.0.0-rc.1-linux-amd64.tar.gz -C /opt/
mv /opt/etcd-v2.0.0-rc.1-linux-amd64/etcd /opt/bin/


# install init scripts for kubernetes/etcd
cp /vagrant/ubuntu-init/init_conf/* /etc/init/
cp /vagrant/ubuntu-init/initd_scripts/* /etc/init.d/
cp /vagrant/ubuntu-init/default_scripts/* /etc/default/

# add to path for user `vagrant`
echo PATH="/opt/bin:$PATH" >> /home/vagrant/.bashrc


# allow user `vagrant` to run docker without sudo
sudo groupadd docker
sudo gpasswd -a vagrant docker

# install docker with aufs
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sudo sh -c "echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

aptitude update
aptitude install -y git linux-image-extra-$(uname -r) aufs-tools lxc-docker


# add directories for docker volumes
mkdir -p /vagrant/logs/nginx
mkdir -p /vagrant/sites

