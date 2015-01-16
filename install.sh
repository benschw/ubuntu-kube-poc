#!/bin/bash


mkdir -p /opt/kubernetes
mkdir -p /opt/bin


mkdir -p /vagrant/logs/nginx



wget -q https://dl.dropboxusercontent.com/u/1266213/kubernetes-linux-amd64.tar.gz -O /opt/kubernetes-linux-amd64.tar.gz
tar -xvf /opt/kubernetes-linux-amd64.tar.gz -C /opt/

cp -r /opt/kubernetes-linux-amd64/* /opt/bin/

# wget -q https://github.com/GoogleCloudPlatform/kubernetes/releases/download/v0.8.1/kubernetes.tar.gz -O /opt/kubernetes.tar.gz
# tar -xvf /opt/kubernetes.tar.gz -C /opt

# mv /opt/kubernetes/platforms/linux/amd64/* /opt/bin/


# wget -q https://github.com/kelseyhightower/kubernetes-coreos/releases/download/v0.0.2/kubernetes-coreos.tar.gz -O /opt/kubernetes-coreos.tar.gz
# tar -xvf /opt/kubernetes-coreos.tar.gz -C /opt/bin
