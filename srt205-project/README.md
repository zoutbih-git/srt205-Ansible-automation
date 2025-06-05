# SRT205-Project

This project includes 4 ansible roles used to apply CIS Benchmark security hardening on multiple operating systems and to audit them. They are as follows: **audit_compliance**, **cis_amazon**, and **cis_ubuntu** **cis_windows**.

Each role automates at least 10 security configurations based on the official CIS benchmarks. The audit_compliance role audits the configurations and produces templates in the Reports folder using jinja 2

---

## Team Members & Roles

| Team Member       | Role                   | OS Focus          |
|-------------------|------------------------|-------------------|
| Zakariya Outbih | Team Lead | Reporting & Compliance Audit |
| Ahmed Kawsara | Amazon Linux 2 | Amazon Linux 2 |
| Mia Habib | Ubuntu | Ubuntu Linux |
| Zakaria Farah | Windows | Windows Server 2022 |

---

## Role Descriptions & Tasks

### `CIS_Amazon` – Amazon Linux 2

### Applies 10 tasks from the CIS Amazon Linux 2023 Benchmark:

| CIS ID   | Task Description                                 |
|----------|--------------------------------------------------|
| 1.2.2    | Ensure `gpgcheck` is globally activated          |
| 1.4.1    | Ensure ASLR is enabled                           |
| 4.2.19   | Ensure SSH `PermitEmptyPasswords` is disabled    |
| 4.2.20   | Ensure SSH root login is disabled                |
| 4.2.7    | Set SSH `ClientAliveInterval` to 300             |
| 4.2.7    | Set SSH `ClientAliveCountMax` to 0               |
| 3.3.1    | Ensure IP forwarding is disabled                 |
| 3.3.5    | Disable ICMP redirects for all interfaces        |
| 3.3.5    | Disable ICMP redirects for default interface     |
| 5.2.1.4  | Ensure `auditd` service is enabled and running   |



### `CIS_windows` – Windows server 2022

### Applies 10 CIS Windows Benchmark tasks for windows server 2022:

| CIS ID     | Task Description                                           |
|------------|------------------------------------------------------------|
| 2.3.1.2    | Disable Guest account                                      |
| 1.2.2      | Configure account lockout threshold (5 attempts)           |
| 1.2.3      | Reset account lockout counter after 15 minutes             |
| 1.1.1      | Enforce password history (24 passwords)                    |
| 1.1.2      | Set maximum password age (60 days)                         |
| 1.1.2      | Hide last logged-in username                               |
| 2.3.7.3    | Set inactivity lock (900 seconds)                          |
| 9.2.1      | Ensure private firewall is enabled                         |
| 9.2.2      | Block inbound connections by default                       |
| 2.3.1.3    | Disable Administrator account (domain controllers only)    |




###  `CIS_ubuntu` – ubuntu 22.04

### Applies 10 CIS Windows Benchmark tasks for ubuntu server

| CIS ID          | Task Description                                  |
|------------------|--------------------------------------------------|
| 1.1.2.1.3 & 1.1.2.1.4 | Ensure `/tmp` is mounted with `nosuid` and `noexec` options |
| 1.2.2.1          | Configure automatic security updates             |
| 2.2              | Configure client services (implicit via updates & auditd) |
| 2.4.1.8          | Restrict access to cron jobs via `cron.allow` and remove `cron.deny` |
| 3.1.1            | Disable IPv6 via sysctl                          |
| 4.1.3            | Ensure `ufw` is enabled and configured (default deny, allow SSH) |
| 5.1.20           | Disable root login over SSH                      |
| 5.3.3.2          | Enforce strong password policies (`pwquality.conf`) |
| 5.4.1.1          | Ensure password expiration is set (`PASS_MAX_DAYS`, `PASS_MIN_DAYS`) |
| 1.5.2            | Restrict `ptrace` access via `ptrace_scope`     |
| 6.3.2            | Ensure `auditd` is installed and enabled         |


