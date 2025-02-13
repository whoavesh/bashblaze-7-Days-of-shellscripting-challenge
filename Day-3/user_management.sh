#!/bin/bash

<<info 
This script allow you to manage users 
on this machine
info

#sudo useradd -m newuser -s /bin/bash

#passwd newuser


check_user () {

	chk_usr=$(cat /etc/passwd | grep -m 1 $uname | awk -F: '{print $1}')
        echo "$chk_usr"
        if [ "$uname" = "$chk_usr" ];
        then
                echo "Attention: User Already Exists"
                exit
	fi

}

echo "############# Options for User Management ###############"
echo -e "-c or --create -> To create new user\n-d or --delete -> To delete a user\n-l or --list -> To list all the users\n-r or --reset -> To change the user password\n-h or --help -> Display available commandline options "



read -p "Select the operation: " option


if [ "$option" == "-c" ] || [ "$option" == "--create" ]; 
then
	echo "####### User Creation Started ########"

	read -p "Enter username: " uname
	check_user
	read -p "Enter password for $uname: " pswd
	sudo useradd -m "$uname" -s /bin/bash
	echo -e "$pswd\n$pswd" | sudo passwd "$uname"

	echo "####### $uname User Created Successfully ########"


elif [ "$option" == "-d" ] || [ "$option" == "--delete" ];
then
	read -p "Enter user you want to delete: " uname

	sudo userdel "$uname"

	chk_usr=$(cat /etc/passwd | grep -m 1 $uname | awk -F: '{print $1}')
        echo "$chk_usr"
        if [ "$uname" != "$chk_usr" ];
        then
                echo "Attention: User Deleted Successfully"
                exit
	fi


elif [ "$option" == "-r" ] || [ "$option" == "--reset" ];
then 
	read -p "Enter user that password you want to reset: " uname
	read -p "Enter new password: " pswd
	echo "$uname:$pswd" | sudo chpasswd
	echo "Password reset successfully"



elif [ "$option" == "-l" ] || [ "$option" == "--list" ];
then
	echo "$(cat /etc/passwd | awk -F: '{print "User Name: "$1 ", " "UID: "$3}')"

elif [ "$option" == "-h" ] || [ "$option" == "--help" ];
then	
	echo -e "-c or --create -> To create new user\n-d or --delete -> To delete a user\n-l or --list -> To list all the users\n-r or --reset -> To change the user password\n-h or --help -> Display available commandline options "

else 
	echo "Choose and appropriate option"
fi	
