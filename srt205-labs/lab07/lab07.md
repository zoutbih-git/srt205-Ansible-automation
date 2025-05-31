# Lab07 Advanced Ansible Playbook features
**name:** Zakariya Outbih   
**Student ID:** 100184233  
**Date:** 03/10/2025

## Table of contents
- [Introduction](##Introduction)  
- [VM configuration details](##VM-Configuration-Details)
- [Deliverables](##Deliverables)
- [Experience and Challenges](##Experience-and-Challenges)


## Introduction

This lab introduced me to various advanced ansible playbook features. In this lab I used conditional loops like when for loops and task iteration. I also learned to use handlers which are specific tasks that are executed when a specific change occurs. Additionally I also learned how to use blocks which are used for grouping multiple tasks into a single structure leading to better file structure and better management of tasks.


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


## Deliverables

### Deliverable 1
``` ansible-playbook -i static_inventory conditional_tasks.yml ```

```
 PLAY [conditional loop example] ************************************************

TASK [Gathering Facts] *********************************************************
[WARNING]: Platform linux on host managed_node01 is using the discovered Python
interpreter at /usr/bin/python3.12, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [managed_node01]

TASK [install apache2] *********************************************************
ok: [managed_node01]

TASK [Gather package facts] ****************************************************
ok: [managed_node01]

TASK [Restart NGINX service] ***************************************************
skipping: [managed_node01]

PLAY RECAP *********************************************************************
managed_node01             : ok=3    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0  
```

### Deliverable 2

``` ansible-playbook -i static_inventory loop_tasks.yml  ```

```
PLAY [looping playbook example] ************************************************

TASK [Gathering Facts] *********************************************************
[WARNING]: Platform linux on host managed_node01 is using the discovered Python
interpreter at /usr/bin/python3.12, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [managed_node01]

TASK [install multiple packages] ***********************************************
ok: [managed_node01] => (item=git)
ok: [managed_node01] => (item=curl)
ok: [managed_node01] => (item=vim)

TASK [create multiple files] ***************************************************
changed: [managed_node01] => (item=alpha)
changed: [managed_node01] => (item=beta)
changed: [managed_node01] => (item=gamma)

PLAY RECAP *********************************************************************
managed_node01             : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
### Deliverable 3

```  ansible-playbook -i static_inventory handler_tasks.yml  ```

```
PLAY [Playbook with Handlers example] ******************************************

TASK [Gathering Facts] *********************************************************
[WARNING]: Platform linux on host managed_node01 is using the discovered Python
interpreter at /usr/bin/python3.12, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [managed_node01]

TASK [Modify content of the index.html] ****************************************
ok: [managed_node01]

PLAY RECAP *********************************************************************
managed_node01             : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

### Deliverable 4

``` ansible-playbook -i static_inventory block_tasks.yml ```

``` 
PLAY [Playbook with Blocks] ****************************************************

TASK [Gathering Facts] *********************************************************
[WARNING]: Platform linux on host managed_node01 is using the discovered Python
interpreter at /usr/bin/python3.12, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [managed_node01]

TASK [Uninstall nginx] *********************************************************
changed: [managed_node01]

TASK [Install apache2] *********************************************************
ok: [managed_node01]

TASK [Replace content of /var/www/html/] ***************************************
changed: [managed_node01]

TASK [Simulate failure] ********************************************************
fatal: [managed_node01]: FAILED! => {"changed": true, "cmd": ["/bin/false"], "delta": "0:00:00.005968", "end": "2025-03-10 07:45:58.038488", "msg": "non-zero return code", "rc": 1, "start": "2025-03-10 07:45:58.032520", "stderr": "", "stderr_lines": [], "stdout": "", "stdout_lines": []}

TASK [Display debug message] ***************************************************
ok: [managed_node01] => {
    "msg": "An error occurred, executing rescue tasks!"
}

TASK [Ensure Apache is started and enabled] ************************************
ok: [managed_node01]

PLAY RECAP *********************************************************************
managed_node01             : ok=6    changed=2    unreachable=0    failed=0    skipped=0    rescued=1    ignored=0 
```



## Experience and Challenges

In this lab, I learned how to use conditional statments like wehn which only executes a specific task when the condition is met. For example when: ansible_os_family == "Debian". This will check wether or not the os running is debian and return true or false. Meaning the task will only execute wether the when: statement is true. Additionally i learned how to use loops and how to use the {{ item }} variable to iterate through the loop. I also learned about handlers and blocks in ansible. handlers are used for completing a task when a prior task has been completed which then notify's that task. blocks are used for grouping together multiple tasks and are useful for when a task fails, it can then be redirected to a rescue section to continue execution.

### dificulties & solution:

I had difficulties with the first playbook, specifically when it came to checking if the nginx service is in the ansible_facts.packages. I kept getting a run time error even though all of my syntax and logic was correct. It turns out I was missing 
``` 
- name: Gather package facts 
    package_facts:
```

This module is used to gather information about packages installed on the system and is required before you can check wether a service is installed in a system package