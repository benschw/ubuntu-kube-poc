#!/bin/bash


mkdir -p /opt/kubernetes/bin
chown -R core: /opt/kubernetes
wget -q https://github.com/kelseyhightower/kubernetes-coreos/releases/download/v0.0.2/kubernetes-coreos.tar.gz -O /opt/kubernetes/kubernetes-coreos.tar.gz
tar -xvf /opt/kubernetes/kubernetes-coreos.tar.gz -C /opt/kubernetes/bin


mkdir -p /vagrant/logs/nginx

# cd $HOME
# git clone https://github.com/kelseyhightower/kubernetes-coreos.git
# cd kubernetes-coreos
# checkout v0.0.4
# mv units/* /etc/systemd/system/

# sudo systemctl start kubernetes-apiserver
# sudo systemctl start kubernetes-controller-manager
# sudo systemctl start kubernetes-kubelet
# sudo systemctl start kubernetes-proxy