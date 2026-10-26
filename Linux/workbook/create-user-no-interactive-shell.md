# Procedure
*(Steps to complete the procedure, the whole story)*

**Objective:** Create a user account with no interactive shell this are useful for automation tasks or running commands on the background.

1. Connect to the remote server for the task requested, like most of the task it's always on some remote machine.
```bash
ssh <user-name>@<host-ip-address>
```

2. Create the user account with nologin shell for automation task or background progress.
```bash
sudo useradd -s /usr/sbin/nologin <user-name>
```

3. Double check if the account has been created with the no login privileges or you could try to login as the account.
```bash
cat /etc/passwd | grep -i <user-name>
sudo su - <user-name>
```

---

# Cleanup
*(Incase you want to undo all the procedure, clean start)*

1. Delete the user account that you just created nothing else is need to be perform, remove the home directory too.
```bash
sudo userdel -r <user-name>
```

#linux #automation #admin
