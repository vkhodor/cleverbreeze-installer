#! /bin/bash

# install ansible
echo "[INFO] Installing Ansible and deps"
apt-get update
apt-get install ansible -y
echo "[INFO] Turning SNMPAgg off"
ansible-playbook ./10_turn_snmpagg_off.yml
ansible-playbook ./install.yml --ask-vault-pass


