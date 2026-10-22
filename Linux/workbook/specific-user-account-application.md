# Procedure
*(Steps to complete the procedure, the whole story)*

**Objective:** Create an user account for a specific application with a unique UID and Home directory on a remote server.

1. Connect into the remote server with an SSH protocol in this case is username and password authentication.
```bash
ssh <user-name>@<host-ip-address>
```

2. Create the user with an specific UID and a specific Home, you need administration privileges to create users.
```bash
sudo useradd -u <UID> -d <home-path> <user-name>
```

3. Check if the user has been created with the specifics.
```bash
cat /etc/passwd | grep -i <user-name>
```

---

# Cleanup
*(Incase you want to undo all the procedure, clean start)*

1. Delete the user account and the home directory associated to it
```bash
sudo userdel -r <user-name>
```

#admin #security #linux
