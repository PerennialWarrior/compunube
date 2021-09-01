#!/bin/bash

sudo sudo snap install lxd
sudo gpasswd -a vagrant lxd
certificado=$(</vagrant/cluster.crt)
cat <<TEST> /vagrant/Web1Backup/preseed.yaml
config: {}
networks: []
storage_pools: []
profiles: []
projects: []
cluster:
  server_name: web1backup
  enabled: true
  member_config:
  - entity: storage-pool
    name: local
    key: source
    value: ""
    description: '"source" property for storage pool "local"'
  cluster_address: 192.168.100.2:8443
  cluster_certificate: |
$certificado
  server_address: 192.168.100.5:8443
  cluster_password: "admin"
  cluster_certificate_path: ""
TEST
cat /vagrant/Web1Backup/preseed.yaml
sudo cat /vagrant/Web1Backup/preseed.yaml | lxd init --preseed