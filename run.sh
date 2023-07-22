#! /bin/bash

function usage {
  echo "$0 <%y.%m.%d>"
  echo "Example:"
  echo "         $0 23.07.21"
  exit $1
}

if [ -z "$1" ]; then
  usage 1
fi

version="$1"


# install ansible
echo "[INFO] Installing Ansible and deps"
apt-get update
apt-get install ansible -y

echo "[INFO] Install CleverView ${version}"
ansible-playbook ./install.yml --ask-vault-pass --extra-vars "version=${version}"


