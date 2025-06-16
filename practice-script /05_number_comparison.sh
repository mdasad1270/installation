#!/bin/bash

# Author Name :- Md Asad
# Date :- 16.06.2025
# Task :- Ask for two numbers and: Print which one is greater or if they are equal

read -p "Enter first number :- " num1
read -p "Enter second number :- " num2

if [ $num1 -gt $num2 ]
then
        echo "First number is greatest"
elif [ $num2 -gt $num1 ]
then
        echo "Second number is greatest"
else
        echo "Both are equal"
fi
