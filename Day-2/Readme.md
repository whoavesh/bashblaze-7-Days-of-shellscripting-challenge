
# Day 2 Bash Scripting Challenge - Interactive File and Directory Explorer

Welcome to Day 2 of the Bash Scripting Challenge! In this challenge, you will create a bash script that serves as an interactive file and directory explorer. The script will allow you to explore the files and directories in the current path and provide a character counting feature for the user's input.

## Challenge Description

The script will have two main parts:

### Part 1: File and Directory Exploration

1. Upon execution without any command-line arguments, the script will display a welcome message and list all the files and directories in the current path.
2. For each file and directory, the script will print its name and size in human-readable format (e.g., KB, MB, GB). This information will be obtained using the `ls` command with appropriate options.
3. The list of files and directories will be displayed in a loop until the user decides to exit the explorer.

### Part 2: Character Counting

1. After displaying the file and directory list, the script will prompt the user to enter a line of text.
2. The script will read the user's input until an empty string is entered (i.e., the user presses Enter without any text).
3. For each line of text entered by the user, the script will count the number of characters in that line.
4. The character count for each line entered by the user will be displayed.

# Directory Backup with Rotation

This is another challenge for Day 2 of the Bash Scripting Challenge! In this challenge, you will create a bash script that performs a backup of a specified directory and implements a rotation mechanism to manage backups.

## Challenge Description

Your task is to create a bash script that takes a directory path as a command-line argument and performs a backup of the directory. The script should create timestamped backup folders and copy all the files from the specified directory into the backup folder.

Additionally, the script should implement a rotation mechanism to keep only the last 3 backups. This means that if there are more than 3 backup folders, the oldest backup folders should be removed to ensure only the most recent backups are retained.

> The script will create a timestamped backup folder inside the specified directory and copy all the files into it. It will also check for existing backup folders and remove the oldest backups to keep only the last 3 backups.

## Example Usage

Assume the script is named `backup_with_rotation.sh`. Here's an example of how it will look,
also assuming the script is executed with the following commands on different dates:

1. First Execution (2023-07-30):

```
$ ./backup_with_rotation.sh /home/user/documents
```

Output:

```
Backup created: /home/user/documents/backup_2023-07-30_12-30-45
Backup created: /home/user/documents/backup_2023-07-30_15-20-10
Backup created: /home/user/documents/backup_2023-07-30_18-40-55
```

After this execution, the /home/user/documents directory will contain the following items:

```
backup_2023-07-30_12-30-45
backup_2023-07-30_15-20-10
backup_2023-07-30_18-40-55
file1.txt
file2.txt
...
```

2. Second Execution (2023-08-01):

```
$ ./backup_with_rotation.sh /home/user/documents
```

Output:

```
Backup created: /home/user/documents/backup_2023-08-01_09-15-30
```

After this execution, the /home/user/documents directory will contain the following items:

```
backup_2023-07-30_15-20-10
backup_2023-07-30_18-40-55
backup_2023-08-01_09-15-30
file1.txt
file2.txt
...
```

In this example, the script creates backup folders with timestamped names and retains only the last 3 backups while removing the older backups.

