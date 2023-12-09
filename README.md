# cleverbreeze-installer

1. Install Git.
```
apt-get update
apt-get install git
```

2. Clone installer repo.
```
git clone https://github.com/vkhodor/cleverbreeze-installer.git
```

4. Prepare OS (if it is the first time installation)
```
apt-get update
apt-get install ansible -y
ansible-playbook ./prepare_os.yml
```

3. Run installer
```
cd ./cleverbreeze-installer
./run.sh 23.07.23
```
When script ask password - type password and press "Enter".

4. Run data migration script if needs.
```
./migrate-from-snmpagg.sh /root/snmpagg/webgui /root/cleverbreeze/cleverbreeze-ui
```
