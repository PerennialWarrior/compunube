#!/bin/bash

sudo sudo snap install lxd
sudo gpasswd -a vagrant lxd
cat /vagrant/preseed.yaml | lxd init --preseed
sudo cp /var/snap/lxd/common/lxd/cluster.crt /vagrant/cluster.crt
sudo sed -i 's/^/    /g' /vagrant/cluster.crt

