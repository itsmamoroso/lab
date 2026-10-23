#!/bin/bash
# small script that will start automatically a new ssh-agent everytime I connect to the server if there is no a agent running.
# or it will delete any hangin session and create a new one when I connect to the server. 

# collect the pid of the agent and the key to add
pids=$(pgrep -u "$USER" -x ssh-agent)
key=~/.ssh/thor

# repeated code added to a function for further reuse
function ssh-call() {
  eval "$(ssh-agent -s)"
  ssh-add "$1"
}


# logic behind the script is a case construct with two cases
# an empty list or a list with elements with the catch all *
case "$pids" in
	"")
		ssh-call "$key"
		;;
	*)
		for pid in $pids; do
			kill "$pid"
			pids=$(pgrep -u "$USER" -x ssh-agent)
			if [[ -z ${pids} ]]; then
				ssh-call "$key"
			fi
		done
		;;
esac


#networking #linux #scripts 
