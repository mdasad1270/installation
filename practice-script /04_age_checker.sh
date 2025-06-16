#!/bin/bash

# Author Name :- Md Asad
# Date :- 16.06.2025

read -p "Enter your age :- " age

if [ $age -lt 18 ]
then
        echo "You are a minor"
elif [ $age -eq 18 ]
then
        echo "You just became an adult!"
else
        echo "You are an adult."
fi
