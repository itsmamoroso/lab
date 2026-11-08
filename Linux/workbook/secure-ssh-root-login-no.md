# Procedure
*(Steps to complete the procedure, the whole story)*

**Objective:** Disable SSH root login preventing possible super user access points

1. Connect to the server for the specific task your team has requested.
```bash
ssh <user-name>@<ip-address>
```

2. Modify the following file sshd_config and subfiles under the sshd_config.d, you will need sudo privileges, change all the PermitRootLogin to no, if is commented uncommented an set it to no because the default options is accept login not by password.
```bash
sudo vi /etc/ssh/sshd_config
PermitRootLogin no
```

3. Restart the service ssh.service so the changes take place, keep in mind the name of the service can change depending on the distro.
```bash
sudo systemctl restart ssh.service
```

---

# Cleanup
*(Incase you want to undo all the procedure, clean start)*

1. Change the PermitRootLogin to the previous state to undo the process or un comment it.
```bash
sudo vi /etc/ssh/sshd_config
PermitRootLogin yes
```
#linux #security #networking
