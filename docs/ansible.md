# 


## Core Components of Ansible

* Inventories: locate and run across multiple systems
* Modules: tools required for performing tasks
* Variable: used for configuration values and store return value of executed commands
* Facts: special type of variables to garner information from target system
* Plays and  Playbooks: The goal of play is to map a group of hosts to some well-defined roles and poplaybooks execute one or more plays. 
* Configuration Files: configure anible to react to the ways we design

### Inventories

Inventory is a "list of hosts" that Ansible Manages. Default location for managing these hosts is `/etc/anisble/hosts`. This file could be either INI format or YAML format. As complexity of inventories increases consider using YAML as it allows easily organize information and we will be consistent with playbooks.

It is possible to define groups of hosts, host / group level variables, and nested groups within inventory.  There are number of variables that may be using within the inventory to control how ansible connects to and interacts with target hosts.

#### More about location of inventory

* Default location is /etc/anisble/hosts
* Pass the location to cli: `ansible -i <filename>`
* Can be set in the `ansible.cfg` file

#### Dynamic Inventory


It is defined as executable (bash script, python script, etc). Script returns JSON containing inventory information. It is a very hand technique for cloud resources to auto-discover server groups.

#### Example of a static hosts:

##### Using the default hosts file
`vim -R /etc/ansible/hosts`

```
[webservers]
target-1 ansible_host=192.168.5.71
target-2 ansible_host=192.168.5.72

[mysql]
target-3 ansible_host=192.168.5.73

[psql]
target-4 ansible_host=192.168.5.74
```

##### Using a inventory file (INI format)

```
mkdir -p ./resources
touch ./resources/inventory
```

`vi ./resources/inventory`

```
[ansible-backup]
controller-2 ansible_host=192.168.5.61

[webservers]
target-1 ansible_host=192.168.5.71
target-2 ansible_host=192.168.5.72

[mysql]
target-3 ansible_host=192.168.5.73

[psql]
target-4 ansible_host=192.168.5.74
```

##### Using a inventory file (YAML format)

```
all:
  hosts: # ---> hosts that are not in a particular group
     monitoring.default.local
        ansible_port: 5556
        ansible_host: 192.168.5.75
  children:
     webservers:
        hosts:
           haproxy1.default.local
           haproxy2.default.local
        vars:
           http_port: 8080
     dbservers:
       hosts:
         psql.default.local
       vars:
         psql_port: 5432
        
```


#### Variables in Inventory files?

Ansible recommends that variables not be defined in inventory files. Instead store variables in a seperate file YAML files in `group_vars` or `host_vars` directories. These directores are to be located relative to inventory files.



TODO: Siddu add more examples and do it step by step

### Modules

Modules are essentially tools for particular tasks. There are lot built in modules for ansible.  You can template your configurations and use them to push them onto targets.  Modules accept parameters. Modules return JSON responses.  Modules are from command line or from a playbook. 

### Variables

Variable should always start with a alphabet can be scope to a group, host or event a playbook. Variables are used for configuration values and various parameters. Variables can also be dictionaries.

### Facts

Provide information about a target host, which provides useful information like host-name, architecture, os-version, etc. These facts are automatically discovered when a host is reached.

Example

```
ansible target-1 -m setup
```

returns

```
target-1 | SUCCESS => {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "10.0.2.15", 
            "192.168.5.71"
        ], 
        "ansible_all_ipv6_addresses": [
            "fe80::7c:6ff:fe17:a18b", 
            "fe80::a00:27ff:fe0a:a159"
        ], 
        "ansible_apparmor": {
            "status": "enabled"
        }, 
        "ansible_architecture": "x86_64", 
        "ansible_bios_date": "12/01/2006", 
        "ansible_bios_version": "VirtualBox", 
        "ansible_cmdline": {
            "BOOT_IMAGE": "/boot/vmlinuz-4.15.0-66-generic", 
            "console": "ttyS0", 
            "ro": true, 
            "root": "LABEL=cloudimg-rootfs"
        }, 
        "ansible_date_time": {
            "date": "2019-11-24", 
            "day": "24", 
            "epoch": "1574627151", 
            "hour": "20", 
            "iso8601": "2019-11-24T20:25:51Z", 
            "iso8601_basic": "20191124T202551190089", 
            "iso8601_basic_short": "20191124T202551", 
            "iso8601_micro": "2019-11-24T20:25:51.190174Z", 
            "minute": "25", ........
```

### Plays and Playbooks

A play may be use on or more modules to acheive a desired end state on a group of hosts. A playbook is a series of plays. A playbook may deploy new servers (web / database), run sql scripts or deployments to support the new application.

### Configuration Files

Configurations can be placed in several locations. Ansible will evaluate in the following order.

* Environment Variable = ANSIBLE_CONIFG
* From File: ansible.cfg (in current directory)
* From Home Folder: .ansible.cfg (in the home directory)
* From Default: /etc/ansible/ansible.cfg





## Getting Started

### Installing Ansible

1. upgrade ubuntu

```
sudo apt-get update
sudo apt-get upgrade -y
```

2. install python

```
sudo apt-get install python -y
```

3. 

```
sudo apt-get install ansible -y
```


### Quick Start: Setting up your lab with VirtualBox and Vagrant



## Ansible Configuration File


Default ansible configuration file is available at `/etc/ansible/ansible.cfg`

For instance: we can timeouts on ssh, ssh passwords, ssh users, inventory default location.  Simple change the file and next time the ansible command is executed the changes are effective.

## Ansible Ad-hoc Commands


__What is an ad-hoc command in Ansible?__

Both ad-hoc commands playbooks have same capabilities. Ad-hoc commands are effectively one-liner. These for 

(a) Operational commands: 
  (a) checking log contents, network operators, quick production checks.
  (b) Daemon control: for stop and start a specific daemon on a specific target.
  (c) Process management: evaluate CPU or Memory consumption of a process.
(b) Information commands: checking installed software, system propertices.
(c) Research: gaining familarity of modules that we will be using when engineering playbooks.

__Use-cases for ad-hoc commands__ahoc vs Playbook__

`ansible` is the command for execute a ansible command. Similar to a sigle bash command.

`ansible-playbook` is the command for running a playbook. These are effectively used for deployments, routing taks and system deployment (new nodes, et al). Similar to a bash script.

__Common modules__




