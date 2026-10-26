# Procedure
*(Steps to complete the procedure, the whole story)*

**Objective:** Creates a service account with no home directory, the only actual difference with a user account is the UID and maybe not having an interactive shell in this case we just make it without the home directory.

1. SSH to connect to the server
```bash
ssh <user-name>@<ip-address>
```

2. Create the user account with no home directory
```bash
sudo useradd -M <user-name>
```

3. Check with a grep for the user name that you just created on the /etc/passwd file, it should have a empty field on the home directory.
```bash
cat /etc/passwd | grep -i <user-name>
```

---

# Cleanup
*(Incase you want to undo all the procedure, clean start)*

1. Delete the account that you previously created
```bash
sudo userdel <user-name>
```

#linux #SSH #admin
