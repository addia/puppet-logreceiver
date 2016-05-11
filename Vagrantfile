# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "landregistry/centos"
  config.vm.provision "shell", inline: <<-SCRIPT
    yum install -y git
    puppet module install puppetlabs-vcsrepo
    puppet module install puppetlabs-stdlib
    ln -s /vagrant /etc/puppet/modules/filebeat
  SCRIPT
end
