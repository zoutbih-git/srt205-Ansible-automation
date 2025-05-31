# Lab09 Deploying the avengers database using ansible roles
**name:** Zakariya Outbih   
**Student ID:** 100184233  
**Date:** 03/16/2025

## Table of contents
- [Introduction](##Introduction)  
- [VM configuration details](##VM-Configuration-Details)
- [Deliverables](##Deliverables)
- [Experience and Challenges](##Experience-and-Challenges)


## Introduction

This lab introduced me to installing and managing the mysql service using ansible. It also introduced me to roles in ansible.

## VM configuration details

**VM name** zubuntu (control node)  
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
``` cat playbooks/main.yml ```

```
--- 
- name: Deploy mysql database server
  hosts: db_servers
  become: yes
  roles:

  pre_tasks:
    - name: Update and upgrade all packages
      apt:
        update_cache: yes
        upgrade: dist

  roles:
    - mysql_role

  post_tasks:
    - name: Query the most powerful Avenger
      community.mysql.mysql_query:
        login_db: avengers_db
        query: "SELECT * FROM characters ORDER BY power_level DESC LIMIT 1;"
      register: query_result

    - name: Display the most powerful Avenger
      debug:
        var: query_result.query_result
```

### Deliverable 2

``` cat playbooks/roles/mysql_role/tasks/main.yml ```

```
---
# tasks file for playbooks/roles/mysql_role

- name: install mysql-server
  package:
    name: mysql-server #name of the package
    state: present


- name: install python3-mysqldb #needed for importing the sql database and using the community.mysql.mysql_db: module
  apt:
    name: python3-mysqldb
    state: present

- name: ensure mysql-server is running
  service:
    name: mysql #name of the service
    state: started
    enabled: yes

- name: copy the sql database
  copy:
    src: sql_init.sql
    dest: /tmp/sql_init.sql

- name: Import the sql database
  community.mysql.mysql_db:
    name: avengers_db
    login_user: root
    login_unix_socket: /var/run/mysqld/mysqld.sock #uses this socket to connect to mysql
    state: import #runs the sql_init.sql file on the server
    target: /tmp/sql_init.sql
```
### Deliverable 3

``` ansible-playbook -i static_inventory playbooks/main.yml  ```

``` 
[WARNING]: While constructing a mapping from
/home/zak/repo/srt205-labs/lab09/playbooks/main.yml, line 2, column 3, found a
duplicate dict key (roles). Using last defined value only.

PLAY [Deploy mysql database server] ***************************************************

TASK [Gathering Facts] ****************************************************************
[WARNING]: Platform linux on host managed_node02 is using the discovered Python
interpreter at /usr/bin/python3.12, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [managed_node02]

TASK [mysql_role : install mysql-server] **********************************************
ok: [managed_node02]

TASK [mysql_role : install python3-mysqldb] *******************************************
ok: [managed_node02]

TASK [mysql_role : ensure mysql-server is running] ************************************
ok: [managed_node02]

TASK [mysql_role : copy the sql database] *********************************************
ok: [managed_node02]

TASK [mysql_role : Import the sql database] *******************************************
[WARNING]: Support of mysqlcline/MySQLdb connector is deprecated. We'll stop testing
against it in collection version 4.0.0 and remove the related code in 5.0.0. Use
PyMySQL connector instead.
changed: [managed_node02]

PLAY RECAP ****************************************************************************
managed_node02             : ok=6    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

### Deliverable 4

``` pre_tasks ```

``` 
  pre_tasks:
    - name: Update and upgrade all packages
      apt:
        update_cache: yes
        upgrade: dist
```

### Deliverable 5

``` post_tasks ```

```
  post_tasks:
    - name: Query the most powerful Avenger
      community.mysql.mysql_query:
        login_db: avengers_db
        query: "SELECT * FROM characters ORDER BY power_level DESC LIMIT 1;"
      register: query_result

    - name: Display the most powerful Avenger
      debug:
        var: query_result.query_result
```


### Deliverable 6

``` ansible-playbook -i static_inventory playbooks/main.yml ```

```
[WARNING]: While constructing a mapping from
/home/zak/repo/srt205-labs/lab09/playbooks/main.yml, line 2, column 3, found a
duplicate dict key (roles). Using last defined value only.

PLAY [Deploy mysql database server] ***************************************************

TASK [Gathering Facts] ****************************************************************
[WARNING]: Platform linux on host managed_node02 is using the discovered Python
interpreter at /usr/bin/python3.12, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [managed_node02]

TASK [Update and upgrade all packages] ************************************************
ok: [managed_node02]

TASK [mysql_role : install mysql-server] **********************************************
ok: [managed_node02]

TASK [mysql_role : install python3-mysqldb] *******************************************
ok: [managed_node02]

TASK [mysql_role : ensure mysql-server is running] ************************************
ok: [managed_node02]

TASK [mysql_role : copy the sql database] *********************************************
ok: [managed_node02]

TASK [mysql_role : Import the sql database] *******************************************
[WARNING]: Support of mysqlcline/MySQLdb connector is deprecated. We'll stop testing
against it in collection version 4.0.0 and remove the related code in 5.0.0. Use
PyMySQL connector instead.
changed: [managed_node02]

TASK [Query the most powerful Avenger] ************************************************
ok: [managed_node02]

TASK [Display the most powerful Avenger] **********************************************
ok: [managed_node02] => {
    "query_result.query_result": [
        [
            {
                "alias": "Hulk",
                "id": 4,
                "name": "Bruce Banner",
                "power_level": 100,
                "specialty": "Super Strength, Radiation Resistance"
            }
        ]
    ]
}

PLAY RECAP ****************************************************************************
managed_node02             : ok=9    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
```


## Experience and Challenges

In this lab, I learned how to use roles to manage ansible nodes. I also learned how to use the ansible-galaxy command to create a role. Additionally I learned how to install the mysql package, and how to start the mysql service. I also learned how to copy a sql file into a manage node and how to import it into a sql database.

### dificulties & solution:

I had difficulties when running the ansible playbook. I got this error when trying to import the sql database file:

``` 
fatal: [managed_node02]: FAILED! => {"changed": false, "msg": "A MySQL module is required: for Python 2.7 either PyMySQL, or MySQL-python, or for Python 3.X mysqlclient or PyMySQL. Consider setting ansible_python_interpreter to use the intended Python version."} 

```


After installing python3-mysqldb the error went away, this was acheived with the following task

``` 
- name: install python3-mysqldb
  apt:
    name: python3-mysqldb
    state: present
```

I also got a syntax error when trying to import the sql database. This was caused by the last comma in the values list.

the correct syntax was without the comma

```
  (
    'Clint Barton',
    'Hawkeye',
    80,
    'Master Archer, Tactician'
  )
ON DUPLICATE KEY UPDATE 
  power_level = VALUES(power_level),
  specialty = VALUES(specialty);
```
