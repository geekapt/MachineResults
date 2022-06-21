#!/bin/bash

# create numerical list using crunch

echo "[-] Creating a numerical list for bruteforcing zip files"
crunch 1 6 0123456789 -o num.list &>/dev/null

# running fcrackzip as long if needed
echo "[-] fcrackzip started to bruteforce using the num.list"

while [[ true ]]; do
	file=$(ls | grep zip)
	fcrackzip -u -D -p num.list $file > result
	pass=$(cat result | tr -d '\n' | awk '{print $5}')
	result=$(cat result | tr -d '\n' | grep FOUND)
		if [[ -z $result ]]; then
			echo "No password found in file $file"
			break 2
		else
			echo "Password found in the file $file == $pass"
			unzip -q -P "$pass" "$file"
			rm $file
		fi
	done


