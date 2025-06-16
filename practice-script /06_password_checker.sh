#!/bin/bash

# Author Name :- Md Asad
# Date :- 16.06.2025


read -sp "Enter your password: " password
echo

if [ "$password" = "admin123" ]
then
    echo "Access granted ✅"
else
    echo "Access denied ❌"
fi
