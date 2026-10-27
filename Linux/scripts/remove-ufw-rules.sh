#!/bin/bash
# Remove all the rules from the ufw firewall that I have installed because ufw is not compatible with Docker
# The script takes one argument iptables or ip6tables depending on which list you would like to remove
# Be careful this script will remove all the ufw and ufw6 rules in your system


list=$1

#Remove rules that reference UFW chains from the built-in chains INPUT, FORWARD, and OUTPUT.
if [[ "${list}" == 'ip6tables' ]]; then
 for base in INPUT FORWARD OUTPUT; do
  sudo "${list}" -S "$base" |
     awk '$1 == "-A" && $0 ~ /-j ufw6-/ {
       sub(/^-A /, "-D ")
       print
     }' |
     while IFS= read -r rule; do
       read -r -a args <<< "$rule"
       sudo "${list}" "${args[@]}"
     done
  done
else
 for base in INPUT FORWARD OUTPUT; do
  sudo "${list}" -S "$base" |
     awk '$1 == "-A" && $0 ~ /-j ufw-/ {
       sub(/^-A /, "-D ")
       print
     }' |
     while IFS= read -r rule; do
       read -r -a args <<< "$rule"
       sudo "${list}" "${args[@]}"
     done
  done
fi


#Flush and delete the UFW-created chains whose names begin with ufw- or ufw6-.
if [[ "${list}" == 'ip6tables' ]]; then
 for chain in $(sudo "${list}" -S |
   awk '$1 == "-N" && $2 ~ /^ufw6-/ {print $2}'); do
   sudo "${list}" -F "$chain"
   sudo "${list}" -X "$chain"
 done
else
 for chain in $(sudo "${list}" -S |
   awk '$1 == "-N" && $2 ~ /^ufw-/ {print $2}'); do
   sudo "${list}" -F "$chain"
   sudo "${list}" -X "$chain"
 done
fi

