#!/bin/sh


#- name: Copy csv files and csv to alae089
#!/bin/sh

while IFS= read -r hosts
do 
  scp $hosts:/tmp/*.csv /home/ansible_sre
done < /tmp/testhost.txt

echo "Completed scp"
exit 0


#get the hostname in each hostgroup
cat /etc/ansible/hosts > /tmp/hostcopy

scp alae089.ic.ing.net:/tmp/*.csv /home/ansible_sre
scp alde063.ic.ing.net:/tmp/*.csv /home/ansible_sre
mkdir -p /home/ansible_sre/compilecsv 
cd /home/ansible_sre/ && cp *.csv compilecsv/
zip compilecsv.zip compilecsv/*
scp /home/ansible_sre/compilecsv.zip alae089.ic.ing.net:/home/ansible_sre/

  hosts: agent-gen
  gather_facts: no
  tasks:
    - shell: scp alae089.ic.ing.net:/tmp/*.csv /home/ansible_sre
    - shell: scp alde063.ic.ing.net:/tmp/*.csv /home/ansible_sre
    - shell: mkdir -p /home/ansible_sre/compilecsv 
    - shell: cd /home/ansible_sre/ && cp *.csv compilecsv/
    - shell: zip compilecsv.zip compilecsv/*
    - shell: scp /home/ansible_sre/compilecsv.zip alae089.ic.ing.net:/home/ansible_sre/

[agent-gen]
localhost ansible_connection=local

[omsuat-email]
alae089.ic.ing.net

[omsdev]
alde063.ic.ing.net

[profileuat]
alat092.ic.ing.net
alae097.ic.ing.net

[omsdevuat]
alae089.ic.ing.net
alde063.ic.ing.net