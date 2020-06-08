# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # config.vm.box = "debian/buster64"
  # config.vm.box = "bstoots/xubuntu-16.04-desktop-amd64"
  config.vm.box = "ubuntu/bionic64"
  config.disksize.size = '10GB'

  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "vagrant_development"
    # vb.gui = true

    vb.memory = "1024"
    vb.customize ["modifyvm", :id, "--vram", "64"]
    vb.cpus = 1
  end

  # config.vm.synced_folder "./scripts", "/home/vagrant/scripts"

  config.vm.provision "check", type: "shell", inline: "cd /vagrant/scripts && ./check.sh"

  # config.vm.provision "variables",
  #   type: "file",
  #   source: "./scripts/_variables.sh",
  #   destination: "/home/vagrant",
  #   run: "always"

  # config.vm.provision "file" do |s|
  #   s.source = "./scripts/_variables.sh"
  #   s.destination = "/home/vagrant"
  # end

  # scripts = Dir.entries("./scripts").select {|f| !File.directory? f}
  # scripts.each do | script |
  #   name = script.gsub(".sh","")
  #   config.vm.provision "#{name}",
  #     type: "shell",
  #     path: "./scripts/#{script}",
  #     run: "never"
  # end

  # jake_tasks.each do | name, script |
  #   config.vm.provision "#{name}", type: "shell", inline: "cd /vagrant && #{script[:exec]} USER=vagrant"
  # end
  # config.vm.provision "nodejs", type: "shell", path: "./scripts/install__nodejs.sh"
  # config.vm.provision "applications", type: "shell", inline: "cd /vagrant && jake install:applications"

  # tasks.each do | name, script |
  #   config.vm.provision "#{name}",
  #     type: "shell",
  #     path: "#{script[:exec]}",
  #     run: "never"
  # end

end
