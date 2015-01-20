#!/bin/bash



mkdir -p /opt
mkdir -p /vagrant/logs/nginx


wget -q https://dl.dropboxusercontent.com/u/1266213/kube-bin.tar.gz -O /opt/kube-bin.tar.gz
tar -xvf /opt/kube-bin.tar.gz -C /opt/
mv /opt/kube-bin /opt/bin


# wget -q https://github.com/GoogleCloudPlatform/kubernetes/releases/download/v0.8.1/kubernetes.tar.gz -O /opt/kubernetes.tar.gz
# tar -xvf /opt/kubernetes.tar.gz -C /opt

# mv /opt/kubernetes/platforms/linux/amd64/* /opt/bin/


# wget -q https://github.com/kelseyhightower/kubernetes-coreos/releases/download/v0.0.2/kubernetes-coreos.tar.gz -O /opt/kubernetes-coreos.tar.gz
# tar -xvf /opt/kubernetes-coreos.tar.gz -C /opt/bin
