# This is the main template for Amazon linux compliance

  
  
  
  
  
  
  
  
  

| CIS ID    | Message                                      | Value                            | Expected Value         | Result               |
|-----------|----------------------------------------------|----------------------------------|-------------------------|----------------------|
| 1.2.2     | Enable gpgcheck for package signing          | gpgcheck=1 | gpgcheck=1              | COMPLIANT ✅|
| 1.4.1     | Enable ASLR                                  | kernel.randomize_va_space = 2    | kernel.randomize_va_space = 2 | COMPLIANT ✅ |
| 4.2.19    | Disable empty SSH passwords                  | PermitEmptyPasswords no | PermitEmptyPasswords no| COMPLIANT ✅|
| 4.2.20    | Disable root SSH login                       | PermitRootLogin no | PermitRootLogin no     | COMPLIANT ✅|
| 4.2.7     | Set ClientAliveInterval                      | ClientAliveInterval 300 | 300            | COMPLIANT ✅|
| 4.2.7     | Set ClientAliveCountMax                      | ClientAliveCountMax 0 | 0               | COMPLIANT ✅|
| 3.3.1     | Disable IP forwarding                        | net.ipv4.ip_forward = 0    | net.ipv4.ip_forward = 0 | COMPLIANT ✅|
| 3.3.5     | Disable ICMP redirects (all & default)       | all=net.ipv4.conf.all.accept_redirects = 0, default=net.ipv4.conf.default.accept_redirects = 0 | 0 | COMPLIANT ✅|
| 5.2.1.4   | Ensure auditd service is enabled and running | enabled=enabled, active=active | enabled & active | COMPLIANT ✅ |

