# Procedure
*(Steps to complete the procedure, the whole story)*

**Objective:** An user has misplace multiple files under the wrong directory and now the files are all mixed together with the application files, move the users files out of the application folder.

1. Access the requested host server
```bash
ssh <user-name>@<ip-address>
```

2. Move to the application directory so you can find all the misplace files and move then from the application directory, you need the username account or the UID of the user account, I would copy the files first to the target directory in that way we can double check if we made a correct command execution
```bash
cd /opt/lib/my-application
id <user-name> # this will show the UID GUID and other groups
find . -user <UID or user-name> -type f -exec cp --parents -t /target/directory {} +
```

3. Now check if all the files are moved into the target/directory, show a list structure so you can check the owner of the files
```bash
ls -l /target/directory
```

4. Now that all the files have been copy to the correct directory you can remove all the misplace files on the previous directory
```bash
find /opt/lib/my-application -user <user-name> -exec rm -rf {} +
```

---

# Cleanup
*(Incase you want to undo all the procedure, clean start)*

1. If you need to clean up anything would be the already moved files, so you can use this
```bash
rm -rf /target/directory
```

#linux #admin #files
