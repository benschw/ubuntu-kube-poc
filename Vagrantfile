# -*- mode: ruby -*-
# # vi: set ft=ruby :

require 'fileutils'

Vagrant.require_version ">= 1.6.0"

CLOUD_CONFIG_PATH = File.join(File.dirname(__FILE__), "user-data")


Vagrant.configure("2") do |config|
  # always use Vagrants insecure key
  config.ssh.insert_key = false

  config.vm.box = "trusty"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # kube ====================================================================
  config.vm.define "kube" do |kube|
    kube.vm.hostname = "kube.local"
    kube.vm.network "private_network", ip: "172.20.20.10"


    kube.vm.provision :shell, :path => "./install.sh"

    config.vm.synced_folder ".", "/vagrant", id: "core", :nfs => true, :mount_options => ['nolock,vers=3,udp']

    # if File.exist?(CLOUD_CONFIG_PATH)
    #   kube.vm.provision :file, :source => "#{CLOUD_CONFIG_PATH}", :destination => "/tmp/vagrantfile-user-data"
    #   coreos.vm.provision :shell, :inline => "mv /tmp/vagrantfile-user-data /var/lib/kube-vagrant/", :privileged => true
    # end

  end

  config.vm.provider :virtualbox do |v|
    # On VirtualBox, we don't have guest additions or a functional vboxsf
    # in CoreOS, so tell Vagrant that so it can be smarter.
    v.check_guest_additions = false
    v.functional_vboxsf     = false
    v.customize ["modifyvm", :id, "--memory", "2048"]
    v.customize ["modifyvm", :id, "--cpus", "4"]
  end

  # plugin conflict
  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end

end
