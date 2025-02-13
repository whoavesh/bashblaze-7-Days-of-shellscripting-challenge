#!/bin/bash


echo "Welcome to the Interactive File and Directory Explorer"

while true; 
do 
	cPath=$( pwd | ls -lh | awk '{ print "-",$9,"",$5 }' )
	echo "$cPath"
	read -p "Enter a line of text (Press Enter without text to exit): " utext
	
	#-z flag is a bash built in test, it checks whether the string is empty or not
	if [ -z "$utext" ];
	then
		echo "Exiting the Interactive Explorer. Goodbye!"
		break
	fi

	#-n flag do not output the trailing new line 
	#echo (by default) puts a new line at the end of the text, so using -n flag will remove it
	#and when we do wc it will not count new line and provide (exact word count) 
	echo "Character Count: $( echo -n "$utext" | wc -m )"
done
