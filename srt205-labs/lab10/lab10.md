# Lab10 Templating with Jinja2
**name:** Zakariya Outbih   
**Student ID:** 100184233  
**Date:** 04/04/2025

## Table of contents
- [Introduction](##Introduction)  
- [VM configuration details](##VM-Configuration-Details)
- [Deliverables](##Deliverables)
- [Experience and Challenges](##Experience-and-Challenges)


## Introduction

This lab introduced me to creating Jinja 2 reports using ansible facts and sql data.

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
- name: Generate full system report using Jinja2
  hosts: db_servers
  gather_facts: true
  become: yes
  tasks:
    - name: Get top 5 memory-consuming processes
      shell: ps -eo pid,comm,%mem --sort=-%mem | head -n 6
      register: top_processes

    - name: Generate system report using Jinja2 template
      template:
        src: ../templates/report_template.md.j2
        dest: /tmp/system_report.md

    - name: fetch the generated template to control node
      fetch:
        src: /tmp/system_report.md
        dest: ~/repo/srt205-labs/lab10/reports/system_report.md
        flat: yes   
```

### Deliverable 2

``` cat templates/report_template.md.j2 ```

```
SRT205 Lab10 System Report Using Templates  
Student Name: Zakariya Outbih   
Report Generated: {{ ansible_date_time.date }} {{ ansible_date_time.time }}  
Generated By: Ansible Automation  

## System Information

| Key         | Value                         |
|-------------|-------------------------------|
| Hostname    | {{ ansible_hostname }}        |
| OS          | {{ ansible_distribution }} {{ ansible_distribution_version }} |
| Architecture| {{ ansible_architecture }}    |
| Uptime      | {{ ansible_uptime | default('N/A') }} |
| Processor   | {{ ansible_processor[1] | default('N/A') }} |
| Total RAM   | {{ '%.1f' % (ansible_memtotal_mb | float / 1024) }} GB |
| IP Address  | {{ ansible_default_ipv4.address }} |



## Filesystem

| Mount Point | Total Size | Used Space | Available |
|-------------|------------|------------|-----------|
{% for mount in ansible_mounts if mount.mount == '/' %}| `/` | {{ (mount.size_total / (1024**3)) | round(1) }} GB | {{ ((mount.size_total - mount.size_available) / (1024**3)) | round(1) }} GB | {{ (mount.size_available / (1024**3)) | round(1) }} GB |
{% endfor %}


## Network Interfaces

| Interface | MAC Address       | IP Address      |
|-----------|-------------------|-----------------|
{% for interface in ansible_interfaces %}
{% set interface_fact = hostvars[inventory_hostname]['ansible_' + interface] %}
{% if interface_fact is defined and interface_fact.ipv4 is defined %}
| {{ interface }} | {{ interface_fact.macaddress | default('N/A') }} | {{ interface_fact.ipv4.address }} |
{% endif %}
{% endfor %}



## Top 5 Processes by Memory Usage

| PID  | COMMAND     | %MEM |
|------|-------------|------|
{% for proc in top_processes.stdout_lines[1:6] %}
  {% set parts = proc.split() %}
| {{ parts[0] }} | {{ parts[1] }} | {{ parts[2] }} |
{% endfor %}
```
### Deliverable 3

``` ansible-playbook -i static_inventory playbooks/main.yml ```

``` 
PLAY [Generate full system report using Jinja2] ********************************

TASK [Gathering Facts] *********************************************************
[WARNING]: Platform linux on host managed_node02 is using the discovered Python
interpreter at /usr/bin/python3.12, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [managed_node02]

TASK [Get top 5 memory-consuming processes] ************************************
changed: [managed_node02]

TASK [Generate system report using Jinja2 template] ****************************
changed: [managed_node02]

TASK [fetch the generated template to control node] ****************************
changed: [managed_node02]

PLAY RECAP *********************************************************************
managed_node02             : ok=4    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
```

### Deliverable 4

``` cat reports/system_report.md  ```

``` 
SRT205 Lab10 System Report Using Templates  
Student Name: Zakariya Outbih   
Report Generated: 2025-04-04 21:21:03  
Generated By: Ansible Automation  

## System Information

| Key         | Value                         |
|-------------|-------------------------------|
| Hostname    | managenode02        |
| OS          | Ubuntu 24.04 |
| Architecture| x86_64    |
| Uptime      | N/A |
| Processor   | AuthenticAMD |
| Total RAM   | 3.8 GB |
| IP Address  | 10.0.2.15 |



## Filesystem

| Mount Point | Total Size | Used Space | Available |
|-------------|------------|------------|-----------|
| `/` | 24.4 GB | 13.3 GB | 11.1 GB |


## Network Interfaces

| Interface | MAC Address       | IP Address      |
|-----------|-------------------|-----------------|
| enp0s3 | 08:00:27:5b:7e:34 | 10.0.2.15 |
| enp0s8 | 08:00:27:27:ad:8b | 192.168.0.3 |
| lo | N/A | 127.0.0.1 |



## Top 5 Processes by Memory Usage

| PID  | COMMAND     | %MEM |
|------|-------------|------|
  | 1157 | mysqld | 10.0 |
  | 1948 | gnome-shell | 9.4 |
  | 10790 | gnome-system-mo | 6.0 |
  | 2122 | evolution-alarm | 2.7 |
  | 2040 | evolution-sourc | 2.2 |
```

### Deliverable 5

``` cat playbooks/avengers.yml ```

```
---
- name: Creating Jinja reports from MySQL database 
  hosts: db_servers
  become: yes
  tasks:
    
    - name: Query Avenger data from MySQL
      community.mysql.mysql_query:
        login_db: avengers_db
        login_user: root
        login_unix_socket: /var/run/mysqld/mysqld.sock
        query: "SELECT * FROM characters;"
      register: avenger_data

    - name: Generate system report using Jinja2 template
      template:
        src: ../templates/avenger_report.md.j2
        dest: /tmp/avengers_report.md

    - name: fetch the generated template to control node
      fetch:
        src: /tmp/avengers_report.md
        dest: ~/repo/srt205-labs/lab10/reports/avengers_report.md
        flat: yes
```


### Deliverable 6

``` cat templates/avenger_report.md.j2 ```

```
## Avengers Power Report

| Name          | Alias (UPPERCASE) | Power Level | Specialty          |
|---------------|-------------------|-------------|--------------------|
{% for avenger in avenger_data.query_result[0] %}
| {{ avenger.name }} | {{ avenger.alias | upper }} | {{ avenger.power_level }} | {{ avenger.specialty }} |
{% endfor %}
```

### Deliverable 7

``` ansible-playbook -i static_inventory playbooks/avengers.yml ```

```
PLAY [Creating Jinja reports from MySQL database] ******************************

TASK [Gathering Facts] *********************************************************
[WARNING]: Platform linux on host managed_node02 is using the discovered Python
interpreter at /usr/bin/python3.12, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [managed_node02]

TASK [Query Avenger data from MySQL] *******************************************
[WARNING]: Support of mysqlcline/MySQLdb connector is deprecated. We'll stop
testing against it in collection version 4.0.0 and remove the related code in
5.0.0. Use PyMySQL connector instead.
ok: [managed_node02]

TASK [Generate system report using Jinja2 template] ****************************
ok: [managed_node02]

TASK [fetch the generated template to control node] ****************************
ok: [managed_node02]

PLAY RECAP *********************************************************************
managed_node02             : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
```
### Deliverable 8

``` cat reports/avengers_report.md  ```

```
## Avengers Power Report

| Name          | Alias (UPPERCASE) | Power Level | Specialty          |
|---------------|-------------------|-------------|--------------------|
| Steve Rogers | CAPTAIN AMERICA | 90 | Super Soldier Serum |
| Tony Stark | IRON MAN | 95 | Genius, Engineer, Arc Reactor Suit |
| Thor Odinson | THOR | 99 | God of Thunder, Mjolnir |
| Bruce Banner | HULK | 100 | Super Strength, Radiation Resistance |
| Natasha Romanoff | BLACK WIDOW | 85 | Espionage, Martial Arts, Acrobatics |
| Clint Barton | HAWKEYE | 80 | Master Archer, Tactician |
```

## Key Learnings
1. How to create Jinja 2 reports
2. How to render markdown tables
3. How to use for loops and if statements in Jinja 2
4. How to use ansible facts to fetch system information like filesystems, network interfaces etc.

## Experience and Challenges

In this lab, I learned how to use Jinja2 templates in Ansible to generate reports. I also gained experience with advanced Jinja2 syntax like loops and filters to format the data. I lerned how to query a SQL database that I set up in my previous lab and how to format the data retrieved from the SQL database. Learning jinja 2 syntax and using the appropriate ansible facts was a steep learning curve

### difficulties & solution:

I had difficulties when trying to query the MySQL Database that I had setup from my previous lab. Syntactically everything was correct in the playbook but I kept getting this error 

```
ansible-playbook -i static_inventory playbooks/avengers.yml

PLAY [Creating Jinja reports from MySQL database] ******************************

TASK [Gathering Facts] *********************************************************
[WARNING]: Platform linux on host managed_node02 is using the discovered Python
interpreter at /usr/bin/python3.12, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [managed_node02]

TASK [Query Avenger data from MySQL] *******************************************
[WARNING]: Support of mysqlcline/MySQLdb connector is deprecated. We'll stop
testing against it in collection version 4.0.0 and remove the related code in
5.0.0. Use PyMySQL connector instead.
fatal: [managed_node02]: FAILED! => {"changed": false, "msg": "unable to connect to database, check login_user and login_password are correct or /home/managenode02/.my.cnf has the credentials. Exception message: (1698, \"Access denied for user 'root'@'localhost'\")"}

PLAY RECAP *********************************************************************
managed_node02             : ok=1    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0 
```
The error was caused by a missing become: yes statement in the playbook. based on research I found that sudo privileges are required when connecting to a unix socket, when the cause of the error.