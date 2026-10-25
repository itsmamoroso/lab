# Procedure
*(Steps to complete the procedure, the whole story)*

**Objective:** Install git on the system and create a bare repository so the developers can collaborate on the same code as if it was github but in your internal server.

1. Connect to the server that will host the bare repository, is a linux server we use SSH protocol
```bash
ssh <user-name>@<host-ip-address>
```

2. Install git on the linux server, in this case is a .deb distro (as a best practice update && upgrade your system if is a new setup), and check the installation.
```bash
sudo apt update; sudo apt upgrade -y
sudo apt install git -y
git --version
```

3. Let's assume you have some users already created, to keep everything organized lets create a group with privileges to access the repo
```bash
sudo groupadd <group-name>
sudo usermod -aG <group-name> <user-account1>
sudo usermod -aG <group-name> <user-account2>
```

4. Create the bare repository in a specific location on the filesystem and provide only access to the group previously created users account and new entries inherit the directory's group
```bash
sudo mkdir -p /srv/git
sudo chown root:<group-name> /srv/git
sudo chmod 2770 /srv/git
sudo git init --bare --shared=group /srv/git/project.git
sudo chown -R root:<group-name> /srv/git/project.git
```

5. Test if the users account can access the repo (the SSH user account need to belong to the group-name)
```bash
git clone <user-account1>@<host-ip-address>:/srv/git/project.git
```


---

# Cleanup
*(Incase you want to undo all the procedure, clean start)*

1. Remove the git repository by deleting it (you can delete the whole path or just the project itself)
```bash
rm -rf /srv/git
rm -rf /srv/git/project.git
```

2. Uninstall git from the system, removes the dependencies and the config files that you don't need anymore
```bash
sudo apt autopurge git
```

3. Remove the group you created for easy management for the user accounts
```bash
sudo groupdel <group-name>
```

#git #remote-repo #linux
