# Lab06 Variables and Facts in Ansible
**name:** Zakariya Outbih   
**Student ID:** 100184233  
**Date:** 02/11/2025

## Table of contents
- [Introduction](##Introduction)  
- [VM configuration details](##VM-Configuration-Details)
- [Deliverables](##Deliverables)
- [Experience and Challenges](##Experience-and-Challenges)


## Introduction

This lab focuses on learning how to use variables and facts in Ansible. Variables are used for customizing tasks like creating directories, displaying messages or automating a task. they usually store a value to be used by a module. facts are information about a system that ansible gathers usually through the use of modules like "setup".


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
``` ansible-playbook -i inventory/static_inventory variable_demo.yml ```

```
PLAY [Demonstrate Variables in Ansible] ****************************************

TASK [Gathering Facts] *********************************************************
[WARNING]: Platform linux on host managed_node01 is using the discovered Python
interpreter at /usr/bin/python3.12, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [managed_node01]
[WARNING]: Platform linux on host managed_node02 is using the discovered Python
interpreter at /usr/bin/python3.12, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [managed_node02]

TASK [Create web root directory] ***********************************************
ok: [managed_node02]
ok: [managed_node01]

TASK [Create index.html with a welcome message] ********************************
ok: [managed_node01]
ok: [managed_node02]

TASK [Display the web root path] ***********************************************
ok: [managed_node01] => {
    "msg": "Web root directory is set to /var/www/ansible-lab"
}
ok: [managed_node02] => {
    "msg": "Web root directory is set to /var/www/ansible-lab"
}

TASK [Display application name from group_vars] ********************************
ok: [managed_node01] => {
    "msg": "Application Name: AnsibleLabApp"
}
ok: [managed_node02] => {
    "msg": "Application Name: AnsibleLabApp"
}

TASK [Display server role from host_vars] **************************************
ok: [managed_node01] => {
    "msg": "Server Role: web_server"
}
ok: [managed_node02] => {
    "msg": "Server Role: db_server"
}

TASK [Display OS information] **************************************************
ok: [managed_node01] => {
    "msg": "Operating System: Ubuntu 24.04"
}
ok: [managed_node02] => {
    "msg": "Operating System: Ubuntu 24.04"
}

PLAY RECAP *********************************************************************
managed_node01             : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
managed_node02             : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
```

### Deliverable 2

``` cat all.yml ```

```
---
app_name: AnsibleLabApp
```
### Deliverable 3

```  cat managed_node01.yml ```

```
---
server_role: web_server
```

### Deliverable 4

``` cat managed_node02.yml ```

``` 
---
server_role: db_server
```


### Deliverable 5

``` ansible -i inventory/static_inventory all -m setup ```

```
managed_node01 | SUCCESS => {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "10.0.2.15",
            "192.168.0.2"
        ],
        "ansible_all_ipv6_addresses": [
            "fe80::a00:27ff:feeb:d6b",
            "fe80::a00:27ff:febc:2398"
        ],
        "ansible_apparmor": {
            "status": "enabled"
        },
        "ansible_architecture": "x86_64",
        "ansible_bios_date": "12/01/2006",
        "ansible_bios_vendor": "innotek GmbH",
        "ansible_bios_version": "VirtualBox",
        "ansible_board_asset_tag": "NA",
        "ansible_board_name": "VirtualBox",
        "ansible_board_serial": "NA",
        "ansible_board_vendor": "Oracle Corporation",
        "ansible_board_version": "1.2",
        "ansible_chassis_asset_tag": "NA",
        "ansible_chassis_serial": "NA",
        "ansible_chassis_vendor": "Oracle Corporation",
        "ansible_chassis_version": "NA",
        "ansible_cmdline": {
            "BOOT_IMAGE": "/boot/vmlinuz-6.8.0-52-generic",
            "quiet": true,
            "ro": true,
            "root": "UUID=581e49d4-1847-4940-8d4f-4de0e012604a",
            "splash": true
        },
        "ansible_date_time": {
            "date": "2025-02-11",
            "day": "11",
            "epoch": "1739329580",
            "epoch_int": "1739329580",
            "hour": "22",
            "iso8601": "2025-02-12T03:06:20Z",
            "iso8601_basic": "20250211T220620501104",
            "iso8601_basic_short": "20250211T220620",
            "iso8601_micro": "2025-02-12T03:06:20.501104Z",
            "minute": "06",
            "month": "02",
            "second": "20",
            "time": "22:06:20",
            "tz": "EST",
            "tz_dst": "EDT",
            "tz_offset": "-0500",
            "weekday": "Tuesday",
            "weekday_number": "2",
            "weeknumber": "06",
            "year": "2025"
        },
        "ansible_default_ipv4": {
            "address": "10.0.2.15",
            "alias": "enp0s3",
            "broadcast": "",
            "gateway": "10.0.2.2",
            "interface": "enp0s3",
            "macaddress": "08:00:27:eb:0d:6b",
            "mtu": 1500,
            "netmask": "255.255.255.0",
            "network": "10.0.2.0",
            "prefix": "24",
            "type": "ether"
        },
        "ansible_default_ipv6": {},
        "ansible_device_links": {
            "ids": {
                "sda": [
                    "ata-VBOX_HARDDISK_VB8faec56f-bb97899f"
                ],
                "sda1": [
                    "ata-VBOX_HARDDISK_VB8faec56f-bb97899f-part1"
                ],
                "sda2": [
                    "ata-VBOX_HARDDISK_VB8faec56f-bb97899f-part2"
                ],
                "sr0": [
                    "ata-VBOX_CD-ROM_VB2-01700376"
                ]
            },
            "labels": {},
            "masters": {},
            "uuids": {
                "sda2": [
                    "581e49d4-1847-4940-8d4f-4de0e012604a"
                ]
            }
        },
        "ansible_devices": {
            "loop0": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "8",
                "sectorsize": "512",
                "size": "4.00 KB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop1": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "151288",
                "sectorsize": "512",
                "size": "73.87 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop10": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "22056",
                "sectorsize": "512",
                "size": "10.77 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop11": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "79520",
                "sectorsize": "512",
                "size": "38.83 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop12": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "91008",
                "sectorsize": "512",
                "size": "44.44 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop13": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "1000",
                "sectorsize": "512",
                "size": "500.00 KB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop14": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "1136",
                "sectorsize": "512",
                "size": "568.00 KB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop15": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "0",
                "sectorsize": "512",
                "size": "0.00 Bytes",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop2": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "151328",
                "sectorsize": "512",
                "size": "73.89 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop3": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "563800",
                "sectorsize": "512",
                "size": "275.29 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop4": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "22752",
                "sectorsize": "512",
                "size": "11.11 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop5": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "22800",
                "sectorsize": "512",
                "size": "11.13 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop6": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "528368",
                "sectorsize": "512",
                "size": "257.99 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop7": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "1034424",
                "sectorsize": "512",
                "size": "505.09 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop8": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "187776",
                "sectorsize": "512",
                "size": "91.69 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop9": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "21584",
                "sectorsize": "512",
                "size": "10.54 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "sda": {
                "holders": [],
                "host": "SATA controller: Intel Corporation 82801HM/HEM (ICH8M/ICH8M-E) SATA Controller [AHCI mode] (rev 02)",
                "links": {
                    "ids": [
                        "ata-VBOX_HARDDISK_VB8faec56f-bb97899f"
                    ],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": "VBOX HARDDISK",
                "partitions": {
                    "sda1": {
                        "holders": [],
                        "links": {
                            "ids": [
                                "ata-VBOX_HARDDISK_VB8faec56f-bb97899f-part1"
                            ],
                            "labels": [],
                            "masters": [],
                            "uuids": []
                        },
                        "sectors": "2048",
                        "sectorsize": 512,
                        "size": "1.00 MB",
                        "start": "2048",
                        "uuid": null
                    },
                    "sda2": {
                        "holders": [],
                        "links": {
                            "ids": [
                                "ata-VBOX_HARDDISK_VB8faec56f-bb97899f-part2"
                            ],
                            "labels": [],
                            "masters": [],
                            "uuids": [
                                "581e49d4-1847-4940-8d4f-4de0e012604a"
                            ]
                        },
                        "sectors": "52422656",
                        "sectorsize": 512,
                        "size": "25.00 GB",
                        "start": "4096",
                        "uuid": "581e49d4-1847-4940-8d4f-4de0e012604a"
                    }
                },
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "mq-deadline",
                "sectors": "52428800",
                "sectorsize": "512",
                "size": "25.00 GB",
                "support_discard": "512",
                "vendor": "ATA",
                "virtual": 1
            },
            "sr0": {
                "holders": [],
                "host": "IDE interface: Intel Corporation 82371AB/EB/MB PIIX4 IDE (rev 01)",
                "links": {
                    "ids": [
                        "ata-VBOX_CD-ROM_VB2-01700376"
                    ],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": "CD-ROM",
                "partitions": {},
                "removable": "1",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "mq-deadline",
                "sectors": "2097151",
                "sectorsize": "512",
                "size": "1024.00 MB",
                "support_discard": "512",
                "vendor": "VBOX",
                "virtual": 1
            }
        },
        "ansible_distribution": "Ubuntu",
        "ansible_distribution_file_parsed": true,
        "ansible_distribution_file_path": "/etc/os-release",
        "ansible_distribution_file_variety": "Debian",
        "ansible_distribution_major_version": "24",
        "ansible_distribution_release": "noble",
        "ansible_distribution_version": "24.04",
        "ansible_dns": {
            "nameservers": [
                "127.0.0.53"
            ],
            "options": {
                "edns0": true,
                "trust-ad": true
            },
            "search": [
                "phub.net.cable.rogers.com"
            ]
        },
        "ansible_domain": "",
        "ansible_effective_group_id": 1000,
        "ansible_effective_user_id": 1000,
        "ansible_enp0s3": {
            "active": true,
            "device": "enp0s3",
            "features": {
                "esp_hw_offload": "off [fixed]",
                "esp_tx_csum_hw_offload": "off [fixed]",
                "fcoe_mtu": "off [fixed]",
                "generic_receive_offload": "on",
                "generic_segmentation_offload": "on",
                "highdma": "off [fixed]",
                "hsr_dup_offload": "off [fixed]",
                "hsr_fwd_offload": "off [fixed]",
                "hsr_tag_ins_offload": "off [fixed]",
                "hsr_tag_rm_offload": "off [fixed]",
                "hw_tc_offload": "off [fixed]",
                "l2_fwd_offload": "off [fixed]",
                "large_receive_offload": "off [fixed]",
                "loopback": "off [fixed]",
                "macsec_hw_offload": "off [fixed]",
                "netns_local": "off [fixed]",
                "ntuple_filters": "off [fixed]",
                "receive_hashing": "off [fixed]",
                "rx_all": "off",
                "rx_checksumming": "off",
                "rx_fcs": "off",
                "rx_gro_hw": "off [fixed]",
                "rx_gro_list": "off",
                "rx_udp_gro_forwarding": "off",
                "rx_udp_tunnel_port_offload": "off [fixed]",
                "rx_vlan_filter": "on [fixed]",
                "rx_vlan_offload": "on",
                "rx_vlan_stag_filter": "off [fixed]",
                "rx_vlan_stag_hw_parse": "off [fixed]",
                "scatter_gather": "on",
                "tcp_segmentation_offload": "on",
                "tls_hw_record": "off [fixed]",
                "tls_hw_rx_offload": "off [fixed]",
                "tls_hw_tx_offload": "off [fixed]",
                "tx_checksum_fcoe_crc": "off [fixed]",
                "tx_checksum_ip_generic": "on",
                "tx_checksum_ipv4": "off [fixed]",
                "tx_checksum_ipv6": "off [fixed]",
                "tx_checksum_sctp": "off [fixed]",
                "tx_checksumming": "on",
                "tx_esp_segmentation": "off [fixed]",
                "tx_fcoe_segmentation": "off [fixed]",
                "tx_gre_csum_segmentation": "off [fixed]",
                "tx_gre_segmentation": "off [fixed]",
                "tx_gso_list": "off [fixed]",
                "tx_gso_partial": "off [fixed]",
                "tx_gso_robust": "off [fixed]",
                "tx_ipxip4_segmentation": "off [fixed]",
                "tx_ipxip6_segmentation": "off [fixed]",
                "tx_lockless": "off [fixed]",
                "tx_nocache_copy": "off",
                "tx_scatter_gather": "on",
                "tx_scatter_gather_fraglist": "off [fixed]",
                "tx_sctp_segmentation": "off [fixed]",
                "tx_tcp6_segmentation": "off [fixed]",
                "tx_tcp_ecn_segmentation": "off [fixed]",
                "tx_tcp_mangleid_segmentation": "off",
                "tx_tcp_segmentation": "on",
                "tx_tunnel_remcsum_segmentation": "off [fixed]",
                "tx_udp_segmentation": "off [fixed]",
                "tx_udp_tnl_csum_segmentation": "off [fixed]",
                "tx_udp_tnl_segmentation": "off [fixed]",
                "tx_vlan_offload": "on [fixed]",
                "tx_vlan_stag_hw_insert": "off [fixed]",
                "vlan_challenged": "off [fixed]"
            },
            "hw_timestamp_filters": [],
            "ipv4": {
                "address": "10.0.2.15",
                "broadcast": "",
                "netmask": "255.255.255.0",
                "network": "10.0.2.0",
                "prefix": "24"
            },
            "ipv6": [
                {
                    "address": "fe80::a00:27ff:feeb:d6b",
                    "prefix": "64",
                    "scope": "link"
                }
            ],
            "macaddress": "08:00:27:eb:0d:6b",
            "module": "e1000",
            "mtu": 1500,
            "pciid": "0000:00:03.0",
            "promisc": false,
            "speed": 1000,
            "timestamping": [],
            "type": "ether"
        },
        "ansible_enp0s8": {
            "active": true,
            "device": "enp0s8",
            "features": {
                "esp_hw_offload": "off [fixed]",
                "esp_tx_csum_hw_offload": "off [fixed]",
                "fcoe_mtu": "off [fixed]",
                "generic_receive_offload": "on",
                "generic_segmentation_offload": "on",
                "highdma": "off [fixed]",
                "hsr_dup_offload": "off [fixed]",
                "hsr_fwd_offload": "off [fixed]",
                "hsr_tag_ins_offload": "off [fixed]",
                "hsr_tag_rm_offload": "off [fixed]",
                "hw_tc_offload": "off [fixed]",
                "l2_fwd_offload": "off [fixed]",
                "large_receive_offload": "off [fixed]",
                "loopback": "off [fixed]",
                "macsec_hw_offload": "off [fixed]",
                "netns_local": "off [fixed]",
                "ntuple_filters": "off [fixed]",
                "receive_hashing": "off [fixed]",
                "rx_all": "off",
                "rx_checksumming": "off",
                "rx_fcs": "off",
                "rx_gro_hw": "off [fixed]",
                "rx_gro_list": "off",
                "rx_udp_gro_forwarding": "off",
                "rx_udp_tunnel_port_offload": "off [fixed]",
                "rx_vlan_filter": "on [fixed]",
                "rx_vlan_offload": "on",
                "rx_vlan_stag_filter": "off [fixed]",
                "rx_vlan_stag_hw_parse": "off [fixed]",
                "scatter_gather": "on",
                "tcp_segmentation_offload": "on",
                "tls_hw_record": "off [fixed]",
                "tls_hw_rx_offload": "off [fixed]",
                "tls_hw_tx_offload": "off [fixed]",
                "tx_checksum_fcoe_crc": "off [fixed]",
                "tx_checksum_ip_generic": "on",
                "tx_checksum_ipv4": "off [fixed]",
                "tx_checksum_ipv6": "off [fixed]",
                "tx_checksum_sctp": "off [fixed]",
                "tx_checksumming": "on",
                "tx_esp_segmentation": "off [fixed]",
                "tx_fcoe_segmentation": "off [fixed]",
                "tx_gre_csum_segmentation": "off [fixed]",
                "tx_gre_segmentation": "off [fixed]",
                "tx_gso_list": "off [fixed]",
                "tx_gso_partial": "off [fixed]",
                "tx_gso_robust": "off [fixed]",
                "tx_ipxip4_segmentation": "off [fixed]",
                "tx_ipxip6_segmentation": "off [fixed]",
                "tx_lockless": "off [fixed]",
                "tx_nocache_copy": "off",
                "tx_scatter_gather": "on",
                "tx_scatter_gather_fraglist": "off [fixed]",
                "tx_sctp_segmentation": "off [fixed]",
                "tx_tcp6_segmentation": "off [fixed]",
                "tx_tcp_ecn_segmentation": "off [fixed]",
                "tx_tcp_mangleid_segmentation": "off",
                "tx_tcp_segmentation": "on",
                "tx_tunnel_remcsum_segmentation": "off [fixed]",
                "tx_udp_segmentation": "off [fixed]",
                "tx_udp_tnl_csum_segmentation": "off [fixed]",
                "tx_udp_tnl_segmentation": "off [fixed]",
                "tx_vlan_offload": "on [fixed]",
                "tx_vlan_stag_hw_insert": "off [fixed]",
                "vlan_challenged": "off [fixed]"
            },
            "hw_timestamp_filters": [],
            "ipv4": {
                "address": "192.168.0.2",
                "broadcast": "192.168.0.255",
                "netmask": "255.255.255.0",
                "network": "192.168.0.0",
                "prefix": "24"
            },
            "ipv6": [
                {
                    "address": "fe80::a00:27ff:febc:2398",
                    "prefix": "64",
                    "scope": "link"
                }
            ],
            "macaddress": "08:00:27:bc:23:98",
            "module": "e1000",
            "mtu": 1500,
            "pciid": "0000:00:08.0",
            "promisc": false,
            "speed": 1000,
            "timestamping": [],
            "type": "ether"
        },
        "ansible_env": {
            "DBUS_SESSION_BUS_ADDRESS": "unix:path=/run/user/1000/bus",
            "HOME": "/home/managenode01",
            "LANG": "en_US.UTF-8",
            "LOGNAME": "managenode01",
            "PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin",
            "PWD": "/home/managenode01",
            "SHELL": "/bin/bash",
            "SHLVL": "0",
            "SSH_CLIENT": "192.168.0.1 54346 22",
            "SSH_CONNECTION": "192.168.0.1 54346 192.168.0.2 22",
            "SSH_TTY": "/dev/pts/1",
            "TERM": "xterm-256color",
            "USER": "managenode01",
            "XDG_RUNTIME_DIR": "/run/user/1000",
            "XDG_SESSION_CLASS": "user",
            "XDG_SESSION_ID": "68",
            "XDG_SESSION_TYPE": "tty",
            "_": "/bin/sh"
        },
        "ansible_fibre_channel_wwn": [],
        "ansible_fips": false,
        "ansible_form_factor": "Other",
        "ansible_fqdn": "managenode01-VirtualBox",
        "ansible_hostname": "managenode01-VirtualBox",
        "ansible_hostnqn": "",
        "ansible_interfaces": [
            "enp0s8",
            "lo",
            "enp0s3"
        ],
        "ansible_is_chroot": false,
        "ansible_iscsi_iqn": "",
        "ansible_kernel": "6.8.0-52-generic",
        "ansible_kernel_version": "#53-Ubuntu SMP PREEMPT_DYNAMIC Sat Jan 11 00:06:25 UTC 2025",
        "ansible_lo": {
            "active": true,
            "device": "lo",
            "features": {
                "esp_hw_offload": "off [fixed]",
                "esp_tx_csum_hw_offload": "off [fixed]",
                "fcoe_mtu": "off [fixed]",
                "generic_receive_offload": "on",
                "generic_segmentation_offload": "on",
                "highdma": "on [fixed]",
                "hsr_dup_offload": "off [fixed]",
                "hsr_fwd_offload": "off [fixed]",
                "hsr_tag_ins_offload": "off [fixed]",
                "hsr_tag_rm_offload": "off [fixed]",
                "hw_tc_offload": "off [fixed]",
                "l2_fwd_offload": "off [fixed]",
                "large_receive_offload": "off [fixed]",
                "loopback": "on [fixed]",
                "macsec_hw_offload": "off [fixed]",
                "netns_local": "on [fixed]",
                "ntuple_filters": "off [fixed]",
                "receive_hashing": "off [fixed]",
                "rx_all": "off [fixed]",
                "rx_checksumming": "on [fixed]",
                "rx_fcs": "off [fixed]",
                "rx_gro_hw": "off [fixed]",
                "rx_gro_list": "off",
                "rx_udp_gro_forwarding": "off",
                "rx_udp_tunnel_port_offload": "off [fixed]",
                "rx_vlan_filter": "off [fixed]",
                "rx_vlan_offload": "off [fixed]",
                "rx_vlan_stag_filter": "off [fixed]",
                "rx_vlan_stag_hw_parse": "off [fixed]",
                "scatter_gather": "on",
                "tcp_segmentation_offload": "on",
                "tls_hw_record": "off [fixed]",
                "tls_hw_rx_offload": "off [fixed]",
                "tls_hw_tx_offload": "off [fixed]",
                "tx_checksum_fcoe_crc": "off [fixed]",
                "tx_checksum_ip_generic": "on [fixed]",
                "tx_checksum_ipv4": "off [fixed]",
                "tx_checksum_ipv6": "off [fixed]",
                "tx_checksum_sctp": "on [fixed]",
                "tx_checksumming": "on",
                "tx_esp_segmentation": "off [fixed]",
                "tx_fcoe_segmentation": "off [fixed]",
                "tx_gre_csum_segmentation": "off [fixed]",
                "tx_gre_segmentation": "off [fixed]",
                "tx_gso_list": "on",
                "tx_gso_partial": "off [fixed]",
                "tx_gso_robust": "off [fixed]",
                "tx_ipxip4_segmentation": "off [fixed]",
                "tx_ipxip6_segmentation": "off [fixed]",
                "tx_lockless": "on [fixed]",
                "tx_nocache_copy": "off [fixed]",
                "tx_scatter_gather": "on [fixed]",
                "tx_scatter_gather_fraglist": "on [fixed]",
                "tx_sctp_segmentation": "on",
                "tx_tcp6_segmentation": "on",
                "tx_tcp_ecn_segmentation": "on",
                "tx_tcp_mangleid_segmentation": "on",
                "tx_tcp_segmentation": "on",
                "tx_tunnel_remcsum_segmentation": "off [fixed]",
                "tx_udp_segmentation": "on",
                "tx_udp_tnl_csum_segmentation": "off [fixed]",
                "tx_udp_tnl_segmentation": "off [fixed]",
                "tx_vlan_offload": "off [fixed]",
                "tx_vlan_stag_hw_insert": "off [fixed]",
                "vlan_challenged": "on [fixed]"
            },
            "hw_timestamp_filters": [],
            "ipv4": {
                "address": "127.0.0.1",
                "broadcast": "",
                "netmask": "255.0.0.0",
                "network": "127.0.0.0",
                "prefix": "8"
            },
            "ipv6": [
                {
                    "address": "::1",
                    "prefix": "128",
                    "scope": "host"
                }
            ],
            "mtu": 65536,
            "promisc": false,
            "timestamping": [],
            "type": "loopback"
        },
        "ansible_loadavg": {
            "15m": 0.00537109375,
            "1m": 0.080078125,
            "5m": 0.0166015625
        },
        "ansible_local": {},
        "ansible_locally_reachable_ips": {
            "ipv4": [
                "10.0.2.15",
                "127.0.0.0/8",
                "127.0.0.1",
                "192.168.0.2"
            ],
            "ipv6": [
                "::1",
                "fe80::a00:27ff:febc:2398",
                "fe80::a00:27ff:feeb:d6b"
            ]
        },
        "ansible_lsb": {
            "codename": "noble",
            "description": "Ubuntu 24.04.1 LTS",
            "id": "Ubuntu",
            "major_release": "24",
            "release": "24.04"
        },
        "ansible_lvm": "N/A",
        "ansible_machine": "x86_64",
        "ansible_machine_id": "b1d0a32d03be4431ac63f3e0edfddbb1",
        "ansible_memfree_mb": 195,
        "ansible_memory_mb": {
            "nocache": {
                "free": 1086,
                "used": 881
            },
            "real": {
                "free": 195,
                "total": 1967,
                "used": 1772
            },
            "swap": {
                "cached": 0,
                "free": 2047,
                "total": 2047,
                "used": 0
            }
        },
        "ansible_memtotal_mb": 1967,
        "ansible_mounts": [
            {
                "block_available": 3838816,
                "block_size": 4096,
                "block_total": 6405945,
                "block_used": 2567129,
                "device": "/dev/sda2",
                "dump": 0,
                "fstype": "ext4",
                "inode_available": 1426440,
                "inode_total": 1638400,
                "inode_used": 211960,
                "mount": "/",
                "options": "rw,relatime",
                "passno": 0,
                "size_available": 15723790336,
                "size_total": 26238750720,
                "uuid": "581e49d4-1847-4940-8d4f-4de0e012604a"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 1,
                "block_used": 1,
                "device": "/dev/loop0",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 29,
                "inode_used": 29,
                "mount": "/snap/bare/5",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 131072,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 591,
                "block_used": 591,
                "device": "/dev/loop1",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 14248,
                "inode_used": 14248,
                "mount": "/snap/core22/1722",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 77463552,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 2203,
                "block_used": 2203,
                "device": "/dev/loop3",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 820,
                "inode_used": 820,
                "mount": "/snap/firefox/5647",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 288751616,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 592,
                "block_used": 592,
                "device": "/dev/loop2",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 14262,
                "inode_used": 14262,
                "mount": "/snap/core22/1748",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 77594624,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 89,
                "block_used": 89,
                "device": "/dev/loop4",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 65,
                "inode_used": 65,
                "mount": "/snap/firmware-updater/147",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 11665408,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 90,
                "block_used": 90,
                "device": "/dev/loop5",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 65,
                "inode_used": 65,
                "mount": "/snap/firmware-updater/167",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 11796480,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 2064,
                "block_used": 2064,
                "device": "/dev/loop6",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 820,
                "inode_used": 820,
                "mount": "/snap/firefox/5701",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 270532608,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 4041,
                "block_used": 4041,
                "device": "/dev/loop7",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 20797,
                "inode_used": 20797,
                "mount": "/snap/gnome-42-2204/176",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 529661952,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 734,
                "block_used": 734,
                "device": "/dev/loop8",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 76208,
                "inode_used": 76208,
                "mount": "/snap/gtk-common-themes/1535",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 96206848,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 87,
                "block_used": 87,
                "device": "/dev/loop10",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 68,
                "inode_used": 68,
                "mount": "/snap/snap-store/1248",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 11403264,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 85,
                "block_used": 85,
                "device": "/dev/loop9",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 74,
                "inode_used": 74,
                "mount": "/snap/snap-store/1173",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 11141120,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 311,
                "block_used": 311,
                "device": "/dev/loop11",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 651,
                "inode_used": 651,
                "mount": "/snap/snapd/21759",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 40763392,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 356,
                "block_used": 356,
                "device": "/dev/loop12",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 608,
                "inode_used": 608,
                "mount": "/snap/snapd/23545",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 46661632,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 4,
                "block_used": 4,
                "device": "/dev/loop13",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 49,
                "inode_used": 49,
                "mount": "/snap/snapd-desktop-integration/178",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 524288,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 5,
                "block_used": 5,
                "device": "/dev/loop14",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 61,
                "inode_used": 61,
                "mount": "/snap/snapd-desktop-integration/253",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 655360,
                "uuid": "N/A"
            }
        ],
        "ansible_nodename": "managenode01-VirtualBox",
        "ansible_os_family": "Debian",
        "ansible_pkg_mgr": "apt",
        "ansible_proc_cmdline": {
            "BOOT_IMAGE": "/boot/vmlinuz-6.8.0-52-generic",
            "quiet": true,
            "ro": true,
            "root": "UUID=581e49d4-1847-4940-8d4f-4de0e012604a",
            "splash": true
        },
        "ansible_processor": [
            "0",
            "AuthenticAMD",
            "AMD Ryzen 7 5800H with Radeon Graphics",
            "1",
            "AuthenticAMD",
            "AMD Ryzen 7 5800H with Radeon Graphics"
        ],
        "ansible_processor_cores": 2,
        "ansible_processor_count": 1,
        "ansible_processor_nproc": 2,
        "ansible_processor_threads_per_core": 1,
        "ansible_processor_vcpus": 2,
        "ansible_product_name": "VirtualBox",
        "ansible_product_serial": "NA",
        "ansible_product_uuid": "NA",
        "ansible_product_version": "1.2",
        "ansible_python": {
            "executable": "/usr/bin/python3.12",
            "has_sslcontext": true,
            "type": "cpython",
            "version": {
                "major": 3,
                "micro": 3,
                "minor": 12,
                "releaselevel": "final",
                "serial": 0
            },
            "version_info": [
                3,
                12,
                3,
                "final",
                0
            ]
        },
        "ansible_python_version": "3.12.3",
        "ansible_real_group_id": 1000,
        "ansible_real_user_id": 1000,
        "ansible_selinux": {
            "status": "disabled"
        },
        "ansible_selinux_python_present": true,
        "ansible_service_mgr": "systemd",
        "ansible_ssh_host_key_ecdsa_public": "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOS1M8N1UW5nlkG4GPUo1DzhOpqypBcPWkec6PniptDtxUhOQBsDzdnHov6Mu7qjTKaUU8/BI8w5K5vJ0nGPMtI=",
        "ansible_ssh_host_key_ecdsa_public_keytype": "ecdsa-sha2-nistp256",
        "ansible_ssh_host_key_ed25519_public": "AAAAC3NzaC1lZDI1NTE5AAAAIGruw9skVrItdojK/NFWFoISJhI+Y3PG31ECZD5LdD0M",
        "ansible_ssh_host_key_ed25519_public_keytype": "ssh-ed25519",
        "ansible_ssh_host_key_rsa_public": "AAAAB3NzaC1yc2EAAAADAQABAAABgQDHKaCdzZLg0Hy2wfsTwC+dHp/CQKqEeLWVzvrhS36sliUysT3n73ReatZy3DCT1E//UcPLkrG7kbt0BObtYrPEKxuM+b8CkJTxXlwztouQDFuqV8hPvSnhTzgFMC9Gee3+4oaVPGBB7zrK80TTo2xhHekhplTeh6NLeUjh4ZWkGqutb+pps8/UfdccR2WhsTzcUfbSBiiQdjzWfZs1nKt6+zs/RSL+ETkgjK/E0ZXtVPKYueeG6bpMSMdTGcIZhdMWiary2SMQYomUVBQEhIJRDb6JiIxzXtAXa6qGxJXPKXeJOcIJZZecyl/Xw4CCv1LvtD4fYrdzTR98O0x7UMZ96lFap76cMJe4In4jlGtlZIpJm6sSAntI4ngWv8MpjxBCdNs7/CT4whYtV0irjNeEdXcyvHWLNaCC+y9etLN1mP5yPTvy83Rv1ElZoFxvc7j83FHTjhAFebERFG8B8xLXrnTLMeMG4MXkMr7j7OCUNCkOTO06nwx+TlXoBsX9c3M=",
        "ansible_ssh_host_key_rsa_public_keytype": "ssh-rsa",
        "ansible_swapfree_mb": 2047,
        "ansible_swaptotal_mb": 2047,
        "ansible_system": "Linux",
        "ansible_system_capabilities": [
            ""
        ],
        "ansible_system_capabilities_enforced": "True",
        "ansible_system_vendor": "innotek GmbH",
        "ansible_uptime_seconds": 12113,
        "ansible_user_dir": "/home/managenode01",
        "ansible_user_gecos": "managenode01",
        "ansible_user_gid": 1000,
        "ansible_user_id": "managenode01",
        "ansible_user_shell": "/bin/bash",
        "ansible_user_uid": 1000,
        "ansible_userspace_architecture": "x86_64",
        "ansible_userspace_bits": "64",
        "ansible_virtualization_role": "guest",
        "ansible_virtualization_tech_guest": [
            "virtualbox"
        ],
        "ansible_virtualization_tech_host": [],
        "ansible_virtualization_type": "virtualbox",
        "discovered_interpreter_python": "/usr/bin/python3.12",
        "gather_subset": [
            "all"
        ],
        "module_setup": true
    },
    "changed": false
}
[WARNING]: Platform linux on host managed_node02 is using the discovered Python
interpreter at /usr/bin/python3.12, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.17/reference_appendices/interpreter_discovery.html for more information.
managed_node02 | SUCCESS => {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "10.0.2.15",
            "192.168.0.3"
        ],
        "ansible_all_ipv6_addresses": [
            "fe80::a00:27ff:fe5b:7e34",
            "fe80::a00:27ff:fe27:ad8b"
        ],
        "ansible_apparmor": {
            "status": "enabled"
        },
        "ansible_architecture": "x86_64",
        "ansible_bios_date": "12/01/2006",
        "ansible_bios_vendor": "innotek GmbH",
        "ansible_bios_version": "VirtualBox",
        "ansible_board_asset_tag": "NA",
        "ansible_board_name": "VirtualBox",
        "ansible_board_serial": "NA",
        "ansible_board_vendor": "Oracle Corporation",
        "ansible_board_version": "1.2",
        "ansible_chassis_asset_tag": "NA",
        "ansible_chassis_serial": "NA",
        "ansible_chassis_vendor": "Oracle Corporation",
        "ansible_chassis_version": "NA",
        "ansible_cmdline": {
            "BOOT_IMAGE": "/boot/vmlinuz-6.8.0-52-generic",
            "quiet": true,
            "ro": true,
            "root": "UUID=d1829088-8e84-4e56-9a58-0146089beaf2",
            "splash": true
        },
        "ansible_date_time": {
            "date": "2025-02-11",
            "day": "11",
            "epoch": "1739329580",
            "epoch_int": "1739329580",
            "hour": "22",
            "iso8601": "2025-02-12T03:06:20Z",
            "iso8601_basic": "20250211T220620389325",
            "iso8601_basic_short": "20250211T220620",
            "iso8601_micro": "2025-02-12T03:06:20.389325Z",
            "minute": "06",
            "month": "02",
            "second": "20",
            "time": "22:06:20",
            "tz": "EST",
            "tz_dst": "EDT",
            "tz_offset": "-0500",
            "weekday": "Tuesday",
            "weekday_number": "2",
            "weeknumber": "06",
            "year": "2025"
        },
        "ansible_default_ipv4": {
            "address": "10.0.2.15",
            "alias": "enp0s3",
            "broadcast": "",
            "gateway": "10.0.2.2",
            "interface": "enp0s3",
            "macaddress": "08:00:27:5b:7e:34",
            "mtu": 1500,
            "netmask": "255.255.255.0",
            "network": "10.0.2.0",
            "prefix": "24",
            "type": "ether"
        },
        "ansible_default_ipv6": {},
        "ansible_device_links": {
            "ids": {
                "sda": [
                    "ata-VBOX_HARDDISK_VB5ed8e29c-1edd28b6"
                ],
                "sda1": [
                    "ata-VBOX_HARDDISK_VB5ed8e29c-1edd28b6-part1"
                ],
                "sda2": [
                    "ata-VBOX_HARDDISK_VB5ed8e29c-1edd28b6-part2"
                ],
                "sr0": [
                    "ata-VBOX_CD-ROM_VB0-1a2b3c4d"
                ]
            },
            "labels": {},
            "masters": {},
            "uuids": {
                "sda2": [
                    "d1829088-8e84-4e56-9a58-0146089beaf2"
                ]
            }
        },
        "ansible_devices": {
            "loop0": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "8",
                "sectorsize": "512",
                "size": "4.00 KB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop1": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "151288",
                "sectorsize": "512",
                "size": "73.87 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop10": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "91008",
                "sectorsize": "512",
                "size": "44.44 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop11": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "1136",
                "sectorsize": "512",
                "size": "568.00 KB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop12": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "1000",
                "sectorsize": "512",
                "size": "500.00 KB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop13": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "1056784",
                "sectorsize": "512",
                "size": "516.01 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop2": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "151328",
                "sectorsize": "512",
                "size": "73.89 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop3": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "552488",
                "sectorsize": "512",
                "size": "269.77 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop4": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "22752",
                "sectorsize": "512",
                "size": "11.11 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop5": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "1034424",
                "sectorsize": "512",
                "size": "505.09 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop6": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "22800",
                "sectorsize": "512",
                "size": "11.13 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop7": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "187776",
                "sectorsize": "512",
                "size": "91.69 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop8": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "79520",
                "sectorsize": "512",
                "size": "38.83 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "loop9": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {},
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "none",
                "sectors": "21584",
                "sectorsize": "512",
                "size": "10.54 MB",
                "support_discard": "4096",
                "vendor": null,
                "virtual": 1
            },
            "sda": {
                "holders": [],
                "host": "SATA controller: Intel Corporation 82801HM/HEM (ICH8M/ICH8M-E) SATA Controller [AHCI mode] (rev 02)",
                "links": {
                    "ids": [
                        "ata-VBOX_HARDDISK_VB5ed8e29c-1edd28b6"
                    ],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": "VBOX HARDDISK",
                "partitions": {
                    "sda1": {
                        "holders": [],
                        "links": {
                            "ids": [
                                "ata-VBOX_HARDDISK_VB5ed8e29c-1edd28b6-part1"
                            ],
                            "labels": [],
                            "masters": [],
                            "uuids": []
                        },
                        "sectors": "2048",
                        "sectorsize": 512,
                        "size": "1.00 MB",
                        "start": "2048",
                        "uuid": null
                    },
                    "sda2": {
                        "holders": [],
                        "links": {
                            "ids": [
                                "ata-VBOX_HARDDISK_VB5ed8e29c-1edd28b6-part2"
                            ],
                            "labels": [],
                            "masters": [],
                            "uuids": [
                                "d1829088-8e84-4e56-9a58-0146089beaf2"
                            ]
                        },
                        "sectors": "52422656",
                        "sectorsize": 512,
                        "size": "25.00 GB",
                        "start": "4096",
                        "uuid": "d1829088-8e84-4e56-9a58-0146089beaf2"
                    }
                },
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "mq-deadline",
                "sectors": "52428800",
                "sectorsize": "512",
                "size": "25.00 GB",
                "support_discard": "512",
                "vendor": "ATA",
                "virtual": 1
            },
            "sr0": {
                "holders": [],
                "host": "SATA controller: Intel Corporation 82801HM/HEM (ICH8M/ICH8M-E) SATA Controller [AHCI mode] (rev 02)",
                "links": {
                    "ids": [
                        "ata-VBOX_CD-ROM_VB0-1a2b3c4d"
                    ],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": "CD-ROM",
                "partitions": {},
                "removable": "1",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "mq-deadline",
                "sectors": "2097151",
                "sectorsize": "512",
                "size": "1024.00 MB",
                "support_discard": "512",
                "vendor": "VBOX",
                "virtual": 1
            }
        },
        "ansible_distribution": "Ubuntu",
        "ansible_distribution_file_parsed": true,
        "ansible_distribution_file_path": "/etc/os-release",
        "ansible_distribution_file_variety": "Debian",
        "ansible_distribution_major_version": "24",
        "ansible_distribution_release": "noble",
        "ansible_distribution_version": "24.04",
        "ansible_dns": {
            "nameservers": [
                "127.0.0.53"
            ],
            "options": {
                "edns0": true,
                "trust-ad": true
            },
            "search": [
                "phub.net.cable.rogers.com"
            ]
        },
        "ansible_domain": "",
        "ansible_effective_group_id": 1000,
        "ansible_effective_user_id": 1000,
        "ansible_enp0s3": {
            "active": true,
            "device": "enp0s3",
            "features": {
                "esp_hw_offload": "off [fixed]",
                "esp_tx_csum_hw_offload": "off [fixed]",
                "fcoe_mtu": "off [fixed]",
                "generic_receive_offload": "on",
                "generic_segmentation_offload": "on",
                "highdma": "off [fixed]",
                "hsr_dup_offload": "off [fixed]",
                "hsr_fwd_offload": "off [fixed]",
                "hsr_tag_ins_offload": "off [fixed]",
                "hsr_tag_rm_offload": "off [fixed]",
                "hw_tc_offload": "off [fixed]",
                "l2_fwd_offload": "off [fixed]",
                "large_receive_offload": "off [fixed]",
                "loopback": "off [fixed]",
                "macsec_hw_offload": "off [fixed]",
                "netns_local": "off [fixed]",
                "ntuple_filters": "off [fixed]",
                "receive_hashing": "off [fixed]",
                "rx_all": "off",
                "rx_checksumming": "off",
                "rx_fcs": "off",
                "rx_gro_hw": "off [fixed]",
                "rx_gro_list": "off",
                "rx_udp_gro_forwarding": "off",
                "rx_udp_tunnel_port_offload": "off [fixed]",
                "rx_vlan_filter": "on [fixed]",
                "rx_vlan_offload": "on",
                "rx_vlan_stag_filter": "off [fixed]",
                "rx_vlan_stag_hw_parse": "off [fixed]",
                "scatter_gather": "on",
                "tcp_segmentation_offload": "on",
                "tls_hw_record": "off [fixed]",
                "tls_hw_rx_offload": "off [fixed]",
                "tls_hw_tx_offload": "off [fixed]",
                "tx_checksum_fcoe_crc": "off [fixed]",
                "tx_checksum_ip_generic": "on",
                "tx_checksum_ipv4": "off [fixed]",
                "tx_checksum_ipv6": "off [fixed]",
                "tx_checksum_sctp": "off [fixed]",
                "tx_checksumming": "on",
                "tx_esp_segmentation": "off [fixed]",
                "tx_fcoe_segmentation": "off [fixed]",
                "tx_gre_csum_segmentation": "off [fixed]",
                "tx_gre_segmentation": "off [fixed]",
                "tx_gso_list": "off [fixed]",
                "tx_gso_partial": "off [fixed]",
                "tx_gso_robust": "off [fixed]",
                "tx_ipxip4_segmentation": "off [fixed]",
                "tx_ipxip6_segmentation": "off [fixed]",
                "tx_lockless": "off [fixed]",
                "tx_nocache_copy": "off",
                "tx_scatter_gather": "on",
                "tx_scatter_gather_fraglist": "off [fixed]",
                "tx_sctp_segmentation": "off [fixed]",
                "tx_tcp6_segmentation": "off [fixed]",
                "tx_tcp_ecn_segmentation": "off [fixed]",
                "tx_tcp_mangleid_segmentation": "off",
                "tx_tcp_segmentation": "on",
                "tx_tunnel_remcsum_segmentation": "off [fixed]",
                "tx_udp_segmentation": "off [fixed]",
                "tx_udp_tnl_csum_segmentation": "off [fixed]",
                "tx_udp_tnl_segmentation": "off [fixed]",
                "tx_vlan_offload": "on [fixed]",
                "tx_vlan_stag_hw_insert": "off [fixed]",
                "vlan_challenged": "off [fixed]"
            },
            "hw_timestamp_filters": [],
            "ipv4": {
                "address": "10.0.2.15",
                "broadcast": "",
                "netmask": "255.255.255.0",
                "network": "10.0.2.0",
                "prefix": "24"
            },
            "ipv6": [
                {
                    "address": "fe80::a00:27ff:fe5b:7e34",
                    "prefix": "64",
                    "scope": "link"
                }
            ],
            "macaddress": "08:00:27:5b:7e:34",
            "module": "e1000",
            "mtu": 1500,
            "pciid": "0000:00:03.0",
            "promisc": false,
            "speed": 1000,
            "timestamping": [],
            "type": "ether"
        },
        "ansible_enp0s8": {
            "active": true,
            "device": "enp0s8",
            "features": {
                "esp_hw_offload": "off [fixed]",
                "esp_tx_csum_hw_offload": "off [fixed]",
                "fcoe_mtu": "off [fixed]",
                "generic_receive_offload": "on",
                "generic_segmentation_offload": "on",
                "highdma": "off [fixed]",
                "hsr_dup_offload": "off [fixed]",
                "hsr_fwd_offload": "off [fixed]",
                "hsr_tag_ins_offload": "off [fixed]",
                "hsr_tag_rm_offload": "off [fixed]",
                "hw_tc_offload": "off [fixed]",
                "l2_fwd_offload": "off [fixed]",
                "large_receive_offload": "off [fixed]",
                "loopback": "off [fixed]",
                "macsec_hw_offload": "off [fixed]",
                "netns_local": "off [fixed]",
                "ntuple_filters": "off [fixed]",
                "receive_hashing": "off [fixed]",
                "rx_all": "off",
                "rx_checksumming": "off",
                "rx_fcs": "off",
                "rx_gro_hw": "off [fixed]",
                "rx_gro_list": "off",
                "rx_udp_gro_forwarding": "off",
                "rx_udp_tunnel_port_offload": "off [fixed]",
                "rx_vlan_filter": "on [fixed]",
                "rx_vlan_offload": "on",
                "rx_vlan_stag_filter": "off [fixed]",
                "rx_vlan_stag_hw_parse": "off [fixed]",
                "scatter_gather": "on",
                "tcp_segmentation_offload": "on",
                "tls_hw_record": "off [fixed]",
                "tls_hw_rx_offload": "off [fixed]",
                "tls_hw_tx_offload": "off [fixed]",
                "tx_checksum_fcoe_crc": "off [fixed]",
                "tx_checksum_ip_generic": "on",
                "tx_checksum_ipv4": "off [fixed]",
                "tx_checksum_ipv6": "off [fixed]",
                "tx_checksum_sctp": "off [fixed]",
                "tx_checksumming": "on",
                "tx_esp_segmentation": "off [fixed]",
                "tx_fcoe_segmentation": "off [fixed]",
                "tx_gre_csum_segmentation": "off [fixed]",
                "tx_gre_segmentation": "off [fixed]",
                "tx_gso_list": "off [fixed]",
                "tx_gso_partial": "off [fixed]",
                "tx_gso_robust": "off [fixed]",
                "tx_ipxip4_segmentation": "off [fixed]",
                "tx_ipxip6_segmentation": "off [fixed]",
                "tx_lockless": "off [fixed]",
                "tx_nocache_copy": "off",
                "tx_scatter_gather": "on",
                "tx_scatter_gather_fraglist": "off [fixed]",
                "tx_sctp_segmentation": "off [fixed]",
                "tx_tcp6_segmentation": "off [fixed]",
                "tx_tcp_ecn_segmentation": "off [fixed]",
                "tx_tcp_mangleid_segmentation": "off",
                "tx_tcp_segmentation": "on",
                "tx_tunnel_remcsum_segmentation": "off [fixed]",
                "tx_udp_segmentation": "off [fixed]",
                "tx_udp_tnl_csum_segmentation": "off [fixed]",
                "tx_udp_tnl_segmentation": "off [fixed]",
                "tx_vlan_offload": "on [fixed]",
                "tx_vlan_stag_hw_insert": "off [fixed]",
                "vlan_challenged": "off [fixed]"
            },
            "hw_timestamp_filters": [],
            "ipv4": {
                "address": "192.168.0.3",
                "broadcast": "192.168.0.255",
                "netmask": "255.255.255.0",
                "network": "192.168.0.0",
                "prefix": "24"
            },
            "ipv6": [
                {
                    "address": "fe80::a00:27ff:fe27:ad8b",
                    "prefix": "64",
                    "scope": "link"
                }
            ],
            "macaddress": "08:00:27:27:ad:8b",
            "module": "e1000",
            "mtu": 1500,
            "pciid": "0000:00:08.0",
            "promisc": false,
            "speed": 1000,
            "timestamping": [],
            "type": "ether"
        },
        "ansible_env": {
            "DBUS_SESSION_BUS_ADDRESS": "unix:path=/run/user/1000/bus",
            "HOME": "/home/managenode02",
            "LANG": "en_US.UTF-8",
            "LOGNAME": "managenode02",
            "PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin",
            "PWD": "/home/managenode02",
            "SHELL": "/bin/bash",
            "SHLVL": "0",
            "SSH_CLIENT": "192.168.0.1 40428 22",
            "SSH_CONNECTION": "192.168.0.1 40428 192.168.0.3 22",
            "SSH_TTY": "/dev/pts/0",
            "TERM": "xterm-256color",
            "USER": "managenode02",
            "XDG_RUNTIME_DIR": "/run/user/1000",
            "XDG_SESSION_CLASS": "user",
            "XDG_SESSION_ID": "68",
            "XDG_SESSION_TYPE": "tty",
            "_": "/bin/sh"
        },
        "ansible_fibre_channel_wwn": [],
        "ansible_fips": false,
        "ansible_form_factor": "Other",
        "ansible_fqdn": "managenode02",
        "ansible_hostname": "managenode02",
        "ansible_hostnqn": "",
        "ansible_interfaces": [
            "lo",
            "enp0s8",
            "enp0s3"
        ],
        "ansible_is_chroot": false,
        "ansible_iscsi_iqn": "",
        "ansible_kernel": "6.8.0-52-generic",
        "ansible_kernel_version": "#53-Ubuntu SMP PREEMPT_DYNAMIC Sat Jan 11 00:06:25 UTC 2025",
        "ansible_lo": {
            "active": true,
            "device": "lo",
            "features": {
                "esp_hw_offload": "off [fixed]",
                "esp_tx_csum_hw_offload": "off [fixed]",
                "fcoe_mtu": "off [fixed]",
                "generic_receive_offload": "on",
                "generic_segmentation_offload": "on",
                "highdma": "on [fixed]",
                "hsr_dup_offload": "off [fixed]",
                "hsr_fwd_offload": "off [fixed]",
                "hsr_tag_ins_offload": "off [fixed]",
                "hsr_tag_rm_offload": "off [fixed]",
                "hw_tc_offload": "off [fixed]",
                "l2_fwd_offload": "off [fixed]",
                "large_receive_offload": "off [fixed]",
                "loopback": "on [fixed]",
                "macsec_hw_offload": "off [fixed]",
                "netns_local": "on [fixed]",
                "ntuple_filters": "off [fixed]",
                "receive_hashing": "off [fixed]",
                "rx_all": "off [fixed]",
                "rx_checksumming": "on [fixed]",
                "rx_fcs": "off [fixed]",
                "rx_gro_hw": "off [fixed]",
                "rx_gro_list": "off",
                "rx_udp_gro_forwarding": "off",
                "rx_udp_tunnel_port_offload": "off [fixed]",
                "rx_vlan_filter": "off [fixed]",
                "rx_vlan_offload": "off [fixed]",
                "rx_vlan_stag_filter": "off [fixed]",
                "rx_vlan_stag_hw_parse": "off [fixed]",
                "scatter_gather": "on",
                "tcp_segmentation_offload": "on",
                "tls_hw_record": "off [fixed]",
                "tls_hw_rx_offload": "off [fixed]",
                "tls_hw_tx_offload": "off [fixed]",
                "tx_checksum_fcoe_crc": "off [fixed]",
                "tx_checksum_ip_generic": "on [fixed]",
                "tx_checksum_ipv4": "off [fixed]",
                "tx_checksum_ipv6": "off [fixed]",
                "tx_checksum_sctp": "on [fixed]",
                "tx_checksumming": "on",
                "tx_esp_segmentation": "off [fixed]",
                "tx_fcoe_segmentation": "off [fixed]",
                "tx_gre_csum_segmentation": "off [fixed]",
                "tx_gre_segmentation": "off [fixed]",
                "tx_gso_list": "on",
                "tx_gso_partial": "off [fixed]",
                "tx_gso_robust": "off [fixed]",
                "tx_ipxip4_segmentation": "off [fixed]",
                "tx_ipxip6_segmentation": "off [fixed]",
                "tx_lockless": "on [fixed]",
                "tx_nocache_copy": "off [fixed]",
                "tx_scatter_gather": "on [fixed]",
                "tx_scatter_gather_fraglist": "on [fixed]",
                "tx_sctp_segmentation": "on",
                "tx_tcp6_segmentation": "on",
                "tx_tcp_ecn_segmentation": "on",
                "tx_tcp_mangleid_segmentation": "on",
                "tx_tcp_segmentation": "on",
                "tx_tunnel_remcsum_segmentation": "off [fixed]",
                "tx_udp_segmentation": "on",
                "tx_udp_tnl_csum_segmentation": "off [fixed]",
                "tx_udp_tnl_segmentation": "off [fixed]",
                "tx_vlan_offload": "off [fixed]",
                "tx_vlan_stag_hw_insert": "off [fixed]",
                "vlan_challenged": "on [fixed]"
            },
            "hw_timestamp_filters": [],
            "ipv4": {
                "address": "127.0.0.1",
                "broadcast": "",
                "netmask": "255.0.0.0",
                "network": "127.0.0.0",
                "prefix": "8"
            },
            "ipv6": [
                {
                    "address": "::1",
                    "prefix": "128",
                    "scope": "host"
                }
            ],
            "mtu": 65536,
            "promisc": false,
            "timestamping": [],
            "type": "loopback"
        },
        "ansible_loadavg": {
            "15m": 0.08837890625,
            "1m": 0.150390625,
            "5m": 0.11572265625
        },
        "ansible_local": {},
        "ansible_locally_reachable_ips": {
            "ipv4": [
                "10.0.2.15",
                "127.0.0.0/8",
                "127.0.0.1",
                "192.168.0.3"
            ],
            "ipv6": [
                "::1",
                "fe80::a00:27ff:fe27:ad8b",
                "fe80::a00:27ff:fe5b:7e34"
            ]
        },
        "ansible_lsb": {
            "codename": "noble",
            "description": "Ubuntu 24.04.1 LTS",
            "id": "Ubuntu",
            "major_release": "24",
            "release": "24.04"
        },
        "ansible_lvm": "N/A",
        "ansible_machine": "x86_64",
        "ansible_machine_id": "8d97620ddc1144a0b207b507debb3ab5",
        "ansible_memfree_mb": 916,
        "ansible_memory_mb": {
            "nocache": {
                "free": 3053,
                "used": 863
            },
            "real": {
                "free": 916,
                "total": 3916,
                "used": 3000
            },
            "swap": {
                "cached": 0,
                "free": 3915,
                "total": 3915,
                "used": 0
            }
        },
        "ansible_memtotal_mb": 3916,
        "ansible_mounts": [
            {
                "block_available": 3369205,
                "block_size": 4096,
                "block_total": 6405945,
                "block_used": 3036740,
                "device": "/dev/sda2",
                "dump": 0,
                "fstype": "ext4",
                "inode_available": 1427220,
                "inode_total": 1638400,
                "inode_used": 211180,
                "mount": "/",
                "options": "rw,relatime",
                "passno": 0,
                "size_available": 13800263680,
                "size_total": 26238750720,
                "uuid": "d1829088-8e84-4e56-9a58-0146089beaf2"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 1,
                "block_used": 1,
                "device": "/dev/loop0",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 29,
                "inode_used": 29,
                "mount": "/snap/bare/5",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 131072,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 592,
                "block_used": 592,
                "device": "/dev/loop2",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 14262,
                "inode_used": 14262,
                "mount": "/snap/core22/1748",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 77594624,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 591,
                "block_used": 591,
                "device": "/dev/loop1",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 14248,
                "inode_used": 14248,
                "mount": "/snap/core22/1722",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 77463552,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 2159,
                "block_used": 2159,
                "device": "/dev/loop3",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 816,
                "inode_used": 816,
                "mount": "/snap/firefox/4793",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 282984448,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 89,
                "block_used": 89,
                "device": "/dev/loop4",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 65,
                "inode_used": 65,
                "mount": "/snap/firmware-updater/147",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 11665408,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 90,
                "block_used": 90,
                "device": "/dev/loop6",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 65,
                "inode_used": 65,
                "mount": "/snap/firmware-updater/167",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 11796480,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 4041,
                "block_used": 4041,
                "device": "/dev/loop5",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 20797,
                "inode_used": 20797,
                "mount": "/snap/gnome-42-2204/176",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 529661952,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 734,
                "block_used": 734,
                "device": "/dev/loop7",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 76208,
                "inode_used": 76208,
                "mount": "/snap/gtk-common-themes/1535",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 96206848,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 311,
                "block_used": 311,
                "device": "/dev/loop8",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 651,
                "inode_used": 651,
                "mount": "/snap/snapd/21759",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 40763392,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 85,
                "block_used": 85,
                "device": "/dev/loop9",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 74,
                "inode_used": 74,
                "mount": "/snap/snap-store/1173",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 11141120,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 4,
                "block_used": 4,
                "device": "/dev/loop12",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 49,
                "inode_used": 49,
                "mount": "/snap/snapd-desktop-integration/178",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 524288,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 5,
                "block_used": 5,
                "device": "/dev/loop11",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 61,
                "inode_used": 61,
                "mount": "/snap/snapd-desktop-integration/253",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 655360,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 356,
                "block_used": 356,
                "device": "/dev/loop10",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 608,
                "inode_used": 608,
                "mount": "/snap/snapd/23545",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 46661632,
                "uuid": "N/A"
            },
            {
                "block_available": 0,
                "block_size": 131072,
                "block_total": 4129,
                "block_used": 4129,
                "device": "/dev/loop13",
                "dump": 0,
                "fstype": "squashfs",
                "inode_available": 0,
                "inode_total": 21133,
                "inode_used": 21133,
                "mount": "/snap/gnome-42-2204/202",
                "options": "ro,nodev,relatime,errors=continue,threads=single",
                "passno": 0,
                "size_available": 0,
                "size_total": 541196288,
                "uuid": "N/A"
            }
        ],
        "ansible_nodename": "managenode02",
        "ansible_os_family": "Debian",
        "ansible_pkg_mgr": "apt",
        "ansible_proc_cmdline": {
            "BOOT_IMAGE": "/boot/vmlinuz-6.8.0-52-generic",
            "quiet": true,
            "ro": true,
            "root": "UUID=d1829088-8e84-4e56-9a58-0146089beaf2",
            "splash": true
        },
        "ansible_processor": [
            "0",
            "AuthenticAMD",
            "AMD Ryzen 7 5800H with Radeon Graphics",
            "1",
            "AuthenticAMD",
            "AMD Ryzen 7 5800H with Radeon Graphics"
        ],
        "ansible_processor_cores": 2,
        "ansible_processor_count": 1,
        "ansible_processor_nproc": 2,
        "ansible_processor_threads_per_core": 1,
        "ansible_processor_vcpus": 2,
        "ansible_product_name": "VirtualBox",
        "ansible_product_serial": "NA",
        "ansible_product_uuid": "NA",
        "ansible_product_version": "1.2",
        "ansible_python": {
            "executable": "/usr/bin/python3.12",
            "has_sslcontext": true,
            "type": "cpython",
            "version": {
                "major": 3,
                "micro": 3,
                "minor": 12,
                "releaselevel": "final",
                "serial": 0
            },
            "version_info": [
                3,
                12,
                3,
                "final",
                0
            ]
        },
        "ansible_python_version": "3.12.3",
        "ansible_real_group_id": 1000,
        "ansible_real_user_id": 1000,
        "ansible_selinux": {
            "status": "disabled"
        },
        "ansible_selinux_python_present": true,
        "ansible_service_mgr": "systemd",
        "ansible_ssh_host_key_ecdsa_public": "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFEfBloX5tWx+GKuU0JXQjYxcC7HkUjPXP8K1j7RtldsdilxXSQ72Sgz4lxWi/np1PpmzNekBcFFCF+Cjs+z47g=",
        "ansible_ssh_host_key_ecdsa_public_keytype": "ecdsa-sha2-nistp256",
        "ansible_ssh_host_key_ed25519_public": "AAAAC3NzaC1lZDI1NTE5AAAAIBLAWmLXe3aJrZi8T/OXuFxyfBmSyzNlSj86gXPQi6t0",
        "ansible_ssh_host_key_ed25519_public_keytype": "ssh-ed25519",
        "ansible_ssh_host_key_rsa_public": "AAAAB3NzaC1yc2EAAAADAQABAAABgQCMDkBgzL025KTIyyTz1K5D4Nhzwute4zp18wU0jW0sCd/Wygt3CfvxRpNoiraDOJ5bmwEs+jLEUexLIZRRBIDvP2pEMDRxJ8kEoFuSwxk0Rhv9aZuLvNUY+By0yIKVdEJ8TZnLY9RAIzul5t0eYfUaLJZ1yGqwyh5H0EaZe5GDGXmx7Q2jUsvGbtroU3yMVUV2WI9s7UELMi5WjzLSdjP5P0nwnd0mU2Gok6ce9GUv/8utz6WhgoSwb4h28lLUKRRnzIRqlAegKQC+bmkEmASxVNWm8Y2vvon/xshKNXm93pMl1Af6/zDyQrHneKORo7MAs8i5HS1xDPFgLJMA3yHjPwz+y0AiOqYfAbLb00sI1WZuawWuvCy6QpLBsGi5TjiOvijSe7cwA0t4NvcIFUKn2lzsNEwD9QQF/1BibdLmET6FY6uqQqrHRnKWrgDaBLPMUf7i2Fdh9ztM46R7QnJhs/J2HLDVVydIRaY2DmUiJmhmsZedYsYSO/ISSa1Yd+0=",
        "ansible_ssh_host_key_rsa_public_keytype": "ssh-rsa",
        "ansible_swapfree_mb": 3915,
        "ansible_swaptotal_mb": 3915,
        "ansible_system": "Linux",
        "ansible_system_capabilities": [
            ""
        ],
        "ansible_system_capabilities_enforced": "True",
        "ansible_system_vendor": "innotek GmbH",
        "ansible_uptime_seconds": 12071,
        "ansible_user_dir": "/home/managenode02",
        "ansible_user_gecos": "managenode02",
        "ansible_user_gid": 1000,
        "ansible_user_id": "managenode02",
        "ansible_user_shell": "/bin/bash",
        "ansible_user_uid": 1000,
        "ansible_userspace_architecture": "x86_64",
        "ansible_userspace_bits": "64",
        "ansible_virtualization_role": "guest",
        "ansible_virtualization_tech_guest": [
            "virtualbox"
        ],
        "ansible_virtualization_tech_host": [],
        "ansible_virtualization_type": "virtualbox",
        "discovered_interpreter_python": "/usr/bin/python3.12",
        "gather_subset": [
            "all"
        ],
        "module_setup": true
    },
    "changed": false
}
```

``` ansible -i inventory/static_inventory all -m setup -a 'filter=ansible_distribution*' ```

```
managed_node01 | SUCCESS => {
    "ansible_facts": {
        "ansible_distribution": "Ubuntu",
        "ansible_distribution_file_parsed": true,
        "ansible_distribution_file_path": "/etc/os-release",
        "ansible_distribution_file_variety": "Debian",
        "ansible_distribution_major_version": "24",
        "ansible_distribution_release": "noble",
        "ansible_distribution_version": "24.04",
        "discovered_interpreter_python": "/usr/bin/python3.12"
    },
    "changed": false
}
[WARNING]: Platform linux on host managed_node02 is using the discovered Python
interpreter at /usr/bin/python3.12, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.17/reference_appendices/interpreter_discovery.html for more information.
managed_node02 | SUCCESS => {
    "ansible_facts": {
        "ansible_distribution": "Ubuntu",
        "ansible_distribution_file_parsed": true,
        "ansible_distribution_file_path": "/etc/os-release",
        "ansible_distribution_file_variety": "Debian",
        "ansible_distribution_major_version": "24",
        "ansible_distribution_release": "noble",
        "ansible_distribution_version": "24.04",
        "discovered_interpreter_python": "/usr/bin/python3.12"
    },
    "changed": false
}
```

### Deliverable 6

``` ansible-playbook -i inventory/static_inventory register.yml ```

```
PLAY [Capture and display output of df -h] *************************************

TASK [Gathering Facts] *********************************************************
[WARNING]: Platform linux on host managed_node02 is using the discovered Python
interpreter at /usr/bin/python3.12, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [managed_node02]
[WARNING]: Platform linux on host managed_node01 is using the discovered Python
interpreter at /usr/bin/python3.12, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [managed_node01]

TASK [Run df -h command to check disk usage] ***********************************
changed: [managed_node01]
changed: [managed_node02]

TASK [Display the output of df -h] *********************************************
ok: [managed_node01] => {
    "msg": "Filesystem      Size  Used Avail Use% Mounted on\ntmpfs           197M  1.6M  196M   1% /run\n/dev/sda2        25G  8.6G   15G  37% /\ntmpfs           984M     0  984M   0% /dev/shm\ntmpfs           5.0M  8.0K  5.0M   1% /run/lock\ntmpfs           197M  124K  197M   1% /run/user/1000"
}
ok: [managed_node02] => {
    "msg": "Filesystem      Size  Used Avail Use% Mounted on\ntmpfs           392M  1.6M  391M   1% /run\n/dev/sda2        25G   11G   13G  45% /\ntmpfs           2.0G     0  2.0G   0% /dev/shm\ntmpfs           5.0M  8.0K  5.0M   1% /run/lock\ntmpfs           392M  112K  392M   1% /run/user/1000"
}

PLAY RECAP *********************************************************************
managed_node01             : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
managed_node02             : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

### Deliverable 7

``` ---
- name: Declaring variables using multiple methods
  hosts: localhost, managed_node01

  # Method 1: Define a variable using the vars section (this will apply to both localhost and managed_node01)
  vars:
    var_from_vars_section: "Defined in vars section"
  
  tasks:
    - name: Display the variable defined in vars section
      debug:
        msg: "var_from_vars_section: {{ var_from_vars_section }}"

    # Method 2: Dynamically define a variable using set_fact
    - name: Set the variable using set_fact
      set_fact:
        var_from_set_fact: "Defined using set_fact"
    
    - name: Display the variable after set_fact
      debug:
        msg: "var_from_set_fact: {{ var_from_set_fact }}"

    # Method 3: Define a list of variables directly in a task
    - name: Define a list of variables and display one from the list
      set_fact:
        var_list:
          - var1: "Value for var1"
          - var2: "Value for var2"
          - var3: "Value for var3"
    
    - name: Display the second variable from the list
      debug:
        msg: "var_list[1].var2: {{ var_list[1].var2 }}"
 ```

```
PLAY [Declaring variables using multiple methods] ******************************

TASK [Gathering Facts] *********************************************************
ok: [localhost]
[WARNING]: Platform linux on host managed_node01 is using the discovered Python
interpreter at /usr/bin/python3.12, but future installation of another Python
interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [managed_node01]

TASK [Display the variable defined in vars section] ****************************
ok: [localhost] => {
    "msg": "var_from_vars_section: Defined in vars section"
}
ok: [managed_node01] => {
    "msg": "var_from_vars_section: Defined in vars section"
}

TASK [Set the variable using set_fact] *****************************************
ok: [localhost]
ok: [managed_node01]

TASK [Display the variable after set_fact] *************************************
ok: [localhost] => {
    "msg": "var_from_set_fact: Defined using set_fact"
}
ok: [managed_node01] => {
    "msg": "var_from_set_fact: Defined using set_fact"
}

TASK [Define a list of variables and display one from the list] ****************
ok: [localhost]
ok: [managed_node01]

TASK [Display the second variable from the list] *******************************
ok: [localhost] => {
    "msg": "var_list[1].var2: Value for var2"
}
ok: [managed_node01] => {
    "msg": "var_list[1].var2: Value for var2"
}

PLAY RECAP *********************************************************************
localhost                  : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
managed_node01             : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```


## Experience and Challenges

In this lab, I learned how to define and use variables and facts in Ansible. I used multiple methods for defining variables including using the vars section and using lists. I also used various method like setup to get facts (facts are usually information related to the system you are managing like the OS). I also used the debug module to print output or variables to the console.

### dificulties & solution:

At first I was having difficulties understanding the debug module and the msg parameters. I also struggled with syntax and formatting, I did not indent properly which caused my playbooks to not execute. I also struggled a bit with naming conventions, I tried naming a variable variable-1 and it threw and error, I later renamed it to variable_1.