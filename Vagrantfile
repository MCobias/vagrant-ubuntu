# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
	config.vm.box = "ubuntu/bionic64"
	config.vm.network "forwarded_port", guest: 80, host: 8767
    config.vm.synced_folder "./html/", "/var/www/html", id: "vagrant-data",
        owner: "www-data",
        group: "www-data",
        mount_options: ["dmode=775,fmode=664"]
   config.vm.synced_folder "./data/", "/var/data", id: "vagrant-html",
           owner: "www-data",
           group: "www-data",
           mount_options: ["dmode=775,fmode=664"]
	config.vm.provider "virtualbox" do |vb|
		vb.name = "box_ubuntu"
		vb.customize ['modifyvm', :id, '--cableconnected1', 'on']
	end
	config.vm.provision :shell, path: "startup.sh"
end
