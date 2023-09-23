#!/bin/bash
sed "s/server167/server${1}/" ./script/playbook-change-ip.yml > ./script/play${1}.yml 

sed -i "s/192.168.1.168\/24/192.168.1.${1}\/24/" ./script/play${1}.yml 

ANSIBLE_COW_SELECTION=tux ansible-playbook ./script/play${1}.yml | lolcat

sleep 5
rm ./script/play${1}.yml

echo "serv${1} ansible_host=192.168.1.${1} ansible_user=koul ansible_password=ret123 ansible_become_pass=ret123" >> hosts.txt
