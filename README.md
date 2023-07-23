# cleverbreeze-installer

1. Install Git.
```
apt-get update
apt-get install git
```

2. Clone installer repo.
```
git clone git@github.com:vkhodor/cleverbreeze-installer.git
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
