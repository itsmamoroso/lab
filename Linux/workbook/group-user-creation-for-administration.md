# Procedure
*(Steps to complete the procedure, the whole story)*

**Objective:** Create a group and user account for easy management and privileges organization down the line on three different servers

1. Connect into the remote server with an SSH protocol in this case is username and password authentication.
```bash
ssh <user-name>@<host-ip-address>
```

2. Create the desired group for granular permission granting for all the user associated to that group.
```bash
sudo groupadd <group-name>
```

3. Create the first user associated to the previous group, you can repeat this command for any other non existent account that you need to create and add to the group.
```bash
sudo adduser -G <group-name> <user-account>
```

in case that the users have been crated already
```bash
sudo usermod -aG <group-name> <user-account>
```

4. Check if the user has been created.
```bash
cat /etc/passwd | grep -i <user-name>
```

5. Check if the user has the group assigned to it.
```bash
id <user-name>
```


---

# Cleanup
*(Incase you want to undo all the procedure, clean start)*

1. Delete the user account and the home directory associated to it.
```bash
sudo userdel -r <user-name>
```

2. Delete the group that you previously created for the specific users.
```bash
sudo groupdel <group-name>
```

#linux #administration #ssh
