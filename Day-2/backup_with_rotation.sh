#!/bin/bash


<<info 
This script take rotational
backups 
info

#zip /home/ubuntu/documents/backups_<timestamp>.zip /home/ubuntu/scripts

timestamp=$(date '+%Y-%m-%d-%H-%M-%S')

#echo "$timestamp"

echo "########## Backup Started ###########"

zip -r "$1"/backups_"$timestamp" $1 >> /dev/null

echo "Backup created: $1/backups_$timestamp"


echo -e "########## Backup Complete ########### \n"
#rotation logic

<<help
creates an array named backups
and store all the values starting from passedargument/backups_
in an array

Stores all the backuped zip files in an array
help
backups=($(ls -t "$1/backups_"*)) 
#echo "$backups"

#echo -e "${#backups[@]}"

#echo "${backups[@]:3}"


# the # symbol is used to get the total no. of elements stored in an array (backups)

# the @ symbol is used to get all the elements of array

if [ "${#backups[@]}" -gt 3 ];
then
	echo -e "more than 3 backups found....\n"


	echo "########## Removing Old Backups ###########"
	# removes all the backups started from array index 3
	# to keep only the latest backups
	rm_backups="${backups[@]:3}"
	echo "$rm_backups"
	rm -rf "$rm_backups"
	echo "########## Old Backups Removed ###########"
fi