### Repository structure

```
.
├── 170857239.pem
├── ansible.cfg
├── audit_compliance
│   ├── defaults
│   │   └── main.yml
│   ├── files
│   ├── handlers
│   │   └── main.yml
│   ├── meta
│   │   └── main.yml
│   ├── README.md
│   ├── tasks
│   │   ├── amazon_compliance
│   │   ├── main.yml
│   │   └── windows_compliance
│   ├── templates
│   │   ├── amazon_compliance.md.j2
│   │   └── windows_compliance.md.j2
│   ├── tests
│   │   ├── inventory
│   │   └── test.yml
│   └── vars
│       └── main.yml
├── cis_amazon
│   ├── defaults
│   │   └── main.yml
│   ├── files
│   ├── handlers
│   │   └── main.yml
│   ├── meta
│   │   └── main.yml
│   ├── README.md
│   ├── tasks
│   │   ├── amazon_tasks
│   │   └── main.yml
│   ├── templates
│   ├── tests
│   │   ├── inventory
│   │   └── test.yml
│   └── vars
│       └── main.yml
├── inventory
│   └── Project_inventory
├── main.yml
├── README.md
├── Reports
│   ├── amazon_compliance.md
│   └── windows_compliance.md
├── ubuntu
│   └── playbooks
│       └── roles
│           └── cis_ubuntu
│               ├── defaults
│               ├── files
│               ├── handlers
│               │   └── main.yml
│               ├── meta
│               ├── tasks
│               │   ├── auditd.yml
│               │   ├── auto_updates.yml
│               │   ├── cron_restriction.yml
│               │   ├── disable_ipv6.yml
│               │   ├── harden_tmp.yml
│               │   ├── main.yml
│               │   ├── password_complexity.yml
│               │   ├── password_expiry.yml
│               │   ├── ptrace_restriction.yml
│               │   └── ufw.yml
│               ├── templates
│               ├── tests
│               └── vars
└── Windows
    ├── roles
    │   └── cis_windows
    │       ├── defaults
    │       │   └── main.yml
    │       ├── handlers
    │       │   └── main.yml
    │       ├── meta
    │       │   └── main.yml
    │       ├── README.md
    │       ├── tasks
    │       │   └── main.yml
    │       ├── tests
    │       │   ├── inventory
    │       │   └── test.yml
    │       └── vars
    │           └── main.yml
    └── tasks
```


## 📁 Key Folders and Files

### 🔑 `170857239.pem`  
PEM key used to connect to the **Amazon Linux** instance.  
> ⚠️ *Note: Ansible Vault was not set up for this key due to time constraints.*

---

### 📂 `Reports/`  
Directory where compliance reports from **Windows** and **Amazon Linux** systems are stored.

---

### 📜 `main.yml`  
Main Ansible **playbook** that integrates all roles and orchestrates the entire configuration process.

---

### 📋 `inventory`  
Primary **inventory file** for defining:
- Target hosts  
- Connection parameters

---

### 📘 `README.md`  
The file you're reading now!  
Describes:
- Project structure  
- Setup instructions  
- Configuration overview

---

## 🧱 Roles Overview

### 📂 `audit_compliance/`  
Handles **compliance auditing** and generates reports based on CIS benchmarks.

### 📂 `cis_amazon/`  
Implements **CIS hardening** tasks specifically for **Amazon Linux**.

### 📂 `Windows/cis_windows/`  
Contains CIS benchmark configurations for **Windows** systems.

### 📂 `ubuntu/cis_ubuntu/`  
Houses CIS benchmark tasks tailored for **Ubuntu 22.04**.

---

### ⚙️ `ansible.cfg`  
Defines:
- Ansible **project structure**  
- Role paths and configuration  
- Default settings used across the Project


## Running the Playbook 🚀

Now to finally get started run this command and ensure all hosts are up!

``` ansible-playbook main.yml ```
