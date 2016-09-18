# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
cd /home/vagrant
wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb

sudo apt-get update
sudo apt-get install -y elixir esl-erlang inotify-tools

mix local.hex --force
SCRIPT

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/wily64"
  config.vm.hostname = "gyro"
  config.vm.network "private_network", ip: "192.168.100.100"
  config.vm.provision "shell", inline: $script

end
