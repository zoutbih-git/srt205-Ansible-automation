# Lab03 Ansible inventory management
**name:** Zakariya Outbih   
**Student ID:** 100184233  
**Date:** 01/23/2025

## Table of contents
- [Introduction](##Introduction)  
- [VM configuration details](##VM-Configuration-Details)
- [Deliverables](##Deliverables)
- [Experience and Challenges](##Experience-and-Challenges)


## Introduction

This lab involves setting up and configuring ansible inventory files and automatically downloading git on control nodes using ssh.


## VM configuration details

**VM name** zubuntu (control node)
**RAM** 4GB   
**Disk Space** 25 GB   
**CPU cores** 4  
**Network Adapter** NAT && internal

**VM name** managenode01 
**RAM** 4GB   
**Disk Space** 25 GB   
**CPU cores** 4  
**Network Adapter** NAT && internal

**VM name** managenode02 
**RAM** 4GB   
**Disk Space** 25 GB   
**CPU cores** 4  
**Network Adapter** NAT && internal

## Deliverables

### Deliverable 1
``` lsb_release -a ```

```
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 24.04.1 LTS
Release:        24.04
Codename:       noble

No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 24.04.1 LTS
Release:        24.04
Codename:       noble
```

### Deliverable 2

``` sudo systemctl status ssh ```
```
○ ssh.service - OpenBSD Secure Shell server
     Loaded: loaded (/usr/lib/systemd/system/ssh.service; enabled; preset: enab>
     Active: inactive (dead)
TriggeredBy: ● ssh.socket
       Docs: man:sshd(8)
             man:sshd_config(5)
   Main PID: 3213 (sshd)
      Tasks: 1 (limit: 4614)
     Memory: 2.2M (peak: 4.0M)
        CPU: 86ms
     CGroup: /system.slice/ssh.service
             └─3213 "sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups"

Jan 23 10:13:49 zak-Virtualbox sshd[3213]: Server listening on :: port 22.
Jan 23 10:13:49 zak-Virtualbox systemd[1]: Started ssh.service - OpenBSD Secure>
Jan 23 10:13:51 zak-Virtualbox sshd[3214]: Invalid user ubuntu from 192.168.0.1>
Jan 23 10:13:51 zak-Virtualbox sshd[3214]: Connection closed by invalid user ub>
Jan 23 10:13:51 zak-Virtualbox sshd[3221]: Invalid user ubuntu from 192.168.0.1>
Jan 23 10:13:51 zak-Virtualbox sshd[3221]: Connection closed by invalid user ub>
Jan 23 10:13:51 zak-Virtualbox sshd[3233]: Invalid user ubuntu from 192.168.0.1>
Jan 23 10:13:55 zak-Virtualbox sshd[3233]: pam_unix(sshd:auth): check pass; use>
Jan 23 10:13:55 zak-Virtualbox sshd[3233]: pam_unix(sshd:auth): authentication >
Jan 23 10:13:57 zak-Virtualbox sshd[3233]: Failed password for invalid user ubu> 
```
### Deliverable 3

``` cat static_inventory ```

```
[web_servers]
managed_node01 ansible_host=192.168.0.2 ansible_user=managenode01 ansible_ssh_private_key_file=~/.ssh/id_control_node ansible_become_password=ubuntu

[db_servers]
managed_node02 ansible_host=192.168.0.3 ansible_user=managenode02 ansible_ssh_private_key_file=~/.ssh/id_control_node ansible_become_password=ubuntu
```

### Deliverable 4

``` ansible -i static_inventory web_server -m ping ```

```
managed_node01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

### Deliverable 5
``` ./dynamic_inventory.py ```



```
{"web_servers": {"hosts": ["managed_node01"], "vars": {"ansible_host": "192.168.0.2", "ansible_user": "managenode01"}}, "db_servers": {"hosts": ["managed_node02"], "vars": {"ansible_host": "192.168.0.3", "ansible_user": "managenode02"}}}
```

### Deliverable 6

``` ansible-playbook -i static_inventory install_git.yml ```

```
y install_git.yml

PLAY [Install software on all servers] *****************************************

TASK [Gathering Facts] *********************************************************
ok: [managed_node02]
ok: [managed_node01]

TASK [Install git] *************************************************************
ok: [managed_node02]
ok: [managed_node01]

PLAY RECAP *********************************************************************
managed_node01             : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
managed_node02             : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
```

### Deliverable 7

``` git log ```

```
commit 6ca2ca549018dd883f1d89f478d41a5df89cd3b3
Author: Zakariya Outbih <zoutbih@myseneca.ca>
Date:   Thu Jan 23 12:24:47 2025 -0500

    Added lab03 files
```

### Deliverable 8

``` ansible-playbook -i static_inventory create_ansible_user.yml ```

```
PLAY [Create ansible_user on ManagedNode01] ************************************

TASK [Gathering Facts] *********************************************************
ok: [managed_node01]

TASK [Create the ansible_user] *************************************************
ok: [managed_node01]

PLAY RECAP *********************************************************************
managed_node01             : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

### Deliverable 9

``` ansible-playbook -i static_inventory change_sudo.yml ```

```
PLAY [Allow ansible_user passwordless sudo privileges] *************************

TASK [Gathering Facts] *********************************************************
ok: [managed_node01]

TASK [Update sudoers file for ansible_user] ************************************
ok: [managed_node01]

PLAY RECAP *********************************************************************
managed_node01             : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```




## Experience and Challenges

In this lab I learned how to create inventory files for ansible and how to configure managenodes remotely, namely installing git remotely.

### dificulties & solution:

in order to install git automatically from the control node I had to add the 
ansible_become_password into the inventory file. this allowed git to install automatically. Before I was getting an error message saying fatal: [managed_node02]: FAILED! => {"msg": "Missing sudo password"}. essentially due to security on ubuntu and priveleges it was preventing me from installing automatically.
