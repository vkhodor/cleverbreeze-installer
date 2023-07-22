#! /bin/bash

# install ansible
echo "[INFO] Installing Ansible and deps"
apt-get update
apt-get install ansible -y
echo "[INFO] Turning SNMPAgg off"
ansible-playbook ./10_turn_off_snmpagg.yml
ansible-playbook ./install.yml


