# Lab11 Customizing Ansible with Configuration and Vault
**name:** Zakariya Outbih   
**Student ID:** 100184233  
**Date:** 04/05/2025

## Table of contents
[Introduction](#introduction)  
[VM configuration details](#vm-configuration-details)  
[Deliverables](#deliverables)  
[Experience and Challenges](#experience-and-challenges)


## Introduction

# Introduction

This lab introduced me to working with sensitive data in Ansible using Ansible Vault. I learned how to encrypt and decrypt files and variables securely, configure Vault password files, and integrate encrypted variables into playbooks.


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
``` cat ansible.cfg ```

```
 [defaults]
# Path to your inventory file
inventory = ./inventory/hosts

# The remote user for SSH connections (replace with your actual SSH user)
remote_user = managenode02

# Path to your SSH private key (replace with your actual SSH key)
private_key_file = ~/.ssh/id_control_node

# Vault password file (used to decrypt Vault-encrypted variables)
#vault_password_file = ./vault-pass.txt 
```

### Deliverable 2

``` cat playbooks/secrets/vault_vars.yml  ```

```
$ANSIBLE_VAULT;1.1;AES256
30313231396661383366633330666439666635386136383965386333346564343236626362386265
3839313561353138316435623136363339613933316662310a376339636264333937653030623631
34316666316266366632363966393834346135623134363365356638303132366139303732633462
3933316136386635660a343764333264356561326635646331396139353566363164346336616238
64393534666536343264623366636364633632623761393530366336333562336135623361636262
64656131313039663066383234633331393166376339316261306265373937303766376438333933
63366363376238646437323234366363643963313336626137613630373232666334643934386166
34303662353562636138383732373361323466656339633338346138393733366666316131656533
62623838313731633539646535613336373237306330336530653738333334323634663335386339
6431663933346566343664313765353562636138666136383533
```
### Deliverable 3

``` cat playbooks/secrets_test.yml  ```

``` 
---
- name: Secrets Test Playbook
  hosts: db_servers
  become: true
  
  vars_files:
    - secrets/vault_vars.yml

  tasks:

    - name: Show API Key and Access Pass (Debug)
      debug:
        msg:
          - "API Key: {{ api_key }}"  
          - "Access Password: {{ access_pass }}"  

    - name: Create secrets file from template
      template:
        src: secret_keys.config.j2
        dest: /tmp/secret_keys.config
```

### Deliverable 4

``` cat playbooks/secret_keys.config.j2 ```

``` 
# Secret Configuration File

API_KEY={{ api_key }}
ACCESS_PASS={{ access_pass }}
```

### Deliverable 5

``` ansible-playbook playbooks/secrets_test.yml --ask-vault-pass ```

```
PLAY [Secrets Test Playbook] ***************************************************

TASK [Gathering Facts] *********************************************************
[WARNING]: Platform linux on host managed_node02 is using the discovered Python
interpreter at /usr/bin/python3.12, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [managed_node02]

TASK [Show API Key and Access Pass (Debug)] ************************************
ok: [managed_node02] => {
    "msg": [
        "API Key: sk-FakeAPIKey1234567890AbCdEfGhIjKlMnOpQr",
        "Access Password: Acc3ssP@ss-2025-!Xy72RtLq8^MbZ92TpKjWfA1v"
    ]
}

TASK [Create secrets file from template] ***************************************
ok: [managed_node02]

PLAY RECAP *********************************************************************
managed_node02             : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```


### Deliverable 6

``` cat secret_keys.config ```

```
# Secret Configuration File

API_KEY=sk-FakeAPIKey1234567890AbCdEfGhIjKlMnOpQr
ACCESS_PASS=Acc3ssP@ss-2025-!Xy72RtLq8^MbZ92TpKjWfA1v
```

### Deliverable 7

``` cat ansible.cfg ```

```
[defaults]
# Path to your inventory file
inventory = ./inventory/hosts

# The remote user for SSH connections (replace with your actual SSH user)
remote_user = managenode02

# Path to your SSH private key (replace with your actual SSH key)
private_key_file = ~/.ssh/id_control_node

# Vault password file (used to decrypt Vault-encrypted variables)
vault_password_file = ./vault-pass.txt
```
### Deliverable 8

``` cat .gitignore ```

```
vault-pass.txt
```

## Key Learnings
1. How to encrypt variables and files using ansible vault and the ansible-vault encrypt /path/to/file/being/encrypted
2. How to create an ansible.cfg file for global configuration
3. How to configure Vault password management by creating a vault-pass.txt file and referencing it in ansible.cfg
4. how to use and manage Vault-encrypted variables in a playbook, including debugging and deploying them.

## Experience and Challenges

In this lab, I learned how to use ansible vault and vault encrypted variables. I learned how to encrypt files using the ansible-vault encrypt /path/to/file/being/encrypted command. I also learned how to create an ansible.cfg file for global configuration. The biggest challenge in this lab was getting the encryption/decryption process to work by properly configuring vault-pass.txt, ansible.cfg and vault_vars.yml to work together.

## difficulties & solution:

I had difficulties when running my playbook, I got an undefined variable error.

```
TASK [Show API Key and Access Pass (Debug)] ************************************
fatal: [managed_node02]: FAILED! => {"msg": "The task includes an option with an undefined variable.. 'api_key' is undefined\n\nThe error appears to be in '/home/zak/repo/srt205-labs/lab11/playbooks/secrets_test.yml': line 9, column 7, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n  tasks:\n    - name: Show API Key and Access Pass (Debug)\n      ^ here\n"}

PLAY RECAP *********************************************************************
managed_node02             : ok=1    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0  
```
This was strange at first because my vars_files were declared and my api_key was the variable name declared in the vault_vars.yml. After a bit of troubleshooting I realsised that the path to the vars_files was incorrect. It was suposed to be secrets/vault_vars.yml instead of playbooks/secrets/vault_vars.yml since the playbook was already inthe playbooks directory. 