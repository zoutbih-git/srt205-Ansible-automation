# Lab04 Ansible Modules
**name:** Zakariya Outbih   
**Student ID:** 100184233  
**Date:** 01/28/2025

## Table of contents
- [Introduction](##Introduction)  
- [VM configuration details](##VM-Configuration-Details)
- [Deliverables](##Deliverables)
- [Experience and Challenges](##Experience-and-Challenges)


## Introduction

This lab focuses on learning how to use various ansible modules. using ad hoc commands I learned how to immediately change and configure managenodes through the help of ansible modules.


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
``` ansible -i <inventory_file_path> all -m ping ```

```
managed_node01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
managed_node02 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

### Deliverable 2

``` ansible -i static_inventory all -m command -a "uptime" ```
```
managed_node01 | CHANGED | rc=0 >>
 14:46:00 up 56 min,  2 users,  load average: 0.08, 0.05, 0.07
managed_node02 | CHANGED | rc=0 >>
 14:46:01 up 56 min,  2 users,  load average: 0.00, 0.03, 0.02
```
### Deliverable 3

``` ansible -i static_inventory all -m file -a "path=/tmp/ansible-test state=directory" ```

```
managed_node01 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "gid": 1000,
    "group": "managenode01",
    "mode": "0775",
    "owner": "managenode01",
    "path": "/tmp/ansible-test",
    "size": 4096,
    "state": "directory",
    "uid": 1000
}
managed_node02 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "gid": 1000,
    "group": "managenode02",
    "mode": "0775",
    "owner": "managenode02",
    "path": "/tmp/ansible-test",
    "size": 4096,
    "state": "directory",
    "uid": 1000
}
```

### Deliverable 4

``` ansible -i static_inventory all -m copy -a "src=/etc/hosts dest=/tmp/hosts" ```

```
managed_node01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "checksum": "18a262192dbb1e9e076128e9de613787dc37eaef",
    "dest": "/tmp/hosts",
    "gid": 1000,
    "group": "managenode01",
    "mode": "0664",
    "owner": "managenode01",
    "path": "/tmp/hosts",
    "size": 307,
    "state": "file",
    "uid": 1000
}
managed_node02 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "checksum": "18a262192dbb1e9e076128e9de613787dc37eaef",
    "dest": "/tmp/hosts",
    "gid": 1000,
    "group": "managenode02",
    "mode": "0664",
    "owner": "managenode02",
    "path": "/tmp/hosts",
    "size": 307,
    "state": "file",
    "uid": 1000
}
```

### Deliverable 5
``` ansible -i static_inventory all -m apt -a "name=tree state=present" --become ```

```
managed_node01 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "cache_update_time": 1738114441,
    "cache_updated": false,
    "changed": true,
    "stderr": "",
    "stderr_lines": [],
    "stdout": "Reading package lists...\nBuilding dependency tree...\nReading state information...\nThe following NEW packages will be installed:\n  tree\n0 upgraded, 1 newly installed, 0 to remove and 211 not upgraded.\nNeed to get 47.1 kB of archives.\nAfter this operation, 111 kB of additional disk space will be used.\nGet:1 http://archive.ubuntu.com/ubuntu noble/universe amd64 tree amd64 2.1.1-2ubuntu3 [47.1 kB]\nFetched 47.1 kB in 1s (86.0 kB/s)\nSelecting previously unselected package tree.\r\n(Reading database ... \r(Reading database ... 5%\r(Reading database ... 10%\r(Reading database ... 15%\r(Reading database ... 20%\r(Reading database ... 25%\r(Reading database ... 30%\r(Reading database ... 35%\r(Reading database ... 40%\r(Reading database ... 45%\r(Reading database ... 50%\r(Reading database ... 55%\r(Reading database ... 60%\r(Reading database ... 65%\r(Reading database ... 70%\r(Reading database ... 75%\r(Reading database ... 80%\r(Reading database ... 85%\r(Reading database ... 90%\r(Reading database ... 95%\r(Reading database ... 100%\r(Reading database ... 192161 files and directories currently installed.)\r\nPreparing to unpack .../tree_2.1.1-2ubuntu3_amd64.deb ...\r\nUnpacking tree (2.1.1-2ubuntu3) ...\r\nSetting up tree (2.1.1-2ubuntu3) ...\r\nProcessing triggers for man-db (2.12.0-4build2) ...\r\n",
    "stdout_lines": [
        "Reading package lists...",
        "Building dependency tree...",
        "Reading state information...",
        "The following NEW packages will be installed:",
        "  tree",
        "0 upgraded, 1 newly installed, 0 to remove and 211 not upgraded.",
        "Need to get 47.1 kB of archives.",
        "After this operation, 111 kB of additional disk space will be used.",
        "Get:1 http://archive.ubuntu.com/ubuntu noble/universe amd64 tree amd64 2.1.1-2ubuntu3 [47.1 kB]",
        "Fetched 47.1 kB in 1s (86.0 kB/s)",
        "Selecting previously unselected package tree.",
        "(Reading database ... ",
        "(Reading database ... 5%",
        "(Reading database ... 10%",
        "(Reading database ... 15%",
        "(Reading database ... 20%",
        "(Reading database ... 25%",
        "(Reading database ... 30%",
        "(Reading database ... 35%",
        "(Reading database ... 40%",
        "(Reading database ... 45%",
        "(Reading database ... 50%",
        "(Reading database ... 55%",
        "(Reading database ... 60%",
        "(Reading database ... 65%",
        "(Reading database ... 70%",
        "(Reading database ... 75%",
        "(Reading database ... 80%",
        "(Reading database ... 85%",
        "(Reading database ... 90%",
        "(Reading database ... 95%",
        "(Reading database ... 100%",
        "(Reading database ... 192161 files and directories currently installed.)",
        "Preparing to unpack .../tree_2.1.1-2ubuntu3_amd64.deb ...",
        "Unpacking tree (2.1.1-2ubuntu3) ...",
        "Setting up tree (2.1.1-2ubuntu3) ...",
        "Processing triggers for man-db (2.12.0-4build2) ..."
    ]
}
managed_node02 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "cache_update_time": 1738135066,
    "cache_updated": false,
    "changed": true,
    "stderr": "",
    "stderr_lines": [],
    "stdout": "Reading package lists...\nBuilding dependency tree...\nReading state information...\nThe following NEW packages will be installed:\n  tree\n0 upgraded, 1 newly installed, 0 to remove and 205 not upgraded.\nNeed to get 47.1 kB of archives.\nAfter this operation, 111 kB of additional disk space will be used.\nGet:1 http://ca.archive.ubuntu.com/ubuntu noble/universe amd64 tree amd64 2.1.1-2ubuntu3 [47.1 kB]\nFetched 47.1 kB in 1s (40.6 kB/s)\nSelecting previously unselected package tree.\r\n(Reading database ... \r(Reading database ... 5%\r(Reading database ... 10%\r(Reading database ... 15%\r(Reading database ... 20%\r(Reading database ... 25%\r(Reading database ... 30%\r(Reading database ... 35%\r(Reading database ... 40%\r(Reading database ... 45%\r(Reading database ... 50%\r(Reading database ... 55%\r(Reading database ... 60%\r(Reading database ... 65%\r(Reading database ... 70%\r(Reading database ... 75%\r(Reading database ... 80%\r(Reading database ... 85%\r(Reading database ... 90%\r(Reading database ... 95%\r(Reading database ... 100%\r(Reading database ... 192511 files and directories currently installed.)\r\nPreparing to unpack .../tree_2.1.1-2ubuntu3_amd64.deb ...\r\nUnpacking tree (2.1.1-2ubuntu3) ...\r\nSetting up tree (2.1.1-2ubuntu3) ...\r\nProcessing triggers for man-db (2.12.0-4build2) ...\r\n",
    "stdout_lines": [
        "Reading package lists...",
        "Building dependency tree...",
        "Reading state information...",
        "The following NEW packages will be installed:",
        "  tree",
        "0 upgraded, 1 newly installed, 0 to remove and 205 not upgraded.",
        "Need to get 47.1 kB of archives.",
        "After this operation, 111 kB of additional disk space will be used.",
        "Get:1 http://ca.archive.ubuntu.com/ubuntu noble/universe amd64 tree amd64 2.1.1-2ubuntu3 [47.1 kB]",
        "Fetched 47.1 kB in 1s (40.6 kB/s)",
        "Selecting previously unselected package tree.",
        "(Reading database ... ",
        "(Reading database ... 5%",
        "(Reading database ... 10%",
        "(Reading database ... 15%",
        "(Reading database ... 20%",
        "(Reading database ... 25%",
        "(Reading database ... 30%",
        "(Reading database ... 35%",
        "(Reading database ... 40%",
        "(Reading database ... 45%",
        "(Reading database ... 50%",
        "(Reading database ... 55%",
        "(Reading database ... 60%",
        "(Reading database ... 65%",
        "(Reading database ... 70%",
        "(Reading database ... 75%",
        "(Reading database ... 80%",
        "(Reading database ... 85%",
        "(Reading database ... 90%",
        "(Reading database ... 95%",
        "(Reading database ... 100%",
        "(Reading database ... 192511 files and directories currently installed.)",
        "Preparing to unpack .../tree_2.1.1-2ubuntu3_amd64.deb ...",
        "Unpacking tree (2.1.1-2ubuntu3) ...",
        "Setting up tree (2.1.1-2ubuntu3) ...",
        "Processing triggers for man-db (2.12.0-4build2) ..."
    ]
}
```

### Deliverable 6

``` ansible -i static_inventory all -m user -a "name=ansible_user state=present" --become ```

```
managed_node02 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "append": false,
    "changed": false,
    "comment": "",
    "group": 1001,
    "home": "/home/ansible_user",
    "move_home": false,
    "name": "ansible_user",
    "shell": "/bin/sh",
    "state": "present",
    "uid": 1001
}
managed_node01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "append": false,
    "changed": false,
    "comment": "",
    "group": 1001,
    "home": "/home/ansible_user",
    "move_home": false,
    "name": "ansible_user",
    "shell": "/bin/bash",
    "state": "present",
    "uid": 1001
}
```

### Deliverable 7

``` ansible -i static_inventory all -m lineinfile -a "path=/etc/hosts line='127.0.1.1 ansible-test-node'" --become ```

```
managed_node01 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "backup": "",
    "changed": true,
    "msg": "line added"
}
managed_node02 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "backup": "",
    "changed": true,
    "msg": "line added"
}
```

### Deliverable 8

``` cat ~/repo/srt205-labs/lab04/cleanup.sh ```

```
#!/bin/bash
#this script deletes the /tmp/test_file_delete.tmp file if it exists

