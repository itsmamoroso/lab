# Procedure
*(Steps to complete the procedure, the whole story)*

**Objective:** Create a temp account that will allow an user to access the system before the expiration date stablished

1. Connect to the server for the specific task your team has requested
```bash
ssh <user-name>@<ip-address>
```

2. Create the user account with the expiration date
```bash
sudo useradd -e <YYYY-MM-DD> <user-name>
```

3. Check if the user account has the correct expiration date, after the expiration date the user account will not have access to the system
```bash
sudo chage -l <user-name>
```

---

# Cleanup
*(Incase you want to undo all the procedure, clean start)*

1. After the expiration date you just need to delete the user account
```bash
sudo userdel -r <user-name>
```

#linux #admin #SSH
