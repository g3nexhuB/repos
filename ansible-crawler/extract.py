#!/usr/bin/python
import os
import sys
import json
import csv
from subprocess import check_output


os.system('mkdir /tmp/crawler')
def response_to_dict(arg):
    response = arg
    ls = response.split('\n')
    ls = [ i.strip() for i in ls]
    d = dict(i.split(': ') for i in ls if len(i) > 0)
    return d

hostresp = check_output(["hostnamectl"])
rpm_list = check_output(["rpm", "-qa"]).split('\n')
cpuresp = check_output(["lscpu"])
memresp = check_output(["cat", "/proc/meminfo"])
optresp = check_output(["ls", "/opt"]).split('\n')
# dockerimages = check_output(["docker", "ps", "--format", "\"{{.Image}} ({{.Names}}) \""]).split("\n")
host = response_to_dict(hostresp)
host_name = host['Static hostname']
os = host['Operating System']
machine_id = host['Machine ID']

cpuinfo = response_to_dict(cpuresp)
meminfo = response_to_dict(memresp)

cpus = cpuinfo['CPU(s)']
memtotal = meminfo['MemTotal']
with open('/tmp/crawler/{}.csv'.format(host_name), 'w') as f:
    writer = csv.writer(f)

    writer.writerow(['Host Name', 'Machine Id', 'OS', "CPU", "Memory", 'Packages', 'Optional'])
    writer.writerow([host_name, machine_id, os, cpus, memtotal, rpm_list, optresp])