if [ -f /tmp/test_file_delete.tmp ]; then
	rm /tmp/test_file_delete.tmp
fi
```

### Deliverable 9

``` ansible -i static_inventory all -m cron -a "name='Cleanup task' minute='*/5' job='/usr/local/bin/cleanup.sh'" ```

```
managed_node02 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "envs": [],
    "jobs": [
        "Cleanup task"
    ]
}
managed_node01 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "envs": [],
    "jobs": [
        "Cleanup task"
    ]
}
```

### Deliverable 10

``` ansible -i static_inventory managed_node01 -m service -a "name=cron state=stopped" ```

```
managed_node01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "name": "cron",
    "state": "stopped",
    "status": {
        "ActiveEnterTimestamp": "Wed 2025-01-29 13:49:58 EST",
        "ActiveEnterTimestampMonotonic": "7850726",
        "ActiveExitTimestamp": "Wed 2025-01-29 18:20:29 EST",
        "ActiveExitTimestampMonotonic": "16235580643",
        "ActiveState": "inactive",
        "After": "nss-user-lookup.target basic.target sysinit.target system.slice remote-fs.target systemd-journald.socket",
        "AllowIsolate": "no",
        "AssertResult": "yes",
        "AssertTimestamp": "Wed 2025-01-29 13:49:58 EST",
        "AssertTimestampMonotonic": "7735795",
        "Before": "shutdown.target multi-user.target",
        "BlockIOAccounting": "no",
        "BlockIOWeight": "[not set]",
        "CPUAccounting": "yes",
        "CPUAffinityFromNUMA": "no",
        "CPUQuotaPerSecUSec": "infinity",
        "CPUQuotaPeriodUSec": "infinity",
        "CPUSchedulingPolicy": "0",
        "CPUSchedulingPriority": "0",
        "CPUSchedulingResetOnFork": "no",
        "CPUShares": "[not set]",
        "CPUUsageNSec": "365945000",
        "CPUWeight": "[not set]",
        "CacheDirectoryMode": "0755",
        "CanFreeze": "yes",
        "CanIsolate": "no",
        "CanReload": "no",
        "CanStart": "yes",
        "CanStop": "yes",
        "CapabilityBoundingSet": "cap_chown cap_dac_override cap_dac_read_search cap_fowner cap_fsetid cap_kill cap_setgid cap_setuid cap_setpcap cap_linux_immutable cap_net_bind_service cap_net_broadcast cap_net_admin cap_net_raw cap_ipc_lock cap_ipc_owner cap_sys_module cap_sys_rawio cap_sys_chroot cap_sys_ptrace cap_sys_pacct cap_sys_admin cap_sys_boot cap_sys_nice cap_sys_resource cap_sys_time cap_sys_tty_config cap_mknod cap_lease cap_audit_write cap_audit_control cap_setfcap cap_mac_override cap_mac_admin cap_syslog cap_wake_alarm cap_block_suspend cap_audit_read cap_perfmon cap_bpf cap_checkpoint_restore",
        "CleanResult": "success",
        "CollectMode": "inactive",
        "ConditionResult": "yes",
        "ConditionTimestamp": "Wed 2025-01-29 13:49:58 EST",
        "ConditionTimestampMonotonic": "7735790",
        "ConfigurationDirectoryMode": "0755",
        "Conflicts": "shutdown.target",
        "ControlGroupId": "3196",
        "ControlPID": "0",
        "CoredumpFilter": "0x33",
        "CoredumpReceive": "no",
        "DefaultDependencies": "yes",
        "DefaultMemoryLow": "0",
        "DefaultMemoryMin": "0",
        "DefaultStartupMemoryLow": "0",
        "Delegate": "no",
        "Description": "Regular background program processing daemon",
        "DevicePolicy": "auto",
        "Documentation": "\"man:cron(8)\"",
        "DynamicUser": "no",
        "EnvironmentFiles": "/etc/default/cron (ignore_errors=yes)",
        "ExecMainCode": "2",
        "ExecMainExitTimestamp": "Wed 2025-01-29 18:20:29 EST",
        "ExecMainExitTimestampMonotonic": "16235581026",
        "ExecMainPID": "693",
        "ExecMainStartTimestamp": "Wed 2025-01-29 13:49:58 EST",
        "ExecMainStartTimestampMonotonic": "7850576",
        "ExecMainStatus": "15",
        "ExecStart": "{ path=/usr/sbin/cron ; argv[]=/usr/sbin/cron -f -P $EXTRA_OPTS ; ignore_errors=no ; start_time=[Wed 2025-01-29 13:49:58 EST] ; stop_time=[Wed 2025-01-29 18:20:29 EST] ; pid=693 ; code=killed ; status=15/TERM }",
        "ExecStartEx": "{ path=/usr/sbin/cron ; argv[]=/usr/sbin/cron -f -P $EXTRA_OPTS ; flags= ; start_time=[Wed 2025-01-29 13:49:58 EST] ; stop_time=[Wed 2025-01-29 18:20:29 EST] ; pid=693 ; code=killed ; status=15/TERM }",
        "ExitType": "main",
        "ExtensionImagePolicy": "root=verity+signed+encrypted+unprotected+absent:usr=verity+signed+encrypted+unprotected+absent:home=encrypted+unprotected+absent:srv=encrypted+unprotected+absent:tmp=encrypted+unprotected+absent:var=encrypted+unprotected+absent",
        "FailureAction": "none",
        "FileDescriptorStoreMax": "0",
        "FileDescriptorStorePreserve": "restart",
        "FinalKillSignal": "9",
        "FragmentPath": "/usr/lib/systemd/system/cron.service",
        "FreezerState": "running",
        "GID": "[not set]",
        "GuessMainPID": "yes",
        "IOAccounting": "no",
        "IOReadBytes": "[not set]",
        "IOReadOperations": "[not set]",
        "IOSchedulingClass": "2",
        "IOSchedulingPriority": "4",
        "IOWeight": "[not set]",
        "IOWriteBytes": "[not set]",
        "IOWriteOperations": "[not set]",
        "IPAccounting": "no",
        "IPEgressBytes": "[no data]",
        "IPEgressPackets": "[no data]",
        "IPIngressBytes": "[no data]",
        "IPIngressPackets": "[no data]",
        "Id": "cron.service",
        "IgnoreOnIsolate": "no",
        "IgnoreSIGPIPE": "no",
        "InactiveEnterTimestamp": "Wed 2025-01-29 18:20:29 EST",
        "InactiveEnterTimestampMonotonic": "16235581102",
        "InactiveExitTimestamp": "Wed 2025-01-29 13:49:58 EST",
        "InactiveExitTimestampMonotonic": "7850726",
        "InvocationID": "fcaa21b40d7d4ddf8d288609c65e06d3",
        "JobRunningTimeoutUSec": "infinity",
        "JobTimeoutAction": "none",
        "JobTimeoutUSec": "infinity",
        "KeyringMode": "private",
        "KillMode": "process",
        "KillSignal": "15",
        "LimitAS": "infinity",
        "LimitASSoft": "infinity",
        "LimitCORE": "infinity",
        "LimitCORESoft": "0",
        "LimitCPU": "infinity",
        "LimitCPUSoft": "infinity",
        "LimitDATA": "infinity",
        "LimitDATASoft": "infinity",
        "LimitFSIZE": "infinity",
        "LimitFSIZESoft": "infinity",
        "LimitLOCKS": "infinity",
        "LimitLOCKSSoft": "infinity",
        "LimitMEMLOCK": "8388608",
        "LimitMEMLOCKSoft": "8388608",
        "LimitMSGQUEUE": "819200",
        "LimitMSGQUEUESoft": "819200",
        "LimitNICE": "0",
        "LimitNICESoft": "0",
        "LimitNOFILE": "524288",
        "LimitNOFILESoft": "1024",
        "LimitNPROC": "7593",
        "LimitNPROCSoft": "7593",
        "LimitRSS": "infinity",
        "LimitRSSSoft": "infinity",
        "LimitRTPRIO": "0",
        "LimitRTPRIOSoft": "0",
        "LimitRTTIME": "infinity",
        "LimitRTTIMESoft": "infinity",
        "LimitSIGPENDING": "7593",
        "LimitSIGPENDINGSoft": "7593",
        "LimitSTACK": "infinity",
        "LimitSTACKSoft": "8388608",
        "LoadState": "loaded",
        "LockPersonality": "no",
        "LogLevelMax": "-1",
        "LogRateLimitBurst": "0",
        "LogRateLimitIntervalUSec": "0",
        "LogsDirectoryMode": "0755",
        "MainPID": "0",
        "ManagedOOMMemoryPressure": "auto",
        "ManagedOOMMemoryPressureLimit": "0",
        "ManagedOOMPreference": "none",
        "ManagedOOMSwap": "auto",
        "MemoryAccounting": "yes",
        "MemoryAvailable": "1119006720",
        "MemoryCurrent": "[not set]",
        "MemoryDenyWriteExecute": "no",
        "MemoryHigh": "infinity",
        "MemoryKSM": "no",
        "MemoryLimit": "infinity",
        "MemoryLow": "0",
        "MemoryMax": "infinity",
        "MemoryMin": "0",
        "MemoryPeak": "3473408",
        "MemoryPressureThresholdUSec": "200ms",
        "MemoryPressureWatch": "auto",
        "MemorySwapCurrent": "[not set]",
        "MemorySwapMax": "infinity",
        "MemorySwapPeak": "0",
        "MemoryZSwapCurrent": "[not set]",
        "MemoryZSwapMax": "infinity",
        "MountAPIVFS": "no",
        "MountImagePolicy": "root=verity+signed+encrypted+unprotected+absent:usr=verity+signed+encrypted+unprotected+absent:home=encrypted+unprotected+absent:srv=encrypted+unprotected+absent:tmp=encrypted+unprotected+absent:var=encrypted+unprotected+absent",
        "NFileDescriptorStore": "0",
        "NRestarts": "0",
        "NUMAPolicy": "n/a",
        "Names": "cron.service",
        "NeedDaemonReload": "yes",
        "Nice": "0",
        "NoNewPrivileges": "no",
        "NonBlocking": "no",
        "NotifyAccess": "none",
        "OOMPolicy": "stop",
        "OOMScoreAdjust": "0",
        "OnFailureJobMode": "replace",
        "OnSuccessJobMode": "fail",
        "Perpetual": "no",
        "PrivateDevices": "no",
        "PrivateIPC": "no",
        "PrivateMounts": "no",
        "PrivateNetwork": "no",
        "PrivateTmp": "no",
        "PrivateUsers": "no",
        "ProcSubset": "all",
        "ProtectClock": "no",
        "ProtectControlGroups": "no",
        "ProtectHome": "no",
        "ProtectHostname": "no",
        "ProtectKernelLogs": "no",
        "ProtectKernelModules": "no",
        "ProtectKernelTunables": "no",
        "ProtectProc": "default",
        "ProtectSystem": "no",
        "RefuseManualStart": "no",
        "RefuseManualStop": "no",
        "ReloadResult": "success",
        "ReloadSignal": "1",
        "RemainAfterExit": "no",
        "RemoveIPC": "no",
        "Requires": "system.slice sysinit.target",
        "Restart": "on-failure",
        "RestartKillSignal": "15",
        "RestartMaxDelayUSec": "infinity",
        "RestartMode": "normal",
        "RestartSteps": "0",
        "RestartUSec": "100ms",
        "RestartUSecNext": "100ms",
        "RestrictNamespaces": "no",
        "RestrictRealtime": "no",
        "RestrictSUIDSGID": "no",
        "Result": "success",
        "RootDirectoryStartOnly": "no",
        "RootEphemeral": "no",
        "RootImagePolicy": "root=verity+signed+encrypted+unprotected+absent:usr=verity+signed+encrypted+unprotected+absent:home=encrypted+unprotected+absent:srv=encrypted+unprotected+absent:tmp=encrypted+unprotected+absent:var=encrypted+unprotected+absent",
        "RuntimeDirectoryMode": "0755",
        "RuntimeDirectoryPreserve": "no",
        "RuntimeMaxUSec": "infinity",
        "RuntimeRandomizedExtraUSec": "0",
        "SameProcessGroup": "no",
        "SecureBits": "0",
        "SendSIGHUP": "no",
        "SendSIGKILL": "yes",
        "SetLoginEnvironment": "no",
        "Slice": "system.slice",
        "StandardError": "inherit",
        "StandardInput": "null",
        "StandardOutput": "journal",
        "StartLimitAction": "none",
        "StartLimitBurst": "5",
        "StartLimitIntervalUSec": "10s",
        "StartupBlockIOWeight": "[not set]",
        "StartupCPUShares": "[not set]",
        "StartupCPUWeight": "[not set]",
        "StartupIOWeight": "[not set]",
        "StartupMemoryHigh": "infinity",
        "StartupMemoryLow": "0",
        "StartupMemoryMax": "infinity",
        "StartupMemorySwapMax": "infinity",
        "StartupMemoryZSwapMax": "infinity",
        "StateChangeTimestamp": "Wed 2025-01-29 18:20:29 EST",
        "StateChangeTimestampMonotonic": "16235581102",
        "StateDirectoryMode": "0755",
        "StatusErrno": "0",
        "StopWhenUnneeded": "no",
        "SubState": "dead",
        "SuccessAction": "none",
        "SurviveFinalKillSignal": "no",
        "SyslogFacility": "9",
        "SyslogLevel": "6",
        "SyslogLevelPrefix": "yes",
        "SyslogPriority": "78",
        "SystemCallErrorNumber": "2147483646",
        "TTYReset": "no",
        "TTYVHangup": "no",
        "TTYVTDisallocate": "no",
        "TasksAccounting": "yes",
        "TasksCurrent": "[not set]",
        "TasksMax": "2277",
        "TimeoutAbortUSec": "1min 30s",
        "TimeoutCleanUSec": "infinity",
        "TimeoutStartFailureMode": "terminate",
        "TimeoutStartUSec": "1min 30s",
        "TimeoutStopFailureMode": "terminate",
        "TimeoutStopUSec": "1min 30s",
        "TimerSlackNSec": "50000",
        "Transient": "no",
        "Type": "simple",
        "UID": "[not set]",
        "UMask": "0022",
        "UnitFilePreset": "enabled",
        "UnitFileState": "enabled",
        "UtmpMode": "init",
        "WantedBy": "multi-user.target",
        "WatchdogSignal": "6",
        "WatchdogTimestampMonotonic": "0",
        "WatchdogUSec": "0"
    }
}
```

``` ansible -i static_inventory managed_node01 -m service -a "name=cron state=started" ```

```
managed_node01 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "name": "cron",
    "state": "started",
    "status": {
        "ActiveEnterTimestamp": "Wed 2025-01-29 13:49:58 EST",
        "ActiveEnterTimestampMonotonic": "7850726",
        "ActiveExitTimestamp": "Wed 2025-01-29 18:20:29 EST",
        "ActiveExitTimestampMonotonic": "16235580643",
        "ActiveState": "inactive",
        "After": "nss-user-lookup.target basic.target sysinit.target system.slice remote-fs.target systemd-journald.socket",
        "AllowIsolate": "no",
        "AssertResult": "yes",
        "AssertTimestamp": "Wed 2025-01-29 13:49:58 EST",
        "AssertTimestampMonotonic": "7735795",
        "Before": "shutdown.target multi-user.target",
        "BlockIOAccounting": "no",
        "BlockIOWeight": "[not set]",
        "CPUAccounting": "yes",
        "CPUAffinityFromNUMA": "no",
        "CPUQuotaPerSecUSec": "infinity",
        "CPUQuotaPeriodUSec": "infinity",
        "CPUSchedulingPolicy": "0",
        "CPUSchedulingPriority": "0",
        "CPUSchedulingResetOnFork": "no",
        "CPUShares": "[not set]",
        "CPUUsageNSec": "365945000",
        "CPUWeight": "[not set]",
        "CacheDirectoryMode": "0755",
        "CanFreeze": "yes",
        "CanIsolate": "no",
        "CanReload": "no",
        "CanStart": "yes",
        "CanStop": "yes",
        "CapabilityBoundingSet": "cap_chown cap_dac_override cap_dac_read_search cap_fowner cap_fsetid cap_kill cap_setgid cap_setuid cap_setpcap cap_linux_immutable cap_net_bind_service cap_net_broadcast cap_net_admin cap_net_raw cap_ipc_lock cap_ipc_owner cap_sys_module cap_sys_rawio cap_sys_chroot cap_sys_ptrace cap_sys_pacct cap_sys_admin cap_sys_boot cap_sys_nice cap_sys_resource cap_sys_time cap_sys_tty_config cap_mknod cap_lease cap_audit_write cap_audit_control cap_setfcap cap_mac_override cap_mac_admin cap_syslog cap_wake_alarm cap_block_suspend cap_audit_read cap_perfmon cap_bpf cap_checkpoint_restore",
        "CleanResult": "success",
        "CollectMode": "inactive",
        "ConditionResult": "yes",
        "ConditionTimestamp": "Wed 2025-01-29 13:49:58 EST",
        "ConditionTimestampMonotonic": "7735790",
        "ConfigurationDirectoryMode": "0755",
        "Conflicts": "shutdown.target",
        "ControlGroupId": "3196",
        "ControlPID": "0",
        "CoredumpFilter": "0x33",
        "CoredumpReceive": "no",
        "DefaultDependencies": "yes",
        "DefaultMemoryLow": "0",
        "DefaultMemoryMin": "0",
        "DefaultStartupMemoryLow": "0",
        "Delegate": "no",
        "Description": "Regular background program processing daemon",
        "DevicePolicy": "auto",
        "Documentation": "\"man:cron(8)\"",
        "DynamicUser": "no",
        "EnvironmentFiles": "/etc/default/cron (ignore_errors=yes)",
        "ExecMainCode": "2",
        "ExecMainExitTimestamp": "Wed 2025-01-29 18:20:29 EST",
        "ExecMainExitTimestampMonotonic": "16235581026",
        "ExecMainPID": "693",
        "ExecMainStartTimestamp": "Wed 2025-01-29 13:49:58 EST",
        "ExecMainStartTimestampMonotonic": "7850576",
        "ExecMainStatus": "15",
        "ExecStart": "{ path=/usr/sbin/cron ; argv[]=/usr/sbin/cron -f -P $EXTRA_OPTS ; ignore_errors=no ; start_time=[Wed 2025-01-29 13:49:58 EST] ; stop_time=[Wed 2025-01-29 18:20:29 EST] ; pid=693 ; code=killed ; status=15/TERM }",
        "ExecStartEx": "{ path=/usr/sbin/cron ; argv[]=/usr/sbin/cron -f -P $EXTRA_OPTS ; flags= ; start_time=[Wed 2025-01-29 13:49:58 EST] ; stop_time=[Wed 2025-01-29 18:20:29 EST] ; pid=693 ; code=killed ; status=15/TERM }",
        "ExitType": "main",
        "ExtensionImagePolicy": "root=verity+signed+encrypted+unprotected+absent:usr=verity+signed+encrypted+unprotected+absent:home=encrypted+unprotected+absent:srv=encrypted+unprotected+absent:tmp=encrypted+unprotected+absent:var=encrypted+unprotected+absent",
        "FailureAction": "none",
        "FileDescriptorStoreMax": "0",
        "FileDescriptorStorePreserve": "restart",
        "FinalKillSignal": "9",
        "FragmentPath": "/usr/lib/systemd/system/cron.service",
        "FreezerState": "running",
        "GID": "[not set]",
        "GuessMainPID": "yes",
        "IOAccounting": "no",
        "IOReadBytes": "[not set]",
        "IOReadOperations": "[not set]",
        "IOSchedulingClass": "2",
        "IOSchedulingPriority": "4",
        "IOWeight": "[not set]",
        "IOWriteBytes": "[not set]",
        "IOWriteOperations": "[not set]",
        "IPAccounting": "no",
        "IPEgressBytes": "[no data]",
        "IPEgressPackets": "[no data]",
        "IPIngressBytes": "[no data]",
        "IPIngressPackets": "[no data]",
        "Id": "cron.service",
        "IgnoreOnIsolate": "no",
        "IgnoreSIGPIPE": "no",
        "InactiveEnterTimestamp": "Wed 2025-01-29 18:20:29 EST",
        "InactiveEnterTimestampMonotonic": "16235581102",
        "InactiveExitTimestamp": "Wed 2025-01-29 13:49:58 EST",
        "InactiveExitTimestampMonotonic": "7850726",
        "InvocationID": "fcaa21b40d7d4ddf8d288609c65e06d3",
        "JobRunningTimeoutUSec": "infinity",
        "JobTimeoutAction": "none",
        "JobTimeoutUSec": "infinity",
        "KeyringMode": "private",
        "KillMode": "process",
        "KillSignal": "15",
        "LimitAS": "infinity",
        "LimitASSoft": "infinity",
        "LimitCORE": "infinity",
        "LimitCORESoft": "0",
        "LimitCPU": "infinity",
        "LimitCPUSoft": "infinity",
        "LimitDATA": "infinity",
        "LimitDATASoft": "infinity",
        "LimitFSIZE": "infinity",
        "LimitFSIZESoft": "infinity",
        "LimitLOCKS": "infinity",
        "LimitLOCKSSoft": "infinity",
        "LimitMEMLOCK": "8388608",
        "LimitMEMLOCKSoft": "8388608",
        "LimitMSGQUEUE": "819200",
        "LimitMSGQUEUESoft": "819200",
        "LimitNICE": "0",
        "LimitNICESoft": "0",
        "LimitNOFILE": "524288",
        "LimitNOFILESoft": "1024",
        "LimitNPROC": "7593",
        "LimitNPROCSoft": "7593",
        "LimitRSS": "infinity",
        "LimitRSSSoft": "infinity",
        "LimitRTPRIO": "0",
        "LimitRTPRIOSoft": "0",
        "LimitRTTIME": "infinity",
        "LimitRTTIMESoft": "infinity",
        "LimitSIGPENDING": "7593",
        "LimitSIGPENDINGSoft": "7593",
        "LimitSTACK": "infinity",
        "LimitSTACKSoft": "8388608",
        "LoadState": "loaded",
        "LockPersonality": "no",
        "LogLevelMax": "-1",
        "LogRateLimitBurst": "0",
        "LogRateLimitIntervalUSec": "0",
        "LogsDirectoryMode": "0755",
        "MainPID": "0",
        "ManagedOOMMemoryPressure": "auto",
        "ManagedOOMMemoryPressureLimit": "0",
        "ManagedOOMPreference": "none",
        "ManagedOOMSwap": "auto",
        "MemoryAccounting": "yes",
        "MemoryAvailable": "997584896",
        "MemoryCurrent": "[not set]",
        "MemoryDenyWriteExecute": "no",
        "MemoryHigh": "infinity",
        "MemoryKSM": "no",
        "MemoryLimit": "infinity",
        "MemoryLow": "0",
        "MemoryMax": "infinity",
        "MemoryMin": "0",
        "MemoryPeak": "3473408",
        "MemoryPressureThresholdUSec": "200ms",
        "MemoryPressureWatch": "auto",
        "MemorySwapCurrent": "[not set]",
        "MemorySwapMax": "infinity",
        "MemorySwapPeak": "0",
        "MemoryZSwapCurrent": "[not set]",
        "MemoryZSwapMax": "infinity",
        "MountAPIVFS": "no",
        "MountImagePolicy": "root=verity+signed+encrypted+unprotected+absent:usr=verity+signed+encrypted+unprotected+absent:home=encrypted+unprotected+absent:srv=encrypted+unprotected+absent:tmp=encrypted+unprotected+absent:var=encrypted+unprotected+absent",
        "NFileDescriptorStore": "0",
        "NRestarts": "0",
        "NUMAPolicy": "n/a",
        "Names": "cron.service",
        "NeedDaemonReload": "yes",
        "Nice": "0",
        "NoNewPrivileges": "no",
        "NonBlocking": "no",
        "NotifyAccess": "none",
        "OOMPolicy": "stop",
        "OOMScoreAdjust": "0",
        "OnFailureJobMode": "replace",
        "OnSuccessJobMode": "fail",
        "Perpetual": "no",
        "PrivateDevices": "no",
        "PrivateIPC": "no",
        "PrivateMounts": "no",
        "PrivateNetwork": "no",
        "PrivateTmp": "no",
        "PrivateUsers": "no",
        "ProcSubset": "all",
        "ProtectClock": "no",
        "ProtectControlGroups": "no",
        "ProtectHome": "no",
        "ProtectHostname": "no",
        "ProtectKernelLogs": "no",
        "ProtectKernelModules": "no",
        "ProtectKernelTunables": "no",
        "ProtectProc": "default",
        "ProtectSystem": "no",
        "RefuseManualStart": "no",
        "RefuseManualStop": "no",
        "ReloadResult": "success",
        "ReloadSignal": "1",
        "RemainAfterExit": "no",
        "RemoveIPC": "no",
        "Requires": "system.slice sysinit.target",
        "Restart": "on-failure",
        "RestartKillSignal": "15",
        "RestartMaxDelayUSec": "infinity",
        "RestartMode": "normal",
        "RestartSteps": "0",
        "RestartUSec": "100ms",
        "RestartUSecNext": "100ms",
        "RestrictNamespaces": "no",
        "RestrictRealtime": "no",
        "RestrictSUIDSGID": "no",
        "Result": "success",
        "RootDirectoryStartOnly": "no",
        "RootEphemeral": "no",
        "RootImagePolicy": "root=verity+signed+encrypted+unprotected+absent:usr=verity+signed+encrypted+unprotected+absent:home=encrypted+unprotected+absent:srv=encrypted+unprotected+absent:tmp=encrypted+unprotected+absent:var=encrypted+unprotected+absent",
        "RuntimeDirectoryMode": "0755",
        "RuntimeDirectoryPreserve": "no",
        "RuntimeMaxUSec": "infinity",
        "RuntimeRandomizedExtraUSec": "0",
        "SameProcessGroup": "no",
        "SecureBits": "0",
        "SendSIGHUP": "no",
        "SendSIGKILL": "yes",
        "SetLoginEnvironment": "no",
        "Slice": "system.slice",
        "StandardError": "inherit",
        "StandardInput": "null",
        "StandardOutput": "journal",
        "StartLimitAction": "none",
        "StartLimitBurst": "5",
        "StartLimitIntervalUSec": "10s",
        "StartupBlockIOWeight": "[not set]",
        "StartupCPUShares": "[not set]",
        "StartupCPUWeight": "[not set]",
        "StartupIOWeight": "[not set]",
        "StartupMemoryHigh": "infinity",
        "StartupMemoryLow": "0",
        "StartupMemoryMax": "infinity",
        "StartupMemorySwapMax": "infinity",
        "StartupMemoryZSwapMax": "infinity",
        "StateChangeTimestamp": "Wed 2025-01-29 18:20:29 EST",
        "StateChangeTimestampMonotonic": "16235581102",
        "StateDirectoryMode": "0755",
        "StatusErrno": "0",
        "StopWhenUnneeded": "no",
        "SubState": "dead",
        "SuccessAction": "none",
        "SurviveFinalKillSignal": "no",
        "SyslogFacility": "9",
        "SyslogLevel": "6",
        "SyslogLevelPrefix": "yes",
        "SyslogPriority": "78",
        "SystemCallErrorNumber": "2147483646",
        "TTYReset": "no",
        "TTYVHangup": "no",
        "TTYVTDisallocate": "no",
        "TasksAccounting": "yes",
        "TasksCurrent": "[not set]",
        "TasksMax": "2277",
        "TimeoutAbortUSec": "1min 30s",
        "TimeoutCleanUSec": "infinity",
        "TimeoutStartFailureMode": "terminate",
        "TimeoutStartUSec": "1min 30s",
        "TimeoutStopFailureMode": "terminate",
        "TimeoutStopUSec": "1min 30s",
        "TimerSlackNSec": "50000",
        "Transient": "no",
        "Type": "simple",
        "UID": "[not set]",
        "UMask": "0022",
        "UnitFilePreset": "enabled",
        "UnitFileState": "enabled",
        "UtmpMode": "init",
        "WantedBy": "multi-user.target",
        "WatchdogSignal": "6",
        "WatchdogTimestampMonotonic": "0",
        "WatchdogUSec": "0"
    }
}
```




## Experience and Challenges

In this lab I learned how to use ad hoc commnads to remotely manage nodes from a control node. I also learned some bash scripting and how to write a simple bash script that checks if there is a file and deletes it if it exists. I also learned how to use the cron module to automate tasks every 5 minutes and how to stop /start a service.

### dificulties & solution:

in order to execute certain ad hoc commands successfully you must use the --become flag. when getting the error permission denied or other error messages it was usually due to insufficient permissions. what solved it was using the --become flag.