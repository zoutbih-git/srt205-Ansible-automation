# Lab02 Ansible Installation
**name:** Zakariya Outbih   
**Student ID:** 100184233  
**Date:** 01/20/2025

## Table of contents
- [Introduction](##Introduction)  
- [VM configuration details](##VM-Configuration-Details)
- [Deliverables](##Deliverables)
- [Experience and Challenges](##Experience-and-Challenges)


## Introduction

This lab involves setting up and configuring ansible.


## VM configuration details

**VM name** zubuntu  
**RAM** 4GB   
**Disk Space** 25 GB   
**CPU cores** 4  
**Network Adapter** NAT && internal

**VM name** managenode01 
**RAM** 4GB   
**Disk Space** 25 GB   
**CPU cores** 4  
**Network Adapter** NAT && internal

## Deliverables

### Deliverable 1
``` ansible --version ```

```
ansible [core 2.16.3]
  config file = None
  configured module search path = ['/home/zak/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /home/zak/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.12.3 (main, Nov  6 2024, 18:32:19) [GCC 13.2.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True
```

### Deliverable 2

``` ansible-playbook -i hosts setup.yml -u zak --become --ask-become-pass```
```
BECOME password: 

PLAY [Test Ansible Playbook] ***************************************************

TASK [Gathering Facts] *********************************************************
ok: [localhost]

TASK [Install curl] ************************************************************
ok: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
```
### Deliverable 3

``` ansible -i hosts local -m ping ```

```
localhost | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

### Deliverable 4

``` curl --version ```

```
curl 8.5.0 (x86_64-pc-linux-gnu) libcurl/8.5.0 OpenSSL/3.0.13 zlib/1.3 brotli/1.1.0 zstd/1.5.5 libidn2/2.3.7 libpsl/0.21.2 (+libidn2/2.3.7) libssh/0.10.6/openssl/zlib nghttp2/1.59.0 librtmp/2.3 OpenLDAP/2.6.7
Release-Date: 2023-12-06, security patched: 8.5.0-2ubuntu10.6
Protocols: dict file ftp ftps gopher gophers http https imap imaps ldap ldaps mqtt pop3 pop3s rtmp rtsp scp sftp smb smbs smtp smtps telnet tftp
Features: alt-svc AsynchDNS brotli GSS-API HSTS HTTP2 HTTPS-proxy IDN IPv6 Kerberos Largefile libz NTLM PSL SPNEGO SSL threadsafe TLS-SRP UnixSockets zstd
```

### Deliverable 5
``` git add . ``` ``` git commit - m "lab 02" ``` ``` git push ``` ``` git log ```



```
commit 4b8492094a98915adec04113aca9d172f4224e99 (HEAD -> main, origin/main, origin/HEAD)
Author: Zakariya Outbih <zoutbih@myseneca.ca>
Date:   Sun Jan 19 17:45:55 2025 -0500

    lab 02

commit acebd3e6a4bdc671f4e24288d9d7eaeeb1970403
Author: Zakariya Outbih <zoutbih@myseneca.ca>
Date:   Wed Jan 15 19:09:12 2025 -0500

    Added lab01 files

commit 4e646cbe3f2d7024a79e35d7422edaf172db32f5
Author: Zakariya Outbih <zoutbih@myseneca.ca>
Date:   Wed Jan 15 15:13:21 2025 -0500

    Delete test.md

commit c2c4abbfd111946ce5cbc3e93edb55de761ecc0e
Author: Zakariya Outbih <zoutbih@myseneca.ca>
Date:   Wed Jan 15 15:10:13 2025 -0500
```

### Deliverable 6

``` ansible -i hosts remote -m ping ```

```
managed_node01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```




## Experience and Challenges

In this lab I learned how to configure ansible locally. I also learned how to setup and manage a control node for ansible

### dificulties & solution:

When setting up managenode01 I had to install ssh server and was still confused how it worked. It order to apropriately configure the managenode01 and control node I had to add 2 seperate adapters. One adapter was connected to NAT and the other one was connected to the internal network. that way both my ansible control node and manage node are on the same network.
