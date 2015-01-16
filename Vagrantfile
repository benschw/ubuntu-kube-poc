# -*- mode: ruby -*-
# # vi: set ft=ruby :

require 'fileutils'

Vagrant.require_version ">= 1.6.0"

CLOUD_CONFIG_PATH = File.join(File.dirname(__FILE__), "user-data")


Vagrant.configure("2") do |config|
  # always use Vagrants insecure key
  config.ssh.insert_key = false

  config.vm.box = "coreos-alpha"
  config.vm.box_version = ">= 308.0.1"
  config.vm.box_url = "http://alpha.release.core-os.net/amd64-usr/current/coreos_production_vagrant.json"

  # coreos ====================================================================
  config.vm.define "coreos" do |coreos|
    coreos.vm.hostname = "coreos.local"
    coreos.vm.network "private_network", ip: "172.20.20.10"


    coreos.vm.provision :shell, :path => "./install.sh"

    config.vm.synced_folder ".", "/vagrant", id: "core", :nfs => true, :mount_options => ['nolock,vers=3,udp']

    if File.exist?(CLOUD_CONFIG_PATH)
      coreos.vm.provision :file, :source => "#{CLOUD_CONFIG_PATH}", :destination => "/tmp/vagrantfile-user-data"
      coreos.vm.provision :shell, :inline => "mv /tmp/vagrantfile-user-data /var/lib/coreos-vagrant/", :privileged => true
    end

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
