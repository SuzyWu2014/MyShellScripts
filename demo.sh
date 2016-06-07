#!/bin/bash
#Program:
#      This program demos the bash major syntax
#History:
# 2016/06/06 Shujin Wu Version 1.0

echo -e "Hello~ \n"  
# -e: enable interpretation of the backslash-escaped characters in the string
# -E: Disable backslash in the string

# get input from user
read -p "Please input your first name: " firstname
read -p "Please input your last name: " lastname
echo -e "\nYour full name is: " $firstname $lastname 

# date
read -p "Please input your filename: " fileuser
filename=${fileuser:-"myfilename"} 
# : if fileuser is not set, use 'myfilename' as filename
date1 = $(date --date='1 days ago'+%Y%m%d) 
date2 = $(date --date='1 days ago'+%Y%m%d)		
date3 = $(date + %Y%m%d) 						# today
file1 = ${filename}${date1}
touch "$file1"

# Arithmetic operations 
echo $((13%3)) # +, -, *, /, %

exit 0